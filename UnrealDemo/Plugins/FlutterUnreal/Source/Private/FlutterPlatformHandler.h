
#pragma once
#include <string>
#include <memory>

class PlatformHandlerPlugin {
public:
    static PlatformHandlerPlugin& GetInstance();
    static const char* GetChannelName();

    void HandleMessage(const FlutterPlatformMessage* message);
};

