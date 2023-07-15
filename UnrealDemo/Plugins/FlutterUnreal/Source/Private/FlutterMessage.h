
#pragma once

void MessageCallback(const FlutterPlatformMessage* message, void* userData);
void sendErrorResponse(const FlutterPlatformMessage* message, const char* error_code, const char* error_message);
void sendSuccessResponse(const FlutterPlatformMessage* message, const void* result);
void sendEmptyResponse(const FlutterPlatformMessage* message);
