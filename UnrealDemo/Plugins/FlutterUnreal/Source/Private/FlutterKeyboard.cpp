
#include "FlutterKeyboard.h"
#include <map>

typedef enum
{
    SDL_SCANCODE_UNKNOWN = 0,

    /**
     *  \name Usage page 0x07
     *
     *  These values are from usage page 0x07 (USB keyboard page).
     */
     /* @{ */

    SDL_SCANCODE_A = 4,
    SDL_SCANCODE_B = 5,
    SDL_SCANCODE_C = 6,
    SDL_SCANCODE_D = 7,
    SDL_SCANCODE_E = 8,
    SDL_SCANCODE_F = 9,
    SDL_SCANCODE_G = 10,
    SDL_SCANCODE_H = 11,
    SDL_SCANCODE_I = 12,
    SDL_SCANCODE_J = 13,
    SDL_SCANCODE_K = 14,
    SDL_SCANCODE_L = 15,
    SDL_SCANCODE_M = 16,
    SDL_SCANCODE_N = 17,
    SDL_SCANCODE_O = 18,
    SDL_SCANCODE_P = 19,
    SDL_SCANCODE_Q = 20,
    SDL_SCANCODE_R = 21,
    SDL_SCANCODE_S = 22,
    SDL_SCANCODE_T = 23,
    SDL_SCANCODE_U = 24,
    SDL_SCANCODE_V = 25,
    SDL_SCANCODE_W = 26,
    SDL_SCANCODE_X = 27,
    SDL_SCANCODE_Y = 28,
    SDL_SCANCODE_Z = 29,

    SDL_SCANCODE_1 = 30,
    SDL_SCANCODE_2 = 31,
    SDL_SCANCODE_3 = 32,
    SDL_SCANCODE_4 = 33,
    SDL_SCANCODE_5 = 34,
    SDL_SCANCODE_6 = 35,
    SDL_SCANCODE_7 = 36,
    SDL_SCANCODE_8 = 37,
    SDL_SCANCODE_9 = 38,
    SDL_SCANCODE_0 = 39,

    SDL_SCANCODE_RETURN = 40,
    SDL_SCANCODE_ESCAPE = 41,
    SDL_SCANCODE_BACKSPACE = 42,
    SDL_SCANCODE_TAB = 43,
    SDL_SCANCODE_SPACE = 44,

    SDL_SCANCODE_MINUS = 45,
    SDL_SCANCODE_EQUALS = 46,
    SDL_SCANCODE_LEFTBRACKET = 47,
    SDL_SCANCODE_RIGHTBRACKET = 48,
    SDL_SCANCODE_BACKSLASH = 49, /**< Located at the lower left of the return
                                  *   key on ISO keyboards and at the right end
                                  *   of the QWERTY row on ANSI keyboards.
                                  *   Produces REVERSE SOLIDUS (backslash) and
                                  *   VERTICAL LINE in a US layout, REVERSE
                                  *   SOLIDUS and VERTICAL LINE in a UK Mac
                                  *   layout, NUMBER SIGN and TILDE in a UK
                                  *   Windows layout, DOLLAR SIGN and POUND SIGN
                                  *   in a Swiss German layout, NUMBER SIGN and
                                  *   APOSTROPHE in a German layout, GRAVE
                                  *   ACCENT and POUND SIGN in a French Mac
                                  *   layout, and ASTERISK and MICRO SIGN in a
                                  *   French Windows layout.
                                  */
    SDL_SCANCODE_NONUSHASH = 50, /**< ISO USB keyboards actually use this code
                                  *   instead of 49 for the same key, but all
                                  *   OSes I've seen treat the two codes
                                  *   identically. So, as an implementor, unless
                                  *   your keyboard generates both of those
                                  *   codes and your OS treats them differently,
                                  *   you should generate SDL_SCANCODE_BACKSLASH
                                  *   instead of this code. As a user, you
                                  *   should not rely on this code because SDL
                                  *   will never generate it with most (all?)
                                  *   keyboards.
                                  */
    SDL_SCANCODE_SEMICOLON = 51,
    SDL_SCANCODE_APOSTROPHE = 52,
    SDL_SCANCODE_GRAVE = 53, /**< Located in the top left corner (on both ANSI
                              *   and ISO keyboards). Produces GRAVE ACCENT and
                              *   TILDE in a US Windows layout and in US and UK
                              *   Mac layouts on ANSI keyboards, GRAVE ACCENT
                              *   and NOT SIGN in a UK Windows layout, SECTION
                              *   SIGN and PLUS-MINUS SIGN in US and UK Mac
                              *   layouts on ISO keyboards, SECTION SIGN and
                              *   DEGREE SIGN in a Swiss German layout (Mac:
                              *   only on ISO keyboards), CIRCUMFLEX ACCENT and
                              *   DEGREE SIGN in a German layout (Mac: only on
                              *   ISO keyboards), SUPERSCRIPT TWO and TILDE in a
                              *   French Windows layout, COMMERCIAL AT and
                              *   NUMBER SIGN in a French Mac layout on ISO
                              *   keyboards, and LESS-THAN SIGN and GREATER-THAN
                              *   SIGN in a Swiss German, German, or French Mac
                              *   layout on ANSI keyboards.
                              */
    SDL_SCANCODE_COMMA = 54,
    SDL_SCANCODE_PERIOD = 55,
    SDL_SCANCODE_SLASH = 56,

    SDL_SCANCODE_CAPSLOCK = 57,

    SDL_SCANCODE_F1 = 58,
    SDL_SCANCODE_F2 = 59,
    SDL_SCANCODE_F3 = 60,
    SDL_SCANCODE_F4 = 61,
    SDL_SCANCODE_F5 = 62,
    SDL_SCANCODE_F6 = 63,
    SDL_SCANCODE_F7 = 64,
    SDL_SCANCODE_F8 = 65,
    SDL_SCANCODE_F9 = 66,
    SDL_SCANCODE_F10 = 67,
    SDL_SCANCODE_F11 = 68,
    SDL_SCANCODE_F12 = 69,

    SDL_SCANCODE_PRINTSCREEN = 70,
    SDL_SCANCODE_SCROLLLOCK = 71,
    SDL_SCANCODE_PAUSE = 72,
    SDL_SCANCODE_INSERT = 73, /**< insert on PC, help on some Mac keyboards (but
                                   does send code 73, not 117) */
    SDL_SCANCODE_HOME = 74,
    SDL_SCANCODE_PAGEUP = 75,
    SDL_SCANCODE_DELETE = 76,
    SDL_SCANCODE_END = 77,
    SDL_SCANCODE_PAGEDOWN = 78,
    SDL_SCANCODE_RIGHT = 79,
    SDL_SCANCODE_LEFT = 80,
    SDL_SCANCODE_DOWN = 81,
    SDL_SCANCODE_UP = 82,

    SDL_SCANCODE_NUMLOCKCLEAR = 83, /**< num lock on PC, clear on Mac keyboards
                                     */
    SDL_SCANCODE_KP_DIVIDE = 84,
    SDL_SCANCODE_KP_MULTIPLY = 85,
    SDL_SCANCODE_KP_MINUS = 86,
    SDL_SCANCODE_KP_PLUS = 87,
    SDL_SCANCODE_KP_ENTER = 88,
    SDL_SCANCODE_KP_1 = 89,
    SDL_SCANCODE_KP_2 = 90,
    SDL_SCANCODE_KP_3 = 91,
    SDL_SCANCODE_KP_4 = 92,
    SDL_SCANCODE_KP_5 = 93,
    SDL_SCANCODE_KP_6 = 94,
    SDL_SCANCODE_KP_7 = 95,
    SDL_SCANCODE_KP_8 = 96,
    SDL_SCANCODE_KP_9 = 97,
    SDL_SCANCODE_KP_0 = 98,
    SDL_SCANCODE_KP_PERIOD = 99,

    SDL_SCANCODE_NONUSBACKSLASH = 100, /**< This is the additional key that ISO
                                        *   keyboards have over ANSI ones,
                                        *   located between left shift and Y.
                                        *   Produces GRAVE ACCENT and TILDE in a
                                        *   US or UK Mac layout, REVERSE SOLIDUS
                                        *   (backslash) and VERTICAL LINE in a
                                        *   US or UK Windows layout, and
                                        *   LESS-THAN SIGN and GREATER-THAN SIGN
                                        *   in a Swiss German, German, or French
                                        *   layout. */
    SDL_SCANCODE_APPLICATION = 101, /**< windows contextual menu, compose */
    SDL_SCANCODE_POWER = 102, /**< The USB document says this is a status flag,
                               *   not a physical key - but some Mac keyboards
                               *   do have a power key. */
    SDL_SCANCODE_KP_EQUALS = 103,
    SDL_SCANCODE_F13 = 104,
    SDL_SCANCODE_F14 = 105,
    SDL_SCANCODE_F15 = 106,
    SDL_SCANCODE_F16 = 107,
    SDL_SCANCODE_F17 = 108,
    SDL_SCANCODE_F18 = 109,
    SDL_SCANCODE_F19 = 110,
    SDL_SCANCODE_F20 = 111,
    SDL_SCANCODE_F21 = 112,
    SDL_SCANCODE_F22 = 113,
    SDL_SCANCODE_F23 = 114,
    SDL_SCANCODE_F24 = 115,
    SDL_SCANCODE_EXECUTE = 116,
    SDL_SCANCODE_HELP = 117,
    SDL_SCANCODE_MENU = 118,
    SDL_SCANCODE_SELECT = 119,
    SDL_SCANCODE_STOP = 120,
    SDL_SCANCODE_AGAIN = 121,   /**< redo */
    SDL_SCANCODE_UNDO = 122,
    SDL_SCANCODE_CUT = 123,
    SDL_SCANCODE_COPY = 124,
    SDL_SCANCODE_PASTE = 125,
    SDL_SCANCODE_FIND = 126,
    SDL_SCANCODE_MUTE = 127,
    SDL_SCANCODE_VOLUMEUP = 128,
    SDL_SCANCODE_VOLUMEDOWN = 129,
    /* not sure whether there's a reason to enable these */
    /*     SDL_SCANCODE_LOCKINGCAPSLOCK = 130,  */
    /*     SDL_SCANCODE_LOCKINGNUMLOCK = 131, */
    /*     SDL_SCANCODE_LOCKINGSCROLLLOCK = 132, */
    SDL_SCANCODE_KP_COMMA = 133,
    SDL_SCANCODE_KP_EQUALSAS400 = 134,

    SDL_SCANCODE_INTERNATIONAL1 = 135, /**< used on Asian keyboards, see
                                            footnotes in USB doc */
    SDL_SCANCODE_INTERNATIONAL2 = 136,
    SDL_SCANCODE_INTERNATIONAL3 = 137, /**< Yen */
    SDL_SCANCODE_INTERNATIONAL4 = 138,
    SDL_SCANCODE_INTERNATIONAL5 = 139,
    SDL_SCANCODE_INTERNATIONAL6 = 140,
    SDL_SCANCODE_INTERNATIONAL7 = 141,
    SDL_SCANCODE_INTERNATIONAL8 = 142,
    SDL_SCANCODE_INTERNATIONAL9 = 143,
    SDL_SCANCODE_LANG1 = 144, /**< Hangul/English toggle */
    SDL_SCANCODE_LANG2 = 145, /**< Hanja conversion */
    SDL_SCANCODE_LANG3 = 146, /**< Katakana */
    SDL_SCANCODE_LANG4 = 147, /**< Hiragana */
    SDL_SCANCODE_LANG5 = 148, /**< Zenkaku/Hankaku */
    SDL_SCANCODE_LANG6 = 149, /**< reserved */
    SDL_SCANCODE_LANG7 = 150, /**< reserved */
    SDL_SCANCODE_LANG8 = 151, /**< reserved */
    SDL_SCANCODE_LANG9 = 152, /**< reserved */

    SDL_SCANCODE_ALTERASE = 153, /**< Erase-Eaze */
    SDL_SCANCODE_SYSREQ = 154,
    SDL_SCANCODE_CANCEL = 155,
    SDL_SCANCODE_CLEAR = 156,
    SDL_SCANCODE_PRIOR = 157,
    SDL_SCANCODE_RETURN2 = 158,
    SDL_SCANCODE_SEPARATOR = 159,
    SDL_SCANCODE_OUT = 160,
    SDL_SCANCODE_OPER = 161,
    SDL_SCANCODE_CLEARAGAIN = 162,
    SDL_SCANCODE_CRSEL = 163,
    SDL_SCANCODE_EXSEL = 164,

    SDL_SCANCODE_KP_00 = 176,
    SDL_SCANCODE_KP_000 = 177,
    SDL_SCANCODE_THOUSANDSSEPARATOR = 178,
    SDL_SCANCODE_DECIMALSEPARATOR = 179,
    SDL_SCANCODE_CURRENCYUNIT = 180,
    SDL_SCANCODE_CURRENCYSUBUNIT = 181,
    SDL_SCANCODE_KP_LEFTPAREN = 182,
    SDL_SCANCODE_KP_RIGHTPAREN = 183,
    SDL_SCANCODE_KP_LEFTBRACE = 184,
    SDL_SCANCODE_KP_RIGHTBRACE = 185,
    SDL_SCANCODE_KP_TAB = 186,
    SDL_SCANCODE_KP_BACKSPACE = 187,
    SDL_SCANCODE_KP_A = 188,
    SDL_SCANCODE_KP_B = 189,
    SDL_SCANCODE_KP_C = 190,
    SDL_SCANCODE_KP_D = 191,
    SDL_SCANCODE_KP_E = 192,
    SDL_SCANCODE_KP_F = 193,
    SDL_SCANCODE_KP_XOR = 194,
    SDL_SCANCODE_KP_POWER = 195,
    SDL_SCANCODE_KP_PERCENT = 196,
    SDL_SCANCODE_KP_LESS = 197,
    SDL_SCANCODE_KP_GREATER = 198,
    SDL_SCANCODE_KP_AMPERSAND = 199,
    SDL_SCANCODE_KP_DBLAMPERSAND = 200,
    SDL_SCANCODE_KP_VERTICALBAR = 201,
    SDL_SCANCODE_KP_DBLVERTICALBAR = 202,
    SDL_SCANCODE_KP_COLON = 203,
    SDL_SCANCODE_KP_HASH = 204,
    SDL_SCANCODE_KP_SPACE = 205,
    SDL_SCANCODE_KP_AT = 206,
    SDL_SCANCODE_KP_EXCLAM = 207,
    SDL_SCANCODE_KP_MEMSTORE = 208,
    SDL_SCANCODE_KP_MEMRECALL = 209,
    SDL_SCANCODE_KP_MEMCLEAR = 210,
    SDL_SCANCODE_KP_MEMADD = 211,
    SDL_SCANCODE_KP_MEMSUBTRACT = 212,
    SDL_SCANCODE_KP_MEMMULTIPLY = 213,
    SDL_SCANCODE_KP_MEMDIVIDE = 214,
    SDL_SCANCODE_KP_PLUSMINUS = 215,
    SDL_SCANCODE_KP_CLEAR = 216,
    SDL_SCANCODE_KP_CLEARENTRY = 217,
    SDL_SCANCODE_KP_BINARY = 218,
    SDL_SCANCODE_KP_OCTAL = 219,
    SDL_SCANCODE_KP_DECIMAL = 220,
    SDL_SCANCODE_KP_HEXADECIMAL = 221,

    SDL_SCANCODE_LCTRL = 224,
    SDL_SCANCODE_LSHIFT = 225,
    SDL_SCANCODE_LALT = 226, /**< alt, option */
    SDL_SCANCODE_LGUI = 227, /**< windows, command (apple), meta */
    SDL_SCANCODE_RCTRL = 228,
    SDL_SCANCODE_RSHIFT = 229,
    SDL_SCANCODE_RALT = 230, /**< alt gr, option */
    SDL_SCANCODE_RGUI = 231, /**< windows, command (apple), meta */

    SDL_SCANCODE_MODE = 257,    /**< I'm not sure if this is really not covered
                                 *   by any of the above, but since there's a
                                 *   special KMOD_MODE for it I'm adding it here
                                 */

                                 /* @} *//* Usage page 0x07 */

                                 /**
                                  *  \name Usage page 0x0C
                                  *
                                  *  These values are mapped from usage page 0x0C (USB consumer page).
                                  */
                                  /* @{ */

    SDL_SCANCODE_AUDIONEXT = 258,
    SDL_SCANCODE_AUDIOPREV = 259,
    SDL_SCANCODE_AUDIOSTOP = 260,
    SDL_SCANCODE_AUDIOPLAY = 261,
    SDL_SCANCODE_AUDIOMUTE = 262,
    SDL_SCANCODE_MEDIASELECT = 263,
    SDL_SCANCODE_WWW = 264,
    SDL_SCANCODE_MAIL = 265,
    SDL_SCANCODE_CALCULATOR = 266,
    SDL_SCANCODE_COMPUTER = 267,
    SDL_SCANCODE_AC_SEARCH = 268,
    SDL_SCANCODE_AC_HOME = 269,
    SDL_SCANCODE_AC_BACK = 270,
    SDL_SCANCODE_AC_FORWARD = 271,
    SDL_SCANCODE_AC_STOP = 272,
    SDL_SCANCODE_AC_REFRESH = 273,
    SDL_SCANCODE_AC_BOOKMARKS = 274,

    /* @} *//* Usage page 0x0C */

    /**
     *  \name Walther keys
     *
     *  These are values that Christian Walther added (for mac keyboard?).
     */
     /* @{ */

    SDL_SCANCODE_BRIGHTNESSDOWN = 275,
    SDL_SCANCODE_BRIGHTNESSUP = 276,
    SDL_SCANCODE_DISPLAYSWITCH = 277, /**< display mirroring/dual display
                                           switch, video mode switch */
    SDL_SCANCODE_KBDILLUMTOGGLE = 278,
    SDL_SCANCODE_KBDILLUMDOWN = 279,
    SDL_SCANCODE_KBDILLUMUP = 280,
    SDL_SCANCODE_EJECT = 281,
    SDL_SCANCODE_SLEEP = 282,

    SDL_SCANCODE_APP1 = 283,
    SDL_SCANCODE_APP2 = 284,

    /* @} *//* Walther keys */

    /**
     *  \name Usage page 0x0C (additional media keys)
     *
     *  These values are mapped from usage page 0x0C (USB consumer page).
     */
     /* @{ */

    SDL_SCANCODE_AUDIOREWIND = 285,
    SDL_SCANCODE_AUDIOFASTFORWARD = 286,

    /* @} *//* Usage page 0x0C (additional media keys) */

    /* Add any other keys here. */

    SDL_NUM_SCANCODES = 512 /**< not a key, just marks the number of scancodes
                                 for array bounds */
} SDL_Scancode;

