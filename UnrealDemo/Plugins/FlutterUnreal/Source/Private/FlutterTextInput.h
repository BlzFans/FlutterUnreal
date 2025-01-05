#pragma once

#include <string>
#include <memory>
#include "ThirdParty/flutter_engine/flutter_embedder.h"

// A directional range of text.
//
// A |TextRange| describes a range of text with |base| and |extent| positions.
// In the case where |base| == |extent|, the range is said to be collapsed, and
// when |base| > |extent|, the range is said to be reversed.
class FlutterTextRange {
public:
    explicit FlutterTextRange(size_t position) : base_(position), extent_(position) {}
    explicit FlutterTextRange(size_t base, size_t extent)
        : base_(base), extent_(extent) {}
    FlutterTextRange(const FlutterTextRange&) = default;
    FlutterTextRange& operator=(const FlutterTextRange&) = default;

    virtual ~FlutterTextRange() = default;

    // The base position of the range.
    size_t base() const { return base_; }

    // Sets the base position of the range.
    void set_base(size_t pos) { base_ = pos; }

    // The extent position of the range.
    size_t extent() const { return extent_; }

    // Sets the extent position of the range.
    void set_extent(size_t pos) { extent_ = pos; }

    // The lesser of the base and extent positions.
    size_t start() const { return std::min(base_, extent_); }

    // Sets the start position of the range.
    void set_start(size_t pos) {
        if (base_ <= extent_) {
            base_ = pos;
        }
        else {
            extent_ = pos;
        }
    }

    // The greater of the base and extent positions.
    size_t end() const { return std::max(base_, extent_); }

    // Sets the end position of the range.
    void set_end(size_t pos) {
        if (base_ <= extent_) {
            extent_ = pos;
        }
        else {
            base_ = pos;
        }
    }

    // The position of a collapsed range.
    //
    // Asserts that the range is of length 0.
    size_t position() const {
        check(base_ == extent_);
        return extent_;
    }

    // The length of the range.
    size_t length() const { return end() - start(); }

    // Returns true if the range is of length 0.
    bool collapsed() const { return base_ == extent_; }

    // Returns true if the base is greater than the extent.
    bool reversed() const { return base_ > extent_; }

    // Returns true if |position| is contained within the range.
    bool Contains(size_t position) const {
        return position >= start() && position <= end();
    }

    // Returns true if |range| is contained within the range.
    bool Contains(const FlutterTextRange& range) const {
        return range.start() >= start() && range.end() <= end();
    }

    bool operator==(const FlutterTextRange& other) const {
        return base_ == other.base_ && extent_ == other.extent_;
    }

private:
    size_t base_;
    size_t extent_;
};

// Handles underlying text input state, using a simple ASCII model.
//
// Ignores special states like "insert mode" for now.
class FlutterTextInputModel {
public:
    FlutterTextInputModel();
    virtual ~FlutterTextInputModel();

    // Sets the text, as well as the selection and the composing region.
    //
    // This method is typically used to update the TextInputModel's editing state
    // when the Flutter framework sends its latest text editing state.
    bool SetText(const std::string& text,
        const FlutterTextRange& selection = FlutterTextRange(0),
        const FlutterTextRange& composing_range = FlutterTextRange(0));

    // Attempts to set the text selection.
    //
    // Returns false if the selection is not within the bounds of the text.
    // While in composing mode, the selection is restricted to the composing
    // range; otherwise, it is restricted to the length of the text.
    //
    // To update both the text and the selection/composing range within the text
    // (for instance, when the framework sends its latest text editing state),
    // call |SetText| instead.
    bool SetSelection(const FlutterTextRange& range);

    // Attempts to set the composing range.
    //
    // Returns false if the range or offset are out of range for the text, or if
    // the offset is outside the composing range.
    //
    // To update both the text and the selection/composing range within the text
    // (for instance, when the framework sends its latest text editing state),
    // call |SetText| instead.
    bool SetComposingRange(const FlutterTextRange& range, size_t cursor_offset);

    // Begins IME composing mode.
    //
    // Resets the composing base and extent to the selection start. The existing
    // selection is preserved in case composing is aborted with no changes. Until
    // |EndComposing| is called, any further changes to selection base and extent
    // are restricted to the composing range.
    void BeginComposing();

    // Replaces the composing range with new UTF-16 text.
    //
    // If a selection of non-zero length exists, it is deleted if the composing
    // text is non-empty. The composing range is adjusted to the length of
    // |text| and the selection base and offset are set to the end of the
    // composing range.
    void UpdateComposingText(const std::u16string& text);

    // Replaces the composing range with new UTF-8 text.
    //
    // If a selection of non-zero length exists, it is deleted if the composing
    // text is non-empty. The composing range is adjusted to the length of
    // |text| and the selection base and offset are set to the end of the
    // composing range.
    void UpdateComposingText(const std::string& text);

    // Commits composing range to the string.
    //
    // Causes the composing base and extent to be collapsed to the end of the
    // range.
    void CommitComposing();

    // Ends IME composing mode.
    //
    // Collapses the composing base and offset to 0.
    void EndComposing();

    // Adds a Unicode code point.
    //
    // Either appends after the cursor (when selection base and extent are the
    // same), or deletes the selected text, replacing it with the given
    // code point.
    void AddCodePoint(char32_t c);

    // Adds UTF-16 text.
    //
    // Either appends after the cursor (when selection base and extent are the
    // same), or deletes the selected text, replacing it with the given text.
    void AddText(const std::u16string& text);

