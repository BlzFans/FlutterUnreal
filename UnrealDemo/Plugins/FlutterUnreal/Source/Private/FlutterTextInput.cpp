
#include "FlutterTextInput.h"
#include "Containers/StringConv.h"
#include "ThirdParty/flutter_engine/flutter_embedder.h"

#include "FlutterEmbeder.h"
#include "FlutterKeyboard.h"

#include <string>

#define RAPIDJSON_HAS_STDSTRING 1
#ifdef _MSC_VER
#pragma warning(push)
#pragma warning(disable: 4996)
#pragma warning(disable: 5054) //deprecated between enumerations of different types
#include "ThirdParty/rapidjson/document.h"
#include "ThirdParty/rapidjson/error/en.h"
#include "ThirdParty/rapidjson/prettywriter.h"
#pragma warning(pop)
#else
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
#include "ThirdParty/rapidjson/document.h"
#include "ThirdParty/rapidjson/error/en.h"
#include "ThirdParty/rapidjson/prettywriter.h"
#pragma GCC diagnostic pop
#endif

constexpr char kMessageMethodKey[] = "method";
constexpr char kMessageArgumentsKey[] = "args";

// Returns a UTF-8 encoded equivalent of a UTF-16 encoded input string.
std::string Utf16ToUtf8(const std::u16string& string)
{
    if (string.empty())
        return std::string();

    FString s(string.size(), (TCHAR*)string.c_str());
    std::string str = TCHAR_TO_UTF8(*s);
    return str;
}

// Returns a UTF-16 encoded equivalent of a UTF-8 encoded input string.
std::u16string Utf8ToUtf16(const std::string& string)
{
    if (string.empty())
        return std::u16string();

    FString s(UTF8_TO_TCHAR(string.c_str()));
    return std::u16string((char16_t*)GetData(s));
}

// Returns true if |code_point| is a leading surrogate of a surrogate pair.
bool IsLeadingSurrogate(char32_t code_point) {
    return (code_point & 0xFFFFFC00) == 0xD800;
}
// Returns true if |code_point| is a trailing surrogate of a surrogate pair.
bool IsTrailingSurrogate(char32_t code_point) {
    return (code_point & 0xFFFFFC00) == 0xDC00;
}

FlutterTextInputModel::FlutterTextInputModel() = default;

FlutterTextInputModel::~FlutterTextInputModel() = default;

bool FlutterTextInputModel::SetText(const std::string& text,
    const FlutterTextRange& selection,
    const FlutterTextRange& composing_range) {
    text_ = Utf8ToUtf16(text);
    if (!text_range().Contains(selection) ||
        !text_range().Contains(composing_range)) {
        return false;
    }

    selection_ = selection;
    composing_range_ = composing_range;
    composing_ = !composing_range.collapsed();
    return true;
}

bool FlutterTextInputModel::SetSelection(const FlutterTextRange& range) {
    if (composing_ && !range.collapsed()) {
        return false;
    }
    if (!editable_range().Contains(range)) {
        return false;
    }
    selection_ = range;
    return true;
}

bool FlutterTextInputModel::SetComposingRange(const FlutterTextRange& range,
    size_t cursor_offset) {
    if (!composing_ || !text_range().Contains(range)) {
        return false;
    }
    composing_range_ = range;
    selection_ = FlutterTextRange(range.start() + cursor_offset);
    return true;
}

void FlutterTextInputModel::BeginComposing() {
    composing_ = true;
    composing_range_ = FlutterTextRange(selection_.start());
}

void FlutterTextInputModel::UpdateComposingText(const std::u16string& text) {
    // Preserve selection if we get a no-op update to the composing region.
    if (text.length() == 0 && composing_range_.collapsed()) {
        return;
    }
    DeleteSelected();
    text_.replace(composing_range_.start(), composing_range_.length(), text);
    composing_range_.set_end(composing_range_.start() + text.length());
    selection_ = FlutterTextRange(composing_range_.end());
}

void FlutterTextInputModel::UpdateComposingText(const std::string& text) {
    UpdateComposingText(Utf8ToUtf16(text));
}