typedef int32 SDL_Keycode;

#define SDLK_SCANCODE_MASK (1<<30)
#define SDL_SCANCODE_TO_KEYCODE(X)  (X | SDLK_SCANCODE_MASK)

typedef enum
{
    SDLK_UNKNOWN = 0,

    SDLK_RETURN = '\r',
    SDLK_ESCAPE = '\033',
    SDLK_BACKSPACE = '\b',
    SDLK_TAB = '\t',
    SDLK_SPACE = ' ',
    SDLK_EXCLAIM = '!',
    SDLK_QUOTEDBL = '"',
    SDLK_HASH = '#',
    SDLK_PERCENT = '%',
    SDLK_DOLLAR = '$',
    SDLK_AMPERSAND = '&',
    SDLK_QUOTE = '\'',
    SDLK_LEFTPAREN = '(',
    SDLK_RIGHTPAREN = ')',
    SDLK_ASTERISK = '*',
    SDLK_PLUS = '+',
    SDLK_COMMA = ',',
    SDLK_MINUS = '-',
    SDLK_PERIOD = '.',
    SDLK_SLASH = '/',
    SDLK_0 = '0',
    SDLK_1 = '1',
    SDLK_2 = '2',
    SDLK_3 = '3',
    SDLK_4 = '4',
    SDLK_5 = '5',
    SDLK_6 = '6',
    SDLK_7 = '7',
    SDLK_8 = '8',
    SDLK_9 = '9',
    SDLK_COLON = ':',
    SDLK_SEMICOLON = ';',
    SDLK_LESS = '<',
    SDLK_EQUALS = '=',
    SDLK_GREATER = '>',
    SDLK_QUESTION = '?',
    SDLK_AT = '@',
    /*
       Skip uppercase letters
     */
    SDLK_LEFTBRACKET = '[',
    SDLK_BACKSLASH = '\\',
    SDLK_RIGHTBRACKET = ']',
    SDLK_CARET = '^',
    SDLK_UNDERSCORE = '_',
    SDLK_BACKQUOTE = '`',
    SDLK_a = 'a',
    SDLK_b = 'b',
    SDLK_c = 'c',
    SDLK_d = 'd',
    SDLK_e = 'e',
    SDLK_f = 'f',
    SDLK_g = 'g',
    SDLK_h = 'h',
    SDLK_i = 'i',
    SDLK_j = 'j',
    SDLK_k = 'k',
    SDLK_l = 'l',
    SDLK_m = 'm',
    SDLK_n = 'n',
    SDLK_o = 'o',
    SDLK_p = 'p',
    SDLK_q = 'q',
    SDLK_r = 'r',
    SDLK_s = 's',
    SDLK_t = 't',
    SDLK_u = 'u',
    SDLK_v = 'v',
    SDLK_w = 'w',
    SDLK_x = 'x',
    SDLK_y = 'y',
    SDLK_z = 'z',

    SDLK_CAPSLOCK = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CAPSLOCK),

    SDLK_F1 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F1),
    SDLK_F2 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F2),
    SDLK_F3 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F3),
    SDLK_F4 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F4),
    SDLK_F5 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F5),
    SDLK_F6 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F6),
    SDLK_F7 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F7),
    SDLK_F8 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F8),
    SDLK_F9 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F9),
    SDLK_F10 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F10),
    SDLK_F11 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F11),
    SDLK_F12 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F12),

    SDLK_PRINTSCREEN = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PRINTSCREEN),
    SDLK_SCROLLLOCK = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SCROLLLOCK),
    SDLK_PAUSE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PAUSE),
    SDLK_INSERT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_INSERT),
    SDLK_HOME = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_HOME),
    SDLK_PAGEUP = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PAGEUP),
    SDLK_DELETE = '\177',
    SDLK_END = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_END),
    SDLK_PAGEDOWN = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PAGEDOWN),
    SDLK_RIGHT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RIGHT),
    SDLK_LEFT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LEFT),
    SDLK_DOWN = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_DOWN),
    SDLK_UP = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_UP),

    SDLK_NUMLOCKCLEAR = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_NUMLOCKCLEAR),
    SDLK_KP_DIVIDE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DIVIDE),
    SDLK_KP_MULTIPLY = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MULTIPLY),
    SDLK_KP_MINUS = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MINUS),
    SDLK_KP_PLUS = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PLUS),
    SDLK_KP_ENTER = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_ENTER),
    SDLK_KP_1 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_1),
    SDLK_KP_2 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_2),
    SDLK_KP_3 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_3),
    SDLK_KP_4 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_4),
    SDLK_KP_5 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_5),
    SDLK_KP_6 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_6),
    SDLK_KP_7 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_7),
    SDLK_KP_8 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_8),
    SDLK_KP_9 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_9),
    SDLK_KP_0 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_0),
    SDLK_KP_PERIOD = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PERIOD),

    SDLK_APPLICATION = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_APPLICATION),
    SDLK_POWER = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_POWER),
    SDLK_KP_EQUALS = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_EQUALS),
    SDLK_F13 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F13),
    SDLK_F14 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F14),
    SDLK_F15 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F15),
    SDLK_F16 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F16),
    SDLK_F17 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F17),
    SDLK_F18 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F18),
    SDLK_F19 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F19),
    SDLK_F20 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F20),
    SDLK_F21 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F21),
    SDLK_F22 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F22),
    SDLK_F23 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F23),
    SDLK_F24 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F24),
    SDLK_EXECUTE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_EXECUTE),
    SDLK_HELP = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_HELP),
    SDLK_MENU = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MENU),
    SDLK_SELECT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SELECT),
    SDLK_STOP = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_STOP),
    SDLK_AGAIN = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AGAIN),
    SDLK_UNDO = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_UNDO),
    SDLK_CUT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CUT),
    SDLK_COPY = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_COPY),
    SDLK_PASTE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PASTE),
    SDLK_FIND = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_FIND),
    SDLK_MUTE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MUTE),
    SDLK_VOLUMEUP = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_VOLUMEUP),
    SDLK_VOLUMEDOWN = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_VOLUMEDOWN),
    SDLK_KP_COMMA = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_COMMA),
    SDLK_KP_EQUALSAS400 =
    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_EQUALSAS400),

    SDLK_ALTERASE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_ALTERASE),
    SDLK_SYSREQ = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SYSREQ),
    SDLK_CANCEL = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CANCEL),
    SDLK_CLEAR = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CLEAR),
    SDLK_PRIOR = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PRIOR),
    SDLK_RETURN2 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RETURN2),
    SDLK_SEPARATOR = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SEPARATOR),
    SDLK_OUT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_OUT),
    SDLK_OPER = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_OPER),
    SDLK_CLEARAGAIN = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CLEARAGAIN),
    SDLK_CRSEL = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CRSEL),
    SDLK_EXSEL = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_EXSEL),

    SDLK_KP_00 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_00),
    SDLK_KP_000 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_000),
    SDLK_THOUSANDSSEPARATOR =
    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_THOUSANDSSEPARATOR),
    SDLK_DECIMALSEPARATOR =
    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_DECIMALSEPARATOR),
    SDLK_CURRENCYUNIT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CURRENCYUNIT),
    SDLK_CURRENCYSUBUNIT =
    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CURRENCYSUBUNIT),
    SDLK_KP_LEFTPAREN = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_LEFTPAREN),
    SDLK_KP_RIGHTPAREN = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_RIGHTPAREN),
    SDLK_KP_LEFTBRACE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_LEFTBRACE),
    SDLK_KP_RIGHTBRACE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_RIGHTBRACE),
    SDLK_KP_TAB = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_TAB),
    SDLK_KP_BACKSPACE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_BACKSPACE),
    SDLK_KP_A = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_A),
    SDLK_KP_B = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_B),
    SDLK_KP_C = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_C),
    SDLK_KP_D = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_D),
    SDLK_KP_E = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_E),
    SDLK_KP_F = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_F),
    SDLK_KP_XOR = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_XOR),
    SDLK_KP_POWER = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_POWER),
    SDLK_KP_PERCENT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PERCENT),
    SDLK_KP_LESS = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_LESS),
    SDLK_KP_GREATER = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_GREATER),
    SDLK_KP_AMPERSAND = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_AMPERSAND),
    SDLK_KP_DBLAMPERSAND =
    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DBLAMPERSAND),
    SDLK_KP_VERTICALBAR =
    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_VERTICALBAR),
    SDLK_KP_DBLVERTICALBAR =
    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DBLVERTICALBAR),
    SDLK_KP_COLON = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_COLON),
    SDLK_KP_HASH = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_HASH),
    SDLK_KP_SPACE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_SPACE),
    SDLK_KP_AT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_AT),
    SDLK_KP_EXCLAM = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_EXCLAM),
    SDLK_KP_MEMSTORE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMSTORE),
    SDLK_KP_MEMRECALL = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMRECALL),
    SDLK_KP_MEMCLEAR = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMCLEAR),
    SDLK_KP_MEMADD = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMADD),
    SDLK_KP_MEMSUBTRACT =
    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMSUBTRACT),
    SDLK_KP_MEMMULTIPLY =
    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMMULTIPLY),
    SDLK_KP_MEMDIVIDE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMDIVIDE),
    SDLK_KP_PLUSMINUS = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PLUSMINUS),
    SDLK_KP_CLEAR = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_CLEAR),
    SDLK_KP_CLEARENTRY = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_CLEARENTRY),
    SDLK_KP_BINARY = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_BINARY),
    SDLK_KP_OCTAL = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_OCTAL),
    SDLK_KP_DECIMAL = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DECIMAL),
    SDLK_KP_HEXADECIMAL =
    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_HEXADECIMAL),

    SDLK_LCTRL = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LCTRL),
    SDLK_LSHIFT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LSHIFT),
    SDLK_LALT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LALT),
    SDLK_LGUI = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LGUI),
    SDLK_RCTRL = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RCTRL),
    SDLK_RSHIFT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RSHIFT),
    SDLK_RALT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RALT),
    SDLK_RGUI = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RGUI),

    SDLK_MODE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MODE),

    SDLK_AUDIONEXT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIONEXT),
    SDLK_AUDIOPREV = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIOPREV),
    SDLK_AUDIOSTOP = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIOSTOP),
    SDLK_AUDIOPLAY = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIOPLAY),
    SDLK_AUDIOMUTE = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIOMUTE),
    SDLK_MEDIASELECT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIASELECT),
    SDLK_WWW = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_WWW),
    SDLK_MAIL = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MAIL),
    SDLK_CALCULATOR = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CALCULATOR),
    SDLK_COMPUTER = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_COMPUTER),
    SDLK_AC_SEARCH = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_SEARCH),
    SDLK_AC_HOME = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_HOME),
    SDLK_AC_BACK = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_BACK),
    SDLK_AC_FORWARD = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_FORWARD),
    SDLK_AC_STOP = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_STOP),
    SDLK_AC_REFRESH = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_REFRESH),
    SDLK_AC_BOOKMARKS = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_BOOKMARKS),

    SDLK_BRIGHTNESSDOWN =
    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_BRIGHTNESSDOWN),
    SDLK_BRIGHTNESSUP = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_BRIGHTNESSUP),
    SDLK_DISPLAYSWITCH = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_DISPLAYSWITCH),
    SDLK_KBDILLUMTOGGLE =
    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KBDILLUMTOGGLE),
    SDLK_KBDILLUMDOWN = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KBDILLUMDOWN),
    SDLK_KBDILLUMUP = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KBDILLUMUP),
    SDLK_EJECT = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_EJECT),
    SDLK_SLEEP = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SLEEP),
    SDLK_APP1 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_APP1),
    SDLK_APP2 = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_APP2),

    SDLK_AUDIOREWIND = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIOREWIND),
    SDLK_AUDIOFASTFORWARD = SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIOFASTFORWARD)
} SDL_KeyCode;

