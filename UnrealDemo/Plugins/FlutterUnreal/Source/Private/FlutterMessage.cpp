
#include "FlutterMessage.h"
#include "ThirdParty/flutter_engine/flutter_embedder.h"
#include "FlutterEmbeder.h"
#include "FlutterLua.h"

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

#include "FlutterMessage.h"
#include "FlutterTextInput.h"
#include "FlutterPlatformHandler.h"

void MessageCallback(const FlutterPlatformMessage* message, void* userData)
{
    bool responsed = false;

    if (strcmp(message->channel, FlutterTextInputPlugin::GetChannelName()) == 0)
    {
        FlutterTextInputPlugin::GetInstance().HandleMessage(message);
        sendEmptyResponse(message);
        return;
    }

    if (strcmp(message->channel, PlatformHandlerPlugin::GetChannelName()) == 0)
    {
        PlatformHandlerPlugin::GetInstance().HandleMessage(message);
        return;
    }

    sendEmptyResponse(message);
}

void sendJsonResponse(const FlutterPlatformMessage* message, const rapidjson::Document& response)
{
    rapidjson::StringBuffer buffer;
    rapidjson::Writer<rapidjson::StringBuffer> writer(buffer);
    // clang-tidy has trouble reasoning about some of the complicated array and
    // pointer-arithmetic code in rapidjson.
    // NOLINTNEXTLINE(clang-analyzer-core.*)
    response.Accept(writer);
    const char* buffer_start = buffer.GetString();

    FlutterEngineSendPlatformMessageResponse(g_flutterEngine, message->response_handle, (const uint8_t*)buffer_start, buffer.GetSize());
}

void sendErrorResponse(const FlutterPlatformMessage* message, const char* error_code, const char* error_message)
{
    rapidjson::Document envelope(rapidjson::kArrayType);
    auto& allocator = envelope.GetAllocator();
    envelope.PushBack(rapidjson::Value(error_code, allocator), allocator);
    envelope.PushBack(rapidjson::Value(error_message, allocator), allocator);

    rapidjson::Value details_value;
    /*const rapidjson::Document* error_details = nullptr;
    if (error_details) {
        details_value.CopyFrom(*error_details, allocator);
    }*/
    envelope.PushBack(details_value, allocator);

    sendJsonResponse(message, envelope);
}

void sendSuccessResponse(const FlutterPlatformMessage* message, const void* result)
{
    rapidjson::Document envelope;
    envelope.SetArray();
    rapidjson::Value result_value;
    if (result) {
        result_value.CopyFrom(*(const rapidjson::Document*)result, envelope.GetAllocator());
    }
    envelope.PushBack(result_value, envelope.GetAllocator());

    sendJsonResponse(message, envelope);
}

void sendEmptyResponse(const FlutterPlatformMessage* message)
{
    FlutterEngineSendPlatformMessageResponse(g_flutterEngine, message->response_handle, nullptr, 0);
}

#if FLUTTERUNREAL_WITH_LUA

LuaFunction(flutterSendMessage)
{
    const char* channel = luaL_checkstring(L, 1);

    size_t l;
    const char* message = luaL_checklstring(L, 2, &l);
    flutterSendMessage(channel, message, (uint32_t)l);
    return 0;
}

#endif