void FlutterTextInputModel::CommitComposing() {
    // Preserve selection if no composing text was entered.
    if (composing_range_.collapsed()) {
        return;
    }
    composing_range_ = FlutterTextRange(composing_range_.end());
    selection_ = composing_range_;
}

void FlutterTextInputModel::EndComposing() {
    composing_ = false;
    composing_range_ = FlutterTextRange(0);
}

bool FlutterTextInputModel::DeleteSelected() {
    if (selection_.collapsed()) {
        return false;
    }
    size_t start = selection_.start();
    text_.erase(start, selection_.length());
    selection_ = FlutterTextRange(start);
    if (composing_) {
        // This occurs only immediately after composing has begun with a selection.
        composing_range_ = selection_;
    }
    return true;
}

void FlutterTextInputModel::AddCodePoint(char32_t c) {
    if (c <= 0xFFFF) {
        AddText(std::u16string({ static_cast<char16_t>(c) }));
    }
    else {
        char32_t to_decompose = c - 0x10000;
        AddText(std::u16string({
            // High surrogate.
            static_cast<char16_t>((to_decompose >> 10) + 0xd800),
            // Low surrogate.
            static_cast<char16_t>((to_decompose % 0x400) + 0xdc00),
            }));
    }
}

void FlutterTextInputModel::AddText(const std::u16string& text) {
    DeleteSelected();
    if (composing_) {
        // Delete the current composing text, set the cursor to composing start.
        text_.erase(composing_range_.start(), composing_range_.length());
        selection_ = FlutterTextRange(composing_range_.start());
        composing_range_.set_end(composing_range_.start() + text.length());
    }
    size_t position = selection_.position();
    text_.insert(position, text);
    selection_ = FlutterTextRange(position + text.length());
}

void FlutterTextInputModel::AddText(const std::string& text) {
    AddText(Utf8ToUtf16(text));
}

bool FlutterTextInputModel::Backspace() {
    if (DeleteSelected()) {
        return true;
    }
    // There is no selection. Delete the preceding codepoint.
    size_t position = selection_.position();
    if (position != editable_range().start()) {
        int count = IsTrailingSurrogate(text_.at(position - 1)) ? 2 : 1;
        text_.erase(position - count, count);
        selection_ = FlutterTextRange(position - count);
        if (composing_) {
            composing_range_.set_end(composing_range_.end() - count);
        }
        return true;
    }
    return false;
}

bool FlutterTextInputModel::Delete() {
    if (DeleteSelected()) {
        return true;
    }
    // There is no selection. Delete the preceding codepoint.
    size_t position = selection_.position();
    if (position < editable_range().end()) {
        int count = IsLeadingSurrogate(text_.at(position)) ? 2 : 1;
        text_.erase(position, count);
        if (composing_) {
            composing_range_.set_end(composing_range_.end() - count);
        }
        return true;
    }
    return false;
}

bool FlutterTextInputModel::DeleteSurrounding(int offset_from_cursor, int count) {
    size_t max_pos = editable_range().end();
    size_t start = selection_.extent();
    if (offset_from_cursor < 0) {
        for (int i = 0; i < -offset_from_cursor; i++) {
            // If requested start is before the available text then reduce the
            // number of characters to delete.
            if (start == editable_range().start()) {
                count = i;
                break;
            }
            start -= IsTrailingSurrogate(text_.at(start - 1)) ? 2 : 1;
        }
    }
    else {
        for (int i = 0; i < offset_from_cursor && start != max_pos; i++) {
            start += IsLeadingSurrogate(text_.at(start)) ? 2 : 1;
        }
    }

    auto end = start;
    for (int i = 0; i < count && end != max_pos; i++) {
        end += IsLeadingSurrogate(text_.at(start)) ? 2 : 1;
    }

    if (start == end) {
        return false;
    }

    auto deleted_length = end - start;
    text_.erase(start, deleted_length);

    // Cursor moves only if deleted area is before it.
    selection_ = FlutterTextRange(offset_from_cursor <= 0 ? start : selection_.start());

    // Adjust composing range.
    if (composing_) {
        composing_range_.set_end(composing_range_.end() - deleted_length);
    }
    return true;
}