static const SDL_Keycode SDL_default_keymap[SDL_NUM_SCANCODES] = {
    0, 0, 0, 0,
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    SDLK_RETURN,
    SDLK_ESCAPE,
    SDLK_BACKSPACE,
    SDLK_TAB,
    SDLK_SPACE,
    '-',
    '=',
    '[',
    ']',
    '\\',
    '#',
    ';',
    '\'',
    '`',
    ',',
    '.',
    '/',
    SDLK_CAPSLOCK,
    SDLK_F1,
    SDLK_F2,
    SDLK_F3,
    SDLK_F4,
    SDLK_F5,
    SDLK_F6,
    SDLK_F7,
    SDLK_F8,
    SDLK_F9,
    SDLK_F10,
    SDLK_F11,
    SDLK_F12,
    SDLK_PRINTSCREEN,
    SDLK_SCROLLLOCK,
    SDLK_PAUSE,
    SDLK_INSERT,
    SDLK_HOME,
    SDLK_PAGEUP,
    SDLK_DELETE,
    SDLK_END,
    SDLK_PAGEDOWN,
    SDLK_RIGHT,
    SDLK_LEFT,
    SDLK_DOWN,
    SDLK_UP,
    SDLK_NUMLOCKCLEAR,
    SDLK_KP_DIVIDE,
    SDLK_KP_MULTIPLY,
    SDLK_KP_MINUS,
    SDLK_KP_PLUS,
    SDLK_KP_ENTER,
    SDLK_KP_1,
    SDLK_KP_2,
    SDLK_KP_3,
    SDLK_KP_4,
    SDLK_KP_5,
    SDLK_KP_6,
    SDLK_KP_7,
    SDLK_KP_8,
    SDLK_KP_9,
    SDLK_KP_0,
    SDLK_KP_PERIOD,
    0,
    SDLK_APPLICATION,
    SDLK_POWER,
    SDLK_KP_EQUALS,
    SDLK_F13,
    SDLK_F14,
    SDLK_F15,
    SDLK_F16,
    SDLK_F17,
    SDLK_F18,
    SDLK_F19,
    SDLK_F20,
    SDLK_F21,
    SDLK_F22,
    SDLK_F23,
    SDLK_F24,
    SDLK_EXECUTE,
    SDLK_HELP,
    SDLK_MENU,
    SDLK_SELECT,
    SDLK_STOP,
    SDLK_AGAIN,
    SDLK_UNDO,
    SDLK_CUT,
    SDLK_COPY,
    SDLK_PASTE,
    SDLK_FIND,
    SDLK_MUTE,
    SDLK_VOLUMEUP,
    SDLK_VOLUMEDOWN,
    0, 0, 0,
    SDLK_KP_COMMA,
    SDLK_KP_EQUALSAS400,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    SDLK_ALTERASE,
    SDLK_SYSREQ,
    SDLK_CANCEL,
    SDLK_CLEAR,
    SDLK_PRIOR,
    SDLK_RETURN2,
    SDLK_SEPARATOR,
    SDLK_OUT,
    SDLK_OPER,
    SDLK_CLEARAGAIN,
    SDLK_CRSEL,
    SDLK_EXSEL,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    SDLK_KP_00,
    SDLK_KP_000,
    SDLK_THOUSANDSSEPARATOR,
    SDLK_DECIMALSEPARATOR,
    SDLK_CURRENCYUNIT,
    SDLK_CURRENCYSUBUNIT,
    SDLK_KP_LEFTPAREN,
    SDLK_KP_RIGHTPAREN,
    SDLK_KP_LEFTBRACE,
    SDLK_KP_RIGHTBRACE,
    SDLK_KP_TAB,
    SDLK_KP_BACKSPACE,
    SDLK_KP_A,
    SDLK_KP_B,
    SDLK_KP_C,
    SDLK_KP_D,
    SDLK_KP_E,
    SDLK_KP_F,
    SDLK_KP_XOR,
    SDLK_KP_POWER,
    SDLK_KP_PERCENT,
    SDLK_KP_LESS,
    SDLK_KP_GREATER,
    SDLK_KP_AMPERSAND,
    SDLK_KP_DBLAMPERSAND,
    SDLK_KP_VERTICALBAR,
    SDLK_KP_DBLVERTICALBAR,
    SDLK_KP_COLON,
    SDLK_KP_HASH,
    SDLK_KP_SPACE,
    SDLK_KP_AT,
    SDLK_KP_EXCLAM,
    SDLK_KP_MEMSTORE,
    SDLK_KP_MEMRECALL,
    SDLK_KP_MEMCLEAR,
    SDLK_KP_MEMADD,
    SDLK_KP_MEMSUBTRACT,
    SDLK_KP_MEMMULTIPLY,
    SDLK_KP_MEMDIVIDE,
    SDLK_KP_PLUSMINUS,
    SDLK_KP_CLEAR,
    SDLK_KP_CLEARENTRY,
    SDLK_KP_BINARY,
    SDLK_KP_OCTAL,
    SDLK_KP_DECIMAL,
    SDLK_KP_HEXADECIMAL,
    0, 0,
    SDLK_LCTRL,
    SDLK_LSHIFT,
    SDLK_LALT,
    SDLK_LGUI,
    SDLK_RCTRL,
    SDLK_RSHIFT,
    SDLK_RALT,
    SDLK_RGUI,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    SDLK_MODE,
    SDLK_AUDIONEXT,
    SDLK_AUDIOPREV,
    SDLK_AUDIOSTOP,
    SDLK_AUDIOPLAY,
    SDLK_AUDIOMUTE,
    SDLK_MEDIASELECT,
    SDLK_WWW,
    SDLK_MAIL,
    SDLK_CALCULATOR,
    SDLK_COMPUTER,
    SDLK_AC_SEARCH,
    SDLK_AC_HOME,
    SDLK_AC_BACK,
    SDLK_AC_FORWARD,
    SDLK_AC_STOP,
    SDLK_AC_REFRESH,
    SDLK_AC_BOOKMARKS,
    SDLK_BRIGHTNESSDOWN,
    SDLK_BRIGHTNESSUP,
    SDLK_DISPLAYSWITCH,
    SDLK_KBDILLUMTOGGLE,
    SDLK_KBDILLUMDOWN,
    SDLK_KBDILLUMUP,
    SDLK_EJECT,
    SDLK_SLEEP,
    SDLK_APP1,
    SDLK_APP2,
    SDLK_AUDIOREWIND,
    SDLK_AUDIOFASTFORWARD,
};

