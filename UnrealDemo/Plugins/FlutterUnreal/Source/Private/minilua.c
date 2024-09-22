
#if FLUTTERUNREAL_WITH_LUA

extern void lua_print(const char* s, size_t l);
#define lua_writestring lua_print

extern void lua_printline();
#define lua_writeline lua_printline

#define LUA_IMPL
#include "ThirdParty/minilua/minilua.h"

#endif