bool FlutterTextInputModel::MoveCursorToBeginning() {
    size_t min_pos = editable_range().start();
    if (selection_.collapsed() && selection_.position() == min_pos) {
        return false;
    }
    selection_ = FlutterTextRange(min_pos);
    return true;
}

bool FlutterTextInputModel::MoveCursorToEnd() {
    size_t max_pos = editable_range().end();
    if (selection_.collapsed() && selection_.position() == max_pos) {
        return false;
    }
    selection_ = FlutterTextRange(max_pos);
    return true;
}

bool FlutterTextInputModel::SelectToBeginning() {
    size_t min_pos = editable_range().start();
    if (selection_.collapsed() && selection_.position() == min_pos) {
        return false;
    }
    selection_ = FlutterTextRange(selection_.base(), min_pos);
    return true;
}

bool FlutterTextInputModel::SelectToEnd() {
    size_t max_pos = editable_range().end();
    if (selection_.collapsed() && selection_.position() == max_pos) {
        return false;
    }
    selection_ = FlutterTextRange(selection_.base(), max_pos);
    return true;
}

bool FlutterTextInputModel::MoveCursorForward() {
    // If there's a selection, move to the end of the selection.
    if (!selection_.collapsed()) {
        selection_ = FlutterTextRange(selection_.end());
        return true;
    }
    // Otherwise, move the cursor forward.
    size_t position = selection_.position();
    if (position != editable_range().end()) {
        int count = IsLeadingSurrogate(text_.at(position)) ? 2 : 1;
        selection_ = FlutterTextRange(position + count);
        return true;
    }
    return false;
}

bool FlutterTextInputModel::MoveCursorBack() {
    // If there's a selection, move to the beginning of the selection.
    if (!selection_.collapsed()) {
        selection_ = FlutterTextRange(selection_.start());
        return true;
    }
    // Otherwise, move the cursor backward.
    size_t position = selection_.position();
    if (position != editable_range().start()) {
        int count = IsTrailingSurrogate(text_.at(position - 1)) ? 2 : 1;
        selection_ = FlutterTextRange(position - count);
        return true;
    }
    return false;
}

std::string FlutterTextInputModel::GetText() const {
    return Utf16ToUtf8(text_);
}

int FlutterTextInputModel::GetCursorOffset() const {
    // Measure the length of the current text up to the selection extent.
    // There is probably a much more efficient way of doing this.
    auto leading_text = text_.substr(0, selection_.extent());
    return (int)Utf16ToUtf8(leading_text).size();
}



static constexpr char kSetEditingStateMethod[] = "TextInput.setEditingState";
static constexpr char kClearClientMethod[] = "TextInput.clearClient";
static constexpr char kSetClientMethod[] = "TextInput.setClient";
static constexpr char kShowMethod[] = "TextInput.show";
static constexpr char kHideMethod[] = "TextInput.hide";

static constexpr char kMultilineInputType[] = "TextInputType.multiline";

static constexpr char kUpdateEditingStateMethod[] = "TextInputClient.updateEditingState";
static constexpr char kPerformActionMethod[] = "TextInputClient.performAction";

static constexpr char kTextInputAction[] = "inputAction";
static constexpr char kTextInputType[] = "inputType";
static constexpr char kTextInputTypeName[] = "name";
static constexpr char kComposingBaseKey[] = "composingBase";
static constexpr char kComposingExtentKey[] = "composingExtent";
static constexpr char kSelectionAffinityKey[] = "selectionAffinity";
static constexpr char kAffinityDownstream[] = "TextAffinity.downstream";
static constexpr char kSelectionBaseKey[] = "selectionBase";
static constexpr char kSelectionExtentKey[] = "selectionExtent";
static constexpr char kSelectionIsDirectionalKey[] = "selectionIsDirectional";
static constexpr char kTextKey[] = "text";

static constexpr char kChannelName[] = "flutter/textinput";