int getScancodeFromKey(int key)
{
    int scancode;

    for (scancode = SDL_SCANCODE_UNKNOWN; scancode < SDL_NUM_SCANCODES;
        ++scancode) {
        if (SDL_default_keymap[scancode] == key) {
            return scancode;
        }
    }
    return SDL_SCANCODE_UNKNOWN;
}

std::map<uint64_t, uint64_t> windowsToPhysicalMap_ =
{
    {0x00000001, 0x00070029},  // escape
    {0x00000002, 0x0007001e},  // digit1
    {0x00000003, 0x0007001f},  // digit2
    {0x00000004, 0x00070020},  // digit3
    {0x00000005, 0x00070021},  // digit4
    {0x00000006, 0x00070022},  // digit5
    {0x00000007, 0x00070023},  // digit6
    {0x00000008, 0x00070024},  // digit7
    {0x00000009, 0x00070025},  // digit8
    {0x0000000a, 0x00070026},  // digit9
    {0x0000000b, 0x00070027},  // digit0
    {0x0000000c, 0x0007002d},  // minus
    {0x0000000d, 0x0007002e},  // equal
    {0x0000000e, 0x0007002a},  // backspace
    {0x0000000f, 0x0007002b},  // tab
    {0x00000010, 0x00070014},  // keyQ
    {0x00000011, 0x0007001a},  // keyW
    {0x00000012, 0x00070008},  // keyE
    {0x00000013, 0x00070015},  // keyR
    {0x00000014, 0x00070017},  // keyT
    {0x00000015, 0x0007001c},  // keyY
    {0x00000016, 0x00070018},  // keyU
    {0x00000017, 0x0007000c},  // keyI
    {0x00000018, 0x00070012},  // keyO
    {0x00000019, 0x00070013},  // keyP
    {0x0000001a, 0x0007002f},  // bracketLeft
    {0x0000001b, 0x00070030},  // bracketRight
    {0x0000001c, 0x00070028},  // enter
    {0x0000001d, 0x000700e0},  // controlLeft
    {0x0000001e, 0x00070004},  // keyA
    {0x0000001f, 0x00070016},  // keyS
    {0x00000020, 0x00070007},  // keyD
    {0x00000021, 0x00070009},  // keyF
    {0x00000022, 0x0007000a},  // keyG
    {0x00000023, 0x0007000b},  // keyH
    {0x00000024, 0x0007000d},  // keyJ
    {0x00000025, 0x0007000e},  // keyK
    {0x00000026, 0x0007000f},  // keyL
    {0x00000027, 0x00070033},  // semicolon
    {0x00000028, 0x00070034},  // quote
    {0x00000029, 0x00070035},  // backquote
    {0x0000002a, 0x000700e1},  // shiftLeft
    {0x0000002b, 0x00070031},  // backslash
    {0x0000002c, 0x0007001d},  // keyZ
    {0x0000002d, 0x0007001b},  // keyX
    {0x0000002e, 0x00070006},  // keyC
    {0x0000002f, 0x00070019},  // keyV
    {0x00000030, 0x00070005},  // keyB
    {0x00000031, 0x00070011},  // keyN
    {0x00000032, 0x00070010},  // keyM
    {0x00000033, 0x00070036},  // comma
    {0x00000034, 0x00070037},  // period
    {0x00000035, 0x00070038},  // slash
    {0x00000036, 0x000700e5},  // shiftRight
    {0x00000037, 0x00070055},  // numpadMultiply
    {0x00000038, 0x000700e2},  // altLeft
    {0x00000039, 0x0007002c},  // space
    {0x0000003a, 0x00070039},  // capsLock
    {0x0000003b, 0x0007003a},  // f1
    {0x0000003c, 0x0007003b},  // f2
    {0x0000003d, 0x0007003c},  // f3
    {0x0000003e, 0x0007003d},  // f4
    {0x0000003f, 0x0007003e},  // f5
    {0x00000040, 0x0007003f},  // f6
    {0x00000041, 0x00070040},  // f7
    {0x00000042, 0x00070041},  // f8
    {0x00000043, 0x00070042},  // f9
    {0x00000044, 0x00070043},  // f10
    {0x00000045, 0x00070048},  // pause
    {0x00000046, 0x00070047},  // scrollLock
    {0x00000047, 0x0007005f},  // numpad7
    {0x00000048, 0x00070060},  // numpad8
    {0x00000049, 0x00070061},  // numpad9
    {0x0000004a, 0x00070056},  // numpadSubtract
    {0x0000004b, 0x0007005c},  // numpad4
    {0x0000004c, 0x0007005d},  // numpad5
    {0x0000004d, 0x0007005e},  // numpad6
    {0x0000004e, 0x00070057},  // numpadAdd
    {0x0000004f, 0x00070059},  // numpad1
    {0x00000050, 0x0007005a},  // numpad2
    {0x00000051, 0x0007005b},  // numpad3
    {0x00000052, 0x00070062},  // numpad0
    {0x00000053, 0x00070063},  // numpadDecimal
    {0x00000056, 0x00070064},  // intlBackslash
    {0x00000057, 0x00070044},  // f11
    {0x00000058, 0x00070045},  // f12
    {0x00000059, 0x00070067},  // numpadEqual
    {0x00000064, 0x00070068},  // f13
    {0x00000065, 0x00070069},  // f14
    {0x00000066, 0x0007006a},  // f15
    {0x00000067, 0x0007006b},  // f16
    {0x00000068, 0x0007006c},  // f17
    {0x00000069, 0x0007006d},  // f18
    {0x0000006a, 0x0007006e},  // f19
    {0x0000006b, 0x0007006f},  // f20
    {0x0000006c, 0x00070070},  // f21
    {0x0000006d, 0x00070071},  // f22
    {0x0000006e, 0x00070072},  // f23
    {0x00000070, 0x00070088},  // kanaMode
    {0x00000071, 0x00070091},  // lang2
    {0x00000072, 0x00070090},  // lang1
    {0x00000073, 0x00070087},  // intlRo
    {0x00000076, 0x00070073},  // f24
    {0x00000077, 0x00070093},  // lang4
    {0x00000078, 0x00070092},  // lang3
    {0x00000079, 0x0007008a},  // convert
    {0x0000007b, 0x0007008b},  // nonConvert
    {0x0000007d, 0x00070089},  // intlYen
    {0x0000007e, 0x00070085},  // numpadComma
    {0x000000fc, 0x00070002},  // usbPostFail
    {0x000000ff, 0x00070001},  // usbErrorRollOver
    {0x0000e008, 0x0007007a},  // undo
    {0x0000e00a, 0x0007007d},  // paste
    {0x0000e010, 0x000c00b6},  // mediaTrackPrevious
    {0x0000e017, 0x0007007b},  // cut
    {0x0000e018, 0x0007007c},  // copy
    {0x0000e019, 0x000c00b5},  // mediaTrackNext
    {0x0000e01c, 0x00070058},  // numpadEnter
    {0x0000e01d, 0x000700e4},  // controlRight
    {0x0000e020, 0x0007007f},  // audioVolumeMute
    {0x0000e021, 0x000c0192},  // launchApp2
    {0x0000e022, 0x000c00cd},  // mediaPlayPause
    {0x0000e024, 0x000c00b7},  // mediaStop
    {0x0000e02c, 0x000c00b8},  // eject
    {0x0000e02e, 0x00070081},  // audioVolumeDown
    {0x0000e030, 0x00070080},  // audioVolumeUp
    {0x0000e032, 0x000c0223},  // browserHome
    {0x0000e035, 0x00070054},  // numpadDivide
    {0x0000e037, 0x00070046},  // printScreen
    {0x0000e038, 0x000700e6},  // altRight
    {0x0000e03b, 0x00070075},  // help
    {0x0000e045, 0x00070053},  // numLock
    {0x0000e047, 0x0007004a},  // home
    {0x0000e048, 0x00070052},  // arrowUp
    {0x0000e049, 0x0007004b},  // pageUp
    {0x0000e04b, 0x00070050},  // arrowLeft
    {0x0000e04d, 0x0007004f},  // arrowRight
    {0x0000e04f, 0x0007004d},  // end
    {0x0000e050, 0x00070051},  // arrowDown
    {0x0000e051, 0x0007004e},  // pageDown
    {0x0000e052, 0x00070049},  // insert
    {0x0000e053, 0x0007004c},  // delete
    {0x0000e05b, 0x000700e3},  // metaLeft
    {0x0000e05c, 0x000700e7},  // metaRight
    {0x0000e05d, 0x00070065},  // contextMenu
    {0x0000e05e, 0x00070066},  // power
    {0x0000e05f, 0x00010082},  // sleep
    {0x0000e063, 0x00010083},  // wakeUp
    {0x0000e065, 0x000c0221},  // browserSearch
    {0x0000e066, 0x000c022a},  // browserFavorites
    {0x0000e067, 0x000c0227},  // browserRefresh
    {0x0000e068, 0x000c0226},  // browserStop
    {0x0000e069, 0x000c0225},  // browserForward
    {0x0000e06a, 0x000c0224},  // browserBack
    {0x0000e06b, 0x000c0194},  // launchApp1
    {0x0000e06c, 0x000c018a},  // launchMail
    {0x0000e06d, 0x000c0183},  // mediaSelect
};

