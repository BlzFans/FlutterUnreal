#pragma once

int getScancodeFromKey(int key);
int getPhysicalKey(int scancode, bool extended);
int getLogicalKey(int key, bool extended, int scancode);

constexpr int KEY_LEFT = 0x25;
constexpr int KEY_RIGHT = 0x27;
constexpr int KEY_END = 0x23;
constexpr int KEY_HOME = 0x24;
constexpr int KEY_BACKSPACE = 0x08;
constexpr int KEY_DELETE = 0x2e;
constexpr int KEY_RETURN = 0x0d;