static constexpr char kBadArgumentError[] = "Bad Arguments";
static constexpr char kInternalConsistencyError[] = "Internal Consistency Error";

FlutterTextInputPlugin& FlutterTextInputPlugin::GetInstance()
{
    static FlutterTextInputPlugin sInstance;
    return sInstance;
}

const char* FlutterTextInputPlugin::GetChannelName()
{
    return kChannelName;
}

void FlutterTextInputPlugin::CharHook(unsigned int code_point) {
    if (active_model_ == nullptr) {
        return;
    }
    active_model_->AddCodePoint(code_point);
    SendStateUpdate(*active_model_);
}

void FlutterTextInputPlugin::KeyboardHook(uint16_t key, bool down, bool repeat) {
    if (active_model_ == nullptr) {
        return;
    }

    if (down || repeat) {
        switch (key) {
        case KEY_LEFT:
            if (active_model_->MoveCursorBack()) {
                SendStateUpdate(*active_model_);
            }
            break;
        case KEY_RIGHT:
            if (active_model_->MoveCursorForward()) {
                SendStateUpdate(*active_model_);
            }
            break;
        case KEY_END:
            active_model_->MoveCursorToEnd();
            SendStateUpdate(*active_model_);
            break;
        case KEY_HOME:
            active_model_->MoveCursorToBeginning();
            SendStateUpdate(*active_model_);
            break;
        case KEY_BACKSPACE:
            if (active_model_->Backspace()) {
                SendStateUpdate(*active_model_);
            }
            break;
        case KEY_DELETE:
            if (active_model_->Delete()) {
                SendStateUpdate(*active_model_);
            }
            break;
        case KEY_RETURN:
            EnterPressed(active_model_.get());
            break;
        default:
            break;
        }
    }
}

FlutterTextInputPlugin::FlutterTextInputPlugin() = default;
FlutterTextInputPlugin::~FlutterTextInputPlugin() = default;

void FlutterTextInputPlugin::HandleMessage(const FlutterPlatformMessage* message)
{
    rapidjson::Document document;
    document.Parse((const char*)message->message, message->message_size);

    auto name_iter = document.FindMember("method");
    if (name_iter == document.MemberEnd()) {
        return;
    }

    std::string method = name_iter->value.GetString();

    rapidjson::Document args;
    auto args_itr = document.FindMember("args");
    if (args_itr != document.MemberEnd())
        args.Swap(args_itr->value);

    if (method.compare(kShowMethod) == 0 || method.compare(kHideMethod) == 0) {
        // These methods are no-ops.
    }
    else if (method.compare(kClearClientMethod) == 0) {
        active_model_ = nullptr;
    }
    else if (method.compare(kSetClientMethod) == 0) {
        // TODO(awdavies): There's quite a wealth of arguments supplied with this
        // method, and they should be inspected/used.
        const rapidjson::Value& client_id_json = args[0];
        const rapidjson::Value& client_config = args[1];
        if (client_id_json.IsNull()) {
            checkf(false, TEXT("Could not set client, ID is null."));
            return;
        }

        if (client_config.IsNull()) {
            checkf(false, TEXT("Could not set client, missing arguments."));
            return;
        }

        client_id_ = client_id_json.GetInt();
        input_action_ = "";
        auto input_action_json = client_config.FindMember(kTextInputAction);
        if (input_action_json != client_config.MemberEnd() &&
            input_action_json->value.IsString()) {
            input_action_ = input_action_json->value.GetString();
        }
        input_type_ = "";
        auto input_type_info_json = client_config.FindMember(kTextInputType);
        if (input_type_info_json != client_config.MemberEnd() &&
            input_type_info_json->value.IsObject()) {
            auto input_type_json =
                input_type_info_json->value.FindMember(kTextInputTypeName);
            if (input_type_json != input_type_info_json->value.MemberEnd() &&
                input_type_json->value.IsString()) {
                input_type_ = input_type_json->value.GetString();
            }
        }
        active_model_ = std::make_unique<FlutterTextInputModel>();
    }
    else if (method.compare(kSetEditingStateMethod) == 0) {
        if (active_model_ == nullptr) {
            checkf(false, TEXT("Set editing state has been invoked, but no client is set."));
            return;
        }
        auto text = args.FindMember(kTextKey);
        if (text == args.MemberEnd() || text->value.IsNull()) {
            checkf(false, TEXT("Set editing state has been invoked, but without text."));
            return;
        }
        auto selection_base = args.FindMember(kSelectionBaseKey);
        auto selection_extent = args.FindMember(kSelectionExtentKey);
        if (selection_base == args.MemberEnd() || selection_base->value.IsNull() ||
            selection_extent == args.MemberEnd() ||
            selection_extent->value.IsNull()) {
            checkf(false, TEXT("Selection base/extent values invalid."));
            return;
        }
        // Flutter uses -1/-1 for invalid; translate that to 0/0 for the model.
        int base = selection_base->value.GetInt();
        int extent = selection_extent->value.GetInt();
        if (base == -1 && extent == -1) {
            base = extent = 0;
        }
        active_model_->SetText(text->value.GetString());
        active_model_->SetSelection(FlutterTextRange(base, extent));
    }
    else {
        //check(false, TEXT("NotImplemented"));
        return;
    }
}