std::map<uint64_t, uint64_t> windowsToLogicalMap_ =
{
    {0x00000003, 0x00100000504},  // CANCEL -> cancel
    {0x00000008, 0x00100000008},  // BACK -> backspace
    {0x00000009, 0x00100000009},  // TAB -> tab
    {0x0000000c, 0x00100000401},  // CLEAR -> clear
    {0x0000000d, 0x0010000000d},  // RETURN -> enter
    {0x00000010, 0x00200000102},  // SHIFT -> shiftLeft
    {0x00000011, 0x00200000100},  // CONTROL -> controlLeft
    {0x00000013, 0x00100000509},  // PAUSE -> pause
    {0x00000014, 0x00100000104},  // CAPITAL -> capsLock
    {0x00000015, 0x00200000010},  // KANA, HANGEUL, HANGUL -> lang1
    {0x00000017, 0x00100000713},  // JUNJA -> junjaMode
    {0x00000018, 0x00100000706},  // FINAL -> finalMode
    {0x00000019, 0x00100000719},  // HANJA, KANJI -> kanjiMode
    {0x0000001b, 0x0010000001b},  // ESCAPE -> escape
    {0x0000001c, 0x00100000705},  // CONVERT -> convert
    {0x0000001e, 0x00100000501},  // ACCEPT -> accept
    {0x0000001f, 0x0010000070b},  // MODECHANGE -> modeChange
    {0x00000020, 0x00000000020},  // SPACE -> space
    {0x00000021, 0x00100000308},  // PRIOR -> pageUp
    {0x00000022, 0x00100000307},  // NEXT -> pageDown
    {0x00000023, 0x00100000305},  // END -> end
    {0x00000024, 0x00100000306},  // HOME -> home
    {0x00000025, 0x00100000302},  // LEFT -> arrowLeft
    {0x00000026, 0x00100000304},  // UP -> arrowUp
    {0x00000027, 0x00100000303},  // RIGHT -> arrowRight
    {0x00000028, 0x00100000301},  // DOWN -> arrowDown
    {0x00000029, 0x0010000050c},  // SELECT -> select
    {0x0000002a, 0x00100000a0c},  // PRINT -> print
    {0x0000002b, 0x00100000506},  // EXECUTE -> execute
    {0x0000002c, 0x00100000608},  // SNAPSHOT -> printScreen
    {0x0000002d, 0x00100000407},  // INSERT -> insert
    {0x0000002e, 0x0010000007f},  // DELETE -> delete
    {0x0000002f, 0x00100000508},  // HELP -> help
    {0x0000005b, 0x00200000106},  // LWIN -> metaLeft
    {0x0000005c, 0x00200000107},  // RWIN -> metaRight
    {0x0000005d, 0x00100000505},  // APPS -> contextMenu
    {0x0000005f, 0x00200000002},  // SLEEP -> sleep
    {0x00000060, 0x00200000230},  // NUMPAD0 -> numpad0
    {0x00000061, 0x00200000231},  // NUMPAD1 -> numpad1
    {0x00000062, 0x00200000232},  // NUMPAD2 -> numpad2
    {0x00000063, 0x00200000233},  // NUMPAD3 -> numpad3
    {0x00000064, 0x00200000234},  // NUMPAD4 -> numpad4
    {0x00000065, 0x00200000235},  // NUMPAD5 -> numpad5
    {0x00000066, 0x00200000236},  // NUMPAD6 -> numpad6
    {0x00000067, 0x00200000237},  // NUMPAD7 -> numpad7
    {0x00000068, 0x00200000238},  // NUMPAD8 -> numpad8
    {0x00000069, 0x00200000239},  // NUMPAD9 -> numpad9
    {0x0000006a, 0x0020000022a},  // MULTIPLY -> numpadMultiply
    {0x0000006b, 0x0020000022b},  // ADD -> numpadAdd
    {0x0000006c, 0x0020000022c},  // SEPARATOR -> numpadComma
    {0x0000006d, 0x0020000022d},  // SUBTRACT -> numpadSubtract
    {0x0000006e, 0x0020000022e},  // DECIMAL -> numpadDecimal
    {0x0000006f, 0x0020000022f},  // DIVIDE -> numpadDivide
    {0x00000070, 0x00100000801},  // F1 -> f1
    {0x00000071, 0x00100000802},  // F2 -> f2
    {0x00000072, 0x00100000803},  // F3 -> f3
    {0x00000073, 0x00100000804},  // F4 -> f4
    {0x00000074, 0x00100000805},  // F5 -> f5
    {0x00000075, 0x00100000806},  // F6 -> f6
    {0x00000076, 0x00100000807},  // F7 -> f7
    {0x00000077, 0x00100000808},  // F8 -> f8
    {0x00000078, 0x00100000809},  // F9 -> f9
    {0x00000079, 0x0010000080a},  // F10 -> f10
    {0x0000007a, 0x0010000080b},  // F11 -> f11
    {0x0000007b, 0x0010000080c},  // F12 -> f12
    {0x0000007c, 0x0010000080d},  // F13 -> f13
    {0x0000007d, 0x0010000080e},  // F14 -> f14
    {0x0000007e, 0x0010000080f},  // F15 -> f15
    {0x0000007f, 0x00100000810},  // F16 -> f16
    {0x00000080, 0x00100000811},  // F17 -> f17
    {0x00000081, 0x00100000812},  // F18 -> f18
    {0x00000082, 0x00100000813},  // F19 -> f19
    {0x00000083, 0x00100000814},  // F20 -> f20
    {0x00000084, 0x00100000815},  // F21 -> f21
    {0x00000085, 0x00100000816},  // F22 -> f22
    {0x00000086, 0x00100000817},  // F23 -> f23
    {0x00000087, 0x00100000818},  // F24 -> f24
    {0x00000090, 0x0010000010a},  // NUMLOCK -> numLock
    {0x00000091, 0x0010000010c},  // SCROLL -> scrollLock
    {0x00000092, 0x0020000023d},  // OEM_NEC_EQUAL -> numpadEqual
    {0x000000a0, 0x00200000102},  // LSHIFT -> shiftLeft
    {0x000000a1, 0x00200000103},  // RSHIFT -> shiftRight
    {0x000000a2, 0x00200000100},  // LCONTROL -> controlLeft
    {0x000000a3, 0x00200000101},  // RCONTROL -> controlRight
    {0x000000a4, 0x00200000104},  // LMENU -> altLeft
    {0x000000a5, 0x00200000105},  // RMENU -> altRight
    {0x000000a6, 0x00100000c01},  // BROWSER_BACK -> browserBack
    {0x000000a7, 0x00100000c03},  // BROWSER_FORWARD -> browserForward
    {0x000000a8, 0x00100000c05},  // BROWSER_REFRESH -> browserRefresh
    {0x000000a9, 0x00100000c07},  // BROWSER_STOP -> browserStop
    {0x000000aa, 0x00100000c06},  // BROWSER_SEARCH -> browserSearch
    {0x000000ab, 0x00100000c02},  // BROWSER_FAVORITES -> browserFavorites
    {0x000000ac, 0x00100000c04},  // BROWSER_HOME -> browserHome
    {0x000000ad, 0x00100000a11},  // VOLUME_MUTE -> audioVolumeMute
    {0x000000ae, 0x00100000a0f},  // VOLUME_DOWN -> audioVolumeDown
    {0x000000af, 0x00100000a10},  // VOLUME_UP -> audioVolumeUp
    {0x000000b2, 0x00100000a07},  // MEDIA_STOP -> mediaStop
    {0x000000b3, 0x00100000a05},  // MEDIA_PLAY_PAUSE -> mediaPlayPause
    {0x000000b4, 0x00100000b03},  // LAUNCH_MAIL -> launchMail
    {0x000000ba, 0x0000000003b},  // OEM_1 -> semicolon
    {0x000000bb, 0x0000000003d},  // OEM_PLUS -> equal
    {0x000000bc, 0x0000000002c},  // OEM_COMMA -> comma
    {0x000000bd, 0x0000000002d},  // OEM_MINUS -> minus
    {0x000000be, 0x0000000002e},  // OEM_PERIOD -> period
    {0x000000bf, 0x0000000002f},  // OEM_2 -> slash
    {0x000000c0, 0x00000000060},  // OEM_3 -> backquote
    {0x000000c3, 0x00200000308},  // GAMEPAD_A -> gameButton8
    {0x000000c4, 0x00200000309},  // GAMEPAD_B -> gameButton9
    {0x000000c5, 0x0020000030a},  // GAMEPAD_X -> gameButton10
    {0x000000c6, 0x0020000030b},  // GAMEPAD_Y -> gameButton11
    {0x000000c7, 0x0020000030c},  // GAMEPAD_RIGHT_SHOULDER -> gameButton12
    {0x000000c8, 0x0020000030d},  // GAMEPAD_LEFT_SHOULDER -> gameButton13
    {0x000000c9, 0x0020000030e},  // GAMEPAD_LEFT_TRIGGER -> gameButton14
    {0x000000ca, 0x0020000030f},  // GAMEPAD_RIGHT_TRIGGER -> gameButton15
    {0x000000cb, 0x00200000310},  // GAMEPAD_DPAD_UP -> gameButton16
    {0x000000db, 0x0000000005b},  // OEM_4 -> bracketLeft
    {0x000000dc, 0x0000000005c},  // OEM_5 -> backslash
    {0x000000dd, 0x0000000005d},  // OEM_6 -> bracketRight
    {0x000000de, 0x00000000022},  // OEM_7 -> quote
    {0x000000f6, 0x00100000503},  // ATTN -> attn
    {0x000000fa, 0x0010000050a},  // PLAY -> play
};

