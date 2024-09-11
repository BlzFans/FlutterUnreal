
#pragma once
#include <string>
#include <memory>
#include "ThirdParty/flutter_engine/flutter_embedder.h"

class PlatformHandlerPlugin {
public:
    static PlatformHandlerPlugin& GetInstance();
    static const char* GetChannelName();

    void HandleMessage(const FlutterPlatformMessage* message);
};