static void sendMessage(const char* method, rapidjson::Document* document)
{
    //EncodeMethod
    rapidjson::Document message(rapidjson::kObjectType);
    auto& allocator = message.GetAllocator();
    rapidjson::Value name(method, allocator);

    rapidjson::Value arguments;
    //arguments.CopyFrom(*document, allocator);
    arguments.Swap(*document);

    message.AddMember(kMessageMethodKey, name, allocator);
    message.AddMember(kMessageArgumentsKey, arguments, allocator);

    //EncodeMessage
    rapidjson::StringBuffer buffer;
    rapidjson::Writer<rapidjson::StringBuffer> writer(buffer);
    // clang-tidy has trouble reasoning about some of the complicated array and
    // pointer-arithmetic code in rapidjson.
    // NOLINTNEXTLINE(clang-analyzer-core.*)
    message.Accept(writer);
    const char* buffer_start = buffer.GetString();

    //Send
    flutterSendMessage(kChannelName, buffer_start, (uint32_t)buffer.GetSize());
}

void FlutterTextInputPlugin::SendStateUpdate(const FlutterTextInputModel& model) {
    auto args = std::make_unique<rapidjson::Document>(rapidjson::kArrayType);
    auto& allocator = args->GetAllocator();
    args->PushBack(client_id_, allocator);

    FlutterTextRange selection = model.selection();
    rapidjson::Value editing_state(rapidjson::kObjectType);
    editing_state.AddMember(kComposingBaseKey, -1, allocator);
    editing_state.AddMember(kComposingExtentKey, -1, allocator);
    editing_state.AddMember(kSelectionAffinityKey, kAffinityDownstream,
        allocator);
    editing_state.AddMember(kSelectionBaseKey, (int)selection.base(), allocator);
    editing_state.AddMember(kSelectionExtentKey, (int)selection.extent(), allocator);
    editing_state.AddMember(kSelectionIsDirectionalKey, false, allocator);
    editing_state.AddMember(
        kTextKey, rapidjson::Value(model.GetText(), allocator).Move(), allocator);
    args->PushBack(editing_state, allocator);

    sendMessage(kUpdateEditingStateMethod, args.get());
}

void FlutterTextInputPlugin::EnterPressed(FlutterTextInputModel* model) {
    /*if (input_type_ == kMultilineInputType) {
        model->AddCodePoint('\n');
        SendStateUpdate(*model);
    }
    auto args = std::make_unique<rapidjson::Document>(rapidjson::kArrayType);
    auto& allocator = args->GetAllocator();

    args->PushBack(client_id_, allocator);
    args->PushBack(rapidjson::Value(input_action_, allocator).Move(), allocator);

    sendMessage(kPerformActionMethod, args.get());*/
}