std::map<uint64_t, uint64_t> scanCodeToLogicalMap_ =
{
    {0x00000037, 0x0020000022a},  // numpadMultiply -> numpadMultiply
    {0x00000047, 0x00200000237},  // numpad7 -> numpad7
    {0x00000048, 0x00200000238},  // numpad8 -> numpad8
    {0x00000049, 0x00200000239},  // numpad9 -> numpad9
    {0x0000004a, 0x0020000022d},  // numpadSubtract -> numpadSubtract
    {0x0000004b, 0x00200000234},  // numpad4 -> numpad4
    {0x0000004c, 0x00200000235},  // numpad5 -> numpad5
    {0x0000004d, 0x00200000236},  // numpad6 -> numpad6
    {0x0000004e, 0x0020000022b},  // numpadAdd -> numpadAdd
    {0x0000004f, 0x00200000231},  // numpad1 -> numpad1
    {0x00000050, 0x00200000232},  // numpad2 -> numpad2
    {0x00000051, 0x00200000233},  // numpad3 -> numpad3
    {0x00000052, 0x00200000230},  // numpad0 -> numpad0
    {0x00000053, 0x0020000022e},  // numpadDecimal -> numpadDecimal
    {0x00000059, 0x0020000023d},  // numpadEqual -> numpadEqual
    {0x0000e01d, 0x00200000101},  // controlRight -> controlRight
    {0x0000e035, 0x0020000022f},  // numpadDivide -> numpadDivide
    {0x0000e038, 0x00200000105},  // altRight -> altRight
};

