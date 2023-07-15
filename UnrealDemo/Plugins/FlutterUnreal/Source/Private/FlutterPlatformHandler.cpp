
#include "FlutterPlatformHandler.h"
#include "GenericPlatform/GenericPlatformMisc.h"
#include "ThirdParty/flutter_engine/flutter_embedder.h"
#include "FlutterMessage.h"

#define RAPIDJSON_HAS_STDSTRING 1
#if _MSC_VER
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

static constexpr char kChannelName_[] = "flutter/platform";

static constexpr char kGetClipboardDataMethod[] = "Clipboard.getData";
static constexpr char kHasStringsClipboardMethod[] = "Clipboard.hasStrings";
static constexpr char kSetClipboardDataMethod[] = "Clipboard.setData";

static constexpr char kTextPlainFormat[] = "text/plain";
static constexpr char kTextKey_[] = "text";

static constexpr char kClipboardError[] = "Clipboard error";
static constexpr char kUnknownClipboardFormatMessage[] = "Unknown clipboard format";
static constexpr char kValueKey[] = "value";

PlatformHandlerPlugin& PlatformHandlerPlugin::GetInstance()
{
    static PlatformHandlerPlugin sInstance;
    return sInstance;
}

const char* PlatformHandlerPlugin::GetChannelName()
{
    return kChannelName_;
}

void PlatformHandlerPlugin::HandleMessage(const FlutterPlatformMessage* message)
{
    rapidjson::Document document;
    document.Parse((const char*)message->message, message->message_size);

    auto name_iter = document.FindMember("method");
    if (name_iter == document.MemberEnd()) {
        sendEmptyResponse(message);
        return;
    }

    std::string method = name_iter->value.GetString();

    rapidjson::Document args;
    auto args_itr = document.FindMember("args");
    if (args_itr != document.MemberEnd())
        args.Swap(args_itr->value);

    if (method.compare(kGetClipboardDataMethod) == 0) {
        // Only one string argument is expected.
        const rapidjson::Value& format = args;

        if (strcmp(format.GetString(), kTextPlainFormat) != 0) {
            sendErrorResponse(message, kClipboardError, kUnknownClipboardFormatMessage);
            return;
        }

        FString data;
        FGenericPlatformMisc::ClipboardPaste(data);

        rapidjson::Document doc;
        doc.SetObject();
        rapidjson::Document::AllocatorType& allocator = doc.GetAllocator();
        doc.AddMember(
            rapidjson::Value(kTextKey_, allocator),
            rapidjson::Value(
                TCHAR_TO_UTF8(*data),
                allocator),
            allocator);

        sendSuccessResponse(message, &doc);
        return;
    }

    if (method.compare(kHasStringsClipboardMethod) == 0) {
        // Only one string argument is expected.
        const rapidjson::Value& format = args;

        if (strcmp(format.GetString(), kTextPlainFormat) != 0) {
            checkf(false, TEXT("Unknown clipboard format"));
            return;
        }

        FString data;
        FGenericPlatformMisc::ClipboardPaste(data);

        rapidjson::Document doc;
        doc.SetObject();
        rapidjson::Document::AllocatorType& allocator = doc.GetAllocator();
        doc.AddMember(rapidjson::Value(kValueKey, allocator),
            rapidjson::Value(!data.IsEmpty()), allocator);

        sendSuccessResponse(message, &doc);
        return;
    }

    if (method.compare(kSetClipboardDataMethod) == 0) {
        rapidjson::Value::ConstMemberIterator itr = args.FindMember(kTextKey_);
        if (itr == document.MemberEnd()) {
            checkf(false, TEXT("Unknown clipboard format"));
            return;
        }

        FString data(itr->value.GetString());
        FGenericPlatformMisc::ClipboardCopy(*data);

        sendSuccessResponse(message, nullptr);
        return;
    }

    sendEmptyResponse(message);
}