static constexpr char kRawKeyEventChannelName[] = "flutter/keyevent";
static constexpr char kKeyCodeKey[] = "keyCode";
static constexpr char kScanCodeKey[] = "scanCode";
static constexpr char kCharacterCodePointKey[] = "characterCodePoint";
static constexpr char kModifiersKey[] = "modifiers";
static constexpr char kKeyMapKey[] = "keymap";
static constexpr char kTypeKey[] = "type";
static constexpr char kHandledKey[] = "handled";

static constexpr char kWindowsKeyMap[] = "windows";
static constexpr char kKeyUp[] = "keyup";
static constexpr char kKeyDown[] = "keydown";

// Re-definition of the modifiers for compatibility with the Flutter framework.
// These have to be in sync with the framework's RawKeyEventDataWindows
// modifiers definition.
// https://github.com/flutter/flutter/blob/19ff596979e407c484a32f4071420fca4f4c885f/packages/flutter/lib/src/services/raw_keyboard_windows.dart#L203
static constexpr int kShift = 1 << 0;
static constexpr int kShiftLeft = 1 << 1;
static constexpr int kShiftRight = 1 << 2;
static constexpr int kControl = 1 << 3;
static constexpr int kControlLeft = 1 << 4;
static constexpr int kControlRight = 1 << 5;
static constexpr int kAlt = 1 << 6;
static constexpr int kAltLeft = 1 << 7;
static constexpr int kAltRight = 1 << 8;
static constexpr int kWinLeft = 1 << 9;
static constexpr int kWinRight = 1 << 10;
static constexpr int kCapsLock = 1 << 11;
static constexpr int kNumLock = 1 << 12;
static constexpr int kScrollLock = 1 << 13;

static int GetModsForKeyState(const FModifierKeysState& ModifierKeys) {
    int mods = 0;

    if (ModifierKeys.IsLeftShiftDown() || ModifierKeys.IsRightShiftDown())
        mods |= kShift;
    if (ModifierKeys.IsLeftShiftDown())
        mods |= kShiftLeft;
    if (ModifierKeys.IsRightShiftDown())
        mods |= kShiftRight;
    if (ModifierKeys.IsLeftControlDown() || ModifierKeys.IsRightControlDown())
        mods |= kControl;
    if (ModifierKeys.IsLeftControlDown())
        mods |= kControlLeft;
    if (ModifierKeys.IsRightControlDown())
        mods |= kControlRight;
    if (ModifierKeys.IsLeftAltDown() || ModifierKeys.IsRightAltDown())
        mods |= kAlt;
    if (ModifierKeys.IsLeftAltDown())
        mods |= kAltLeft;
    if (ModifierKeys.IsRightAltDown())
        mods |= kAltRight;

    return mods;
}

bool flutterRawKeyEvent(uint16_t key, const FModifierKeysState& ModifierKeys, bool down, bool repeat)
{
    int scanCode = getScancodeFromKey(key);
    rapidjson::Document event(rapidjson::kObjectType);
    auto& allocator = event.GetAllocator();
    event.AddMember(kKeyCodeKey, key, allocator);
    event.AddMember(kScanCodeKey, scanCode, allocator);
    event.AddMember(kCharacterCodePointKey, 0, allocator);
    event.AddMember(kKeyMapKey, kWindowsKeyMap, allocator);
    event.AddMember(kModifiersKey, GetModsForKeyState(ModifierKeys), allocator);

    if (down || repeat)
        event.AddMember(kTypeKey, kKeyDown, allocator);
    else
        event.AddMember(kTypeKey, kKeyUp, allocator);

    //EncodeMessage
    rapidjson::StringBuffer buffer;
    rapidjson::Writer<rapidjson::StringBuffer> writer(buffer);
    // clang-tidy has trouble reasoning about some of the complicated array and
    // pointer-arithmetic code in rapidjson.
    // NOLINTNEXTLINE(clang-analyzer-core.*)
    event.Accept(writer);
    const char* buffer_start = buffer.GetString();

    //Send
    flutterSendMessage(kRawKeyEventChannelName, buffer_start, (uint32_t)buffer.GetSize());
    return false;
}