static bool isEasciiPrintable(int codeUnit) {
    return (codeUnit <= 0x7f && codeUnit >= 0x20) ||
        (codeUnit <= 0xff && codeUnit >= 0x80);
}

// Converts upper letters to lower letters in ASCII and extended ASCII, and
// returns as-is otherwise.
//
// Independent of locale.
static uint64_t toLower(uint64_t n) {
    constexpr uint64_t lower_a = 0x61;
    constexpr uint64_t upper_a = 0x41;
    constexpr uint64_t upper_z = 0x5a;

    constexpr uint64_t lower_a_grave = 0xe0;
    constexpr uint64_t upper_a_grave = 0xc0;
    constexpr uint64_t upper_thorn = 0xde;
    constexpr uint64_t division = 0xf7;

    // ASCII range.
    if (n >= upper_a && n <= upper_z) {
        return n - upper_a + lower_a;
    }

    // EASCII range.
    if (n >= upper_a_grave && n <= upper_thorn && n != division) {
        return n - upper_a_grave + lower_a_grave;
    }

    return n;
}

const uint64_t valueMask = 0x000ffffffff;
const uint64_t unicodePlane = 0x00000000000;
const uint64_t windowsPlane = 0x01600000000;

// Transform scancodes sent by windows to scancodes written in Chromium spec.
static uint16_t normalizeScancode(int windowsScanCode, bool extended) {
    // In Chromium spec the extended bit is shown as 0xe000 bit,
    // e.g. PageUp is represented as 0xe049.
    return (windowsScanCode & 0xff) | (extended ? 0xe000 : 0);
}