    // Adds UTF-8 text.
    //
    // Either appends after the cursor (when selection base and extent are the
    // same), or deletes the selected text, replacing it with the given text.
    void AddText(const std::string& text);

    // Deletes either the selection, or one character ahead of the cursor.
    //
    // Deleting one character ahead of the cursor occurs when the selection base
    // and extent are the same. When composing is active, deletions are
    // restricted to text between the composing base and extent.
    //
    // Returns true if any deletion actually occurred.
    bool Delete();

    // Deletes text near the cursor.
    //
    // A section is made starting at |offset_from_cursor| code points past the
    // cursor (negative values go before the cursor). |count| code points are
    // removed. The selection may go outside the bounds of the available text and
    // will result in only the part selection that covers the available text
    // being deleted. The existing selection is ignored and removed after this
    // operation. When composing is active, deletions are restricted to the
    // composing range.
    //
    // Returns true if any deletion actually occurred.
    bool DeleteSurrounding(int offset_from_cursor, int count);

    // Deletes either the selection, or one character behind the cursor.
    //
    // Deleting one character behind the cursor occurs when the selection base
    // and extent are the same. When composing is active, deletions are
    // restricted to the text between the composing base and extent.
    //
    // Returns true if any deletion actually occurred.
    bool Backspace();

    // Attempts to move the cursor backward.
    //
    // Returns true if the cursor could be moved. If a selection is active, moves
    // to the start of the selection. If composing is active, motion is
    // restricted to the composing range.
    bool MoveCursorBack();

    // Attempts to move the cursor forward.
    //
    // Returns true if the cursor could be moved. If a selection is active, moves
    // to the end of the selection. If composing is active, motion is restricted
    // to the composing range.
    bool MoveCursorForward();

    // Attempts to move the cursor to the beginning.
    //
    // If composing is active, the cursor is moved to the beginning of the
    // composing range; otherwise, it is moved to the beginning of the text. If
    // composing is active, motion is restricted to the composing range.
    //
    // Returns true if the cursor could be moved.
    bool MoveCursorToBeginning();

    // Attempts to move the cursor to the end.
    //
    // If composing is active, the cursor is moved to the end of the composing
    // range; otherwise, it is moved to the end of the text. If composing is
    // active, motion is restricted to the composing range.
    //
    // Returns true if the cursor could be moved.
    bool MoveCursorToEnd();

    // Attempts to select text from the cursor position to the beginning.
    //
    // If composing is active, the selection is applied to the beginning of the
    // composing range; otherwise, it is applied to the beginning of the text.
    //
    // Returns true if the selection could be applied.
    bool SelectToBeginning();

    // Attempts to select text from the cursor position to the end.
    //
    // If composing is active, the selection is applied to the end of the
    // composing range; otherwise, it is moved to the end of the text.
    //
    // Returns true if the selection could be applied.
    bool SelectToEnd();

    // Gets the current text as UTF-8.
    std::string GetText() const;

    // Gets the cursor position as a byte offset in UTF-8 string returned from
    // GetText().
    int GetCursorOffset() const;

    // Returns a range covering the entire text.
    FlutterTextRange text_range() const { return FlutterTextRange(0, text_.length()); }

    // The current selection.
    FlutterTextRange selection() const { return selection_; }

    // The composing range.
    //
    // If not in composing mode, returns a collapsed range at position 0.
    FlutterTextRange composing_range() const { return composing_range_; }

    // Whether multi-step input composing mode is active.
    bool composing() const { return composing_; }

private:
    // Deletes the current selection, if any.
    //
    // Returns true if any text is deleted. The selection base and extent are
    // reset to the start of the selected range.
    bool DeleteSelected();

    // Returns the currently editable text range.
    //
    // In composing mode, returns the composing range; otherwise, returns a range
    // covering the entire text.
    FlutterTextRange editable_range() const {
        return composing_ ? composing_range_ : text_range();
    }

    std::u16string text_;
    FlutterTextRange selection_ = FlutterTextRange(0);
    FlutterTextRange composing_range_ = FlutterTextRange(0);
    bool composing_ = false;
};

class FlutterTextInputPlugin {
public:
    static FlutterTextInputPlugin& GetInstance();
    static const char* GetChannelName();

    explicit FlutterTextInputPlugin();

    virtual ~FlutterTextInputPlugin();

    // |KeyboardHookHandler|
    void KeyboardHook(uint16_t key, bool down, bool repeat);

    // |KeyboardHookHandler|
    void CharHook(unsigned int code_point);

    void HandleMessage(const FlutterPlatformMessage* message);

    bool IsActive();

private:
    // Sends the current state of the given model to the Flutter engine.
    void SendStateUpdate(const FlutterTextInputModel& model);

    // Sends an action triggered by the Enter key to the Flutter engine.
    void EnterPressed(FlutterTextInputModel* model);

    // The active client id.
    int client_id_ = 0;

    // The active model. nullptr if not set.
    std::unique_ptr<FlutterTextInputModel> active_model_;

    // Keyboard type of the client. See available options:
    // https://api.flutter.dev/flutter/services/TextInputType-class.html
    std::string input_type_;

    // An action requested by the user on the input client. See available options:
    // https://api.flutter.dev/flutter/services/TextInputAction-class.html
    std::string input_action_;
};

inline bool FlutterTextInputPlugin::IsActive()
{
    return active_model_.get() != nullptr;
}