uint64_t ApplyPlaneToId(uint64_t id,
    uint64_t plane) {
    return (id & valueMask) | plane;
}

int getPhysicalKey(int scancode, bool extended) {
    int chromiumScancode = normalizeScancode(scancode, extended);
    auto resultIt = windowsToPhysicalMap_.find(chromiumScancode);
    if (resultIt != windowsToPhysicalMap_.end())
        return resultIt->second;
    return ApplyPlaneToId(scancode, windowsPlane);
}

int getLogicalKey(int key, bool extended, int scancode) {
    // Normally logical keys should only be derived from key codes, but since some
    // key codes are either 0 or ambiguous (multiple keys using the same key
    // code), these keys are resolved by scan codes.
    auto numpadIter =
        scanCodeToLogicalMap_.find(normalizeScancode(scancode, extended));
    if (numpadIter != scanCodeToLogicalMap_.cend())
        return numpadIter->second;

    // Check if the keyCode is one we know about and have a mapping for.
    auto logicalIt = windowsToLogicalMap_.find(key);
    if (logicalIt != windowsToLogicalMap_.cend())
        return logicalIt->second;

    // Upper case letters should be normalized into lower case letters.
    if (isEasciiPrintable(key)) {
        return ApplyPlaneToId(toLower(key), unicodePlane);
    }

    return ApplyPlaneToId(toLower(key), windowsPlane);
}
