
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: sort_child_properties_last

part of flutter_unreal;

int _Text_Text(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? data = _getParam<String>(L, 2)!;

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    TextStyle? style = _getNamedParam<TextStyle>(L, top_, 'style');

    StrutStyle? strutStyle = _getNamedParam<StrutStyle>(L, top_, 'strutStyle');

    TextAlign? textAlign = _getNamedParam<TextAlign>(L, top_, 'textAlign');

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection');

    Locale? locale = _getNamedParam<Locale>(L, top_, 'locale');

    bool? softWrap = _getNamedParam<bool>(L, top_, 'softWrap');

    TextOverflow? overflow = _getNamedParam<TextOverflow>(L, top_, 'overflow');

    double? textScaleFactor = _getNamedParam<double>(L, top_, 'textScaleFactor');

    int? maxLines = _getNamedParam<int>(L, top_, 'maxLines');

    String? semanticsLabel = _getNamedParam<String>(L, top_, 'semanticsLabel');

    TextWidthBasis? textWidthBasis = _getNamedParam<TextWidthBasis>(L, top_, 'textWidthBasis');

    TextHeightBehavior? textHeightBehavior = _getNamedParam<TextHeightBehavior>(L, top_, 'textHeightBehavior');

    Color? selectionColor = _getNamedParam<Color>(L, top_, 'selectionColor');

    var result_ = Text(data, key: key, style: style, strutStyle: strutStyle, textAlign: textAlign, textDirection: textDirection, locale: locale, softWrap: softWrap, overflow: overflow, textScaleFactor: textScaleFactor, maxLines: maxLines, semanticsLabel: semanticsLabel, textWidthBasis: textWidthBasis, textHeightBehavior: textHeightBehavior, selectionColor: selectionColor);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Text_rich(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    InlineSpan? textSpan = _getParam<InlineSpan>(L, 1)!;

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    TextStyle? style = _getNamedParam<TextStyle>(L, top_, 'style');

    StrutStyle? strutStyle = _getNamedParam<StrutStyle>(L, top_, 'strutStyle');

    TextAlign? textAlign = _getNamedParam<TextAlign>(L, top_, 'textAlign');

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection');

    Locale? locale = _getNamedParam<Locale>(L, top_, 'locale');

    bool? softWrap = _getNamedParam<bool>(L, top_, 'softWrap');

    TextOverflow? overflow = _getNamedParam<TextOverflow>(L, top_, 'overflow');

    double? textScaleFactor = _getNamedParam<double>(L, top_, 'textScaleFactor');

    int? maxLines = _getNamedParam<int>(L, top_, 'maxLines');

    String? semanticsLabel = _getNamedParam<String>(L, top_, 'semanticsLabel');

    TextWidthBasis? textWidthBasis = _getNamedParam<TextWidthBasis>(L, top_, 'textWidthBasis');

    TextHeightBehavior? textHeightBehavior = _getNamedParam<TextHeightBehavior>(L, top_, 'textHeightBehavior');

    Color? selectionColor = _getNamedParam<Color>(L, top_, 'selectionColor');

    var result_ = Text.rich(textSpan, key: key, style: style, strutStyle: strutStyle, textAlign: textAlign, textDirection: textDirection, locale: locale, softWrap: softWrap, overflow: overflow, textScaleFactor: textScaleFactor, maxLines: maxLines, semanticsLabel: semanticsLabel, textWidthBasis: textWidthBasis, textHeightBehavior: textHeightBehavior, selectionColor: selectionColor);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _RichText_RichText(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    InlineSpan? text = _getNamedParam<InlineSpan>(L, top_, 'text')!;

    TextAlign? textAlign = _getNamedParam<TextAlign>(L, top_, 'textAlign');
    textAlign ??= TextAlign.start;

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection');

    bool? softWrap = _getNamedParam<bool>(L, top_, 'softWrap');
    softWrap ??= true;

    TextOverflow? overflow = _getNamedParam<TextOverflow>(L, top_, 'overflow');
    overflow ??= TextOverflow.clip;

    double? textScaleFactor = _getNamedParam<double>(L, top_, 'textScaleFactor');
    textScaleFactor ??= 1.0;

    int? maxLines = _getNamedParam<int>(L, top_, 'maxLines');

    Locale? locale = _getNamedParam<Locale>(L, top_, 'locale');

    StrutStyle? strutStyle = _getNamedParam<StrutStyle>(L, top_, 'strutStyle');

    TextWidthBasis? textWidthBasis = _getNamedParam<TextWidthBasis>(L, top_, 'textWidthBasis');
    textWidthBasis ??= TextWidthBasis.parent;

    TextHeightBehavior? textHeightBehavior = _getNamedParam<TextHeightBehavior>(L, top_, 'textHeightBehavior');

    SelectionRegistrar? selectionRegistrar = _getNamedParam<SelectionRegistrar>(L, top_, 'selectionRegistrar');

    Color? selectionColor = _getNamedParam<Color>(L, top_, 'selectionColor');

    var result_ = RichText(key: key, text: text, textAlign: textAlign, textDirection: textDirection, softWrap: softWrap, overflow: overflow, textScaleFactor: textScaleFactor, maxLines: maxLines, locale: locale, strutStyle: strutStyle, textWidthBasis: textWidthBasis, textHeightBehavior: textHeightBehavior, selectionRegistrar: selectionRegistrar, selectionColor: selectionColor);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextSpan_TextSpan(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? text = _getNamedParam<String>(L, top_, 'text');

    List<InlineSpan>? children = _getNamedListParam<InlineSpan>(L, top_, 'children');

    TextStyle? style = _getNamedParam<TextStyle>(L, top_, 'style');

    GestureRecognizer? recognizer = _getNamedParam<GestureRecognizer>(L, top_, 'recognizer');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    PointerEnterEventListener? onEnter = _getVoidCallbackT<PointerEnterEvent>(L, top_, 'onEnter');

    PointerExitEventListener? onExit = _getVoidCallbackT<PointerExitEvent>(L, top_, 'onExit');

    String? semanticsLabel = _getNamedParam<String>(L, top_, 'semanticsLabel');

    Locale? locale = _getNamedParam<Locale>(L, top_, 'locale');

    bool? spellOut = _getNamedParam<bool>(L, top_, 'spellOut');

    var result_ = TextSpan(text: text, children: children, style: style, recognizer: recognizer, mouseCursor: mouseCursor, onEnter: onEnter, onExit: onExit, semanticsLabel: semanticsLabel, locale: locale, spellOut: spellOut);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _WidgetSpan_WidgetSpan(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    PlaceholderAlignment? alignment = _getNamedParam<PlaceholderAlignment>(L, top_, 'alignment');
    alignment ??= PlaceholderAlignment.bottom;

    TextBaseline? baseline = _getNamedParam<TextBaseline>(L, top_, 'baseline');

    TextStyle? style = _getNamedParam<TextStyle>(L, top_, 'style');

    var result_ = WidgetSpan(child: child, alignment: alignment, baseline: baseline, style: style);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextStyle_TextStyle(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    bool? inherit = _getNamedParam<bool>(L, top_, 'inherit');
    inherit ??= true;

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    double? fontSize = _getNamedParam<double>(L, top_, 'fontSize');

    FontWeight? fontWeight = _getNamedParam<FontWeight>(L, top_, 'fontWeight');

    FontStyle? fontStyle = _getNamedParam<FontStyle>(L, top_, 'fontStyle');

    double? letterSpacing = _getNamedParam<double>(L, top_, 'letterSpacing');

    double? wordSpacing = _getNamedParam<double>(L, top_, 'wordSpacing');

    TextBaseline? textBaseline = _getNamedParam<TextBaseline>(L, top_, 'textBaseline');

    double? height = _getNamedParam<double>(L, top_, 'height');

    TextLeadingDistribution? leadingDistribution = _getNamedParam<TextLeadingDistribution>(L, top_, 'leadingDistribution');

    Locale? locale = _getNamedParam<Locale>(L, top_, 'locale');

    Paint? foreground = _getNamedParam<Paint>(L, top_, 'foreground');

    Paint? background = _getNamedParam<Paint>(L, top_, 'background');

    List<Shadow>? shadows = _getNamedListParam<Shadow>(L, top_, 'shadows');

    List<FontFeature>? fontFeatures = _getNamedListParam<FontFeature>(L, top_, 'fontFeatures');

    List<FontVariation>? fontVariations = _getNamedListParam<FontVariation>(L, top_, 'fontVariations');

    TextDecoration? decoration = _getNamedParam<TextDecoration>(L, top_, 'decoration');

    Color? decorationColor = _getNamedParam<Color>(L, top_, 'decorationColor');

    TextDecorationStyle? decorationStyle = _getNamedParam<TextDecorationStyle>(L, top_, 'decorationStyle');

    double? decorationThickness = _getNamedParam<double>(L, top_, 'decorationThickness');

    String? debugLabel = _getNamedParam<String>(L, top_, 'debugLabel');

    String? fontFamily = _getNamedParam<String>(L, top_, 'fontFamily');

    List<String>? fontFamilyFallback = _getNamedListParam<String>(L, top_, 'fontFamilyFallback');

    String? package = _getNamedParam<String>(L, top_, 'package');

    TextOverflow? overflow = _getNamedParam<TextOverflow>(L, top_, 'overflow');

    var result_ = TextStyle(inherit: inherit, color: color, backgroundColor: backgroundColor, fontSize: fontSize, fontWeight: fontWeight, fontStyle: fontStyle, letterSpacing: letterSpacing, wordSpacing: wordSpacing, textBaseline: textBaseline, height: height, leadingDistribution: leadingDistribution, locale: locale, foreground: foreground, background: background, shadows: shadows, fontFeatures: fontFeatures, fontVariations: fontVariations, decoration: decoration, decorationColor: decorationColor, decorationStyle: decorationStyle, decorationThickness: decorationThickness, debugLabel: debugLabel, fontFamily: fontFamily, fontFamilyFallback: fontFamilyFallback, package: package, overflow: overflow);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextStyle_apply(VoidPtr L) {
  try {

    TextStyle self = luaToObjectT<TextStyle>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    var result_ = self.apply(color: color, backgroundColor: backgroundColor);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextField_TextField(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    TextEditingController? controller = _getNamedParam<TextEditingController>(L, top_, 'controller');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    InputDecoration? decoration = _getNamedParam<InputDecoration>(L, top_, 'decoration');
    decoration ??= const InputDecoration();

    TextInputType? keyboardType = _getNamedParam<TextInputType>(L, top_, 'keyboardType');

    TextInputAction? textInputAction = _getNamedParam<TextInputAction>(L, top_, 'textInputAction');

    TextCapitalization? textCapitalization = _getNamedParam<TextCapitalization>(L, top_, 'textCapitalization');
    textCapitalization ??= TextCapitalization.none;

    TextStyle? style = _getNamedParam<TextStyle>(L, top_, 'style');

    StrutStyle? strutStyle = _getNamedParam<StrutStyle>(L, top_, 'strutStyle');

    TextAlign? textAlign = _getNamedParam<TextAlign>(L, top_, 'textAlign');
    textAlign ??= TextAlign.start;

    TextAlignVertical? textAlignVertical = _getNamedParam<TextAlignVertical>(L, top_, 'textAlignVertical');

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection');

    bool? readOnly = _getNamedParam<bool>(L, top_, 'readOnly');
    readOnly ??= false;

    bool? showCursor = _getNamedParam<bool>(L, top_, 'showCursor');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    String? obscuringCharacter = _getNamedParam<String>(L, top_, 'obscuringCharacter');
    obscuringCharacter ??= '•';

    bool? obscureText = _getNamedParam<bool>(L, top_, 'obscureText');
    obscureText ??= false;

    bool? autocorrect = _getNamedParam<bool>(L, top_, 'autocorrect');
    autocorrect ??= true;

    SmartDashesType? smartDashesType = _getNamedParam<SmartDashesType>(L, top_, 'smartDashesType');

    SmartQuotesType? smartQuotesType = _getNamedParam<SmartQuotesType>(L, top_, 'smartQuotesType');

    bool? enableSuggestions = _getNamedParam<bool>(L, top_, 'enableSuggestions');
    enableSuggestions ??= true;

    int? maxLines = _getNamedParam<int>(L, top_, 'maxLines');
    maxLines ??= 1;

    int? minLines = _getNamedParam<int>(L, top_, 'minLines');

    bool? expands = _getNamedParam<bool>(L, top_, 'expands');
    expands ??= false;

    int? maxLength = _getNamedParam<int>(L, top_, 'maxLength');

    MaxLengthEnforcement? maxLengthEnforcement = _getNamedParam<MaxLengthEnforcement>(L, top_, 'maxLengthEnforcement');

    StringValueChanged? onChanged = _getVoidCallbackT<String>(L, top_, 'onChanged');

    VoidCallback? onEditingComplete = _getVoidCallback(L, top_, 'onEditingComplete');

    StringValueChanged? onSubmitted = _getVoidCallbackT<String>(L, top_, 'onSubmitted');

    AppPrivateCommandCallback? onAppPrivateCommand = _getNamedParam<AppPrivateCommandCallback>(L, top_, 'onAppPrivateCommand');

    List<TextInputFormatter>? inputFormatters = _getNamedListParam<TextInputFormatter>(L, top_, 'inputFormatters');

    bool? enabled = _getNamedParam<bool>(L, top_, 'enabled');

    double? cursorWidth = _getNamedParam<double>(L, top_, 'cursorWidth');
    cursorWidth ??= 2.0;

    double? cursorHeight = _getNamedParam<double>(L, top_, 'cursorHeight');

    Radius? cursorRadius = _getNamedParam<Radius>(L, top_, 'cursorRadius');

    Color? cursorColor = _getNamedParam<Color>(L, top_, 'cursorColor');

    BoxHeightStyle? selectionHeightStyle = _getNamedParam<BoxHeightStyle>(L, top_, 'selectionHeightStyle');
    selectionHeightStyle ??= BoxHeightStyle.tight;

    BoxWidthStyle? selectionWidthStyle = _getNamedParam<BoxWidthStyle>(L, top_, 'selectionWidthStyle');
    selectionWidthStyle ??= BoxWidthStyle.tight;

    Brightness? keyboardAppearance = _getNamedParam<Brightness>(L, top_, 'keyboardAppearance');

    EdgeInsets? scrollPadding = _getNamedParam<EdgeInsets>(L, top_, 'scrollPadding');
    scrollPadding ??= const EdgeInsets.all(20.0);

    DragStartBehavior? dragStartBehavior = _getNamedParam<DragStartBehavior>(L, top_, 'dragStartBehavior');
    dragStartBehavior ??= DragStartBehavior.start;

    bool? enableInteractiveSelection = _getNamedParam<bool>(L, top_, 'enableInteractiveSelection');

    TextSelectionControls? selectionControls = _getNamedParam<TextSelectionControls>(L, top_, 'selectionControls');

    GestureTapCallback? onTap = _getVoidCallback(L, top_, 'onTap');

    TapRegionCallback? onTapOutside = _getNamedParam<TapRegionCallback>(L, top_, 'onTapOutside');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    InputCounterWidgetBuilder? buildCounter = _getNamedParam<InputCounterWidgetBuilder>(L, top_, 'buildCounter');

    ScrollController? scrollController = _getNamedParam<ScrollController>(L, top_, 'scrollController');

    ScrollPhysics? scrollPhysics = _getNamedParam<ScrollPhysics>(L, top_, 'scrollPhysics');

    Iterable<String>? autofillHints = _getNamedParam<Iterable<String>>(L, top_, 'autofillHints');
    autofillHints ??= const <String>[];

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.hardEdge;

    String? restorationId = _getNamedParam<String>(L, top_, 'restorationId');

    bool? scribbleEnabled = _getNamedParam<bool>(L, top_, 'scribbleEnabled');
    scribbleEnabled ??= true;

    bool? enableIMEPersonalizedLearning = _getNamedParam<bool>(L, top_, 'enableIMEPersonalizedLearning');
    enableIMEPersonalizedLearning ??= true;

    SpellCheckConfiguration? spellCheckConfiguration = _getNamedParam<SpellCheckConfiguration>(L, top_, 'spellCheckConfiguration');

    TextMagnifierConfiguration? magnifierConfiguration = _getNamedParam<TextMagnifierConfiguration>(L, top_, 'magnifierConfiguration');

    var result_ = TextField(key: key, controller: controller, focusNode: focusNode, decoration: decoration, keyboardType: keyboardType, textInputAction: textInputAction, textCapitalization: textCapitalization, style: style, strutStyle: strutStyle, textAlign: textAlign, textAlignVertical: textAlignVertical, textDirection: textDirection, readOnly: readOnly, showCursor: showCursor, autofocus: autofocus, obscuringCharacter: obscuringCharacter, obscureText: obscureText, autocorrect: autocorrect, smartDashesType: smartDashesType, smartQuotesType: smartQuotesType, enableSuggestions: enableSuggestions, maxLines: maxLines, minLines: minLines, expands: expands, maxLength: maxLength, maxLengthEnforcement: maxLengthEnforcement, onChanged: onChanged, onEditingComplete: onEditingComplete, onSubmitted: onSubmitted, onAppPrivateCommand: onAppPrivateCommand, inputFormatters: inputFormatters, enabled: enabled, cursorWidth: cursorWidth, cursorHeight: cursorHeight, cursorRadius: cursorRadius, cursorColor: cursorColor, selectionHeightStyle: selectionHeightStyle, selectionWidthStyle: selectionWidthStyle, keyboardAppearance: keyboardAppearance, scrollPadding: scrollPadding, dragStartBehavior: dragStartBehavior, enableInteractiveSelection: enableInteractiveSelection, selectionControls: selectionControls, onTap: onTap, onTapOutside: onTapOutside, mouseCursor: mouseCursor, buildCounter: buildCounter, scrollController: scrollController, scrollPhysics: scrollPhysics, autofillHints: autofillHints, clipBehavior: clipBehavior, restorationId: restorationId, scribbleEnabled: scribbleEnabled, enableIMEPersonalizedLearning: enableIMEPersonalizedLearning, spellCheckConfiguration: spellCheckConfiguration, magnifierConfiguration: magnifierConfiguration);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextInputType_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #text: return luaPush(L, TextInputType.text);
    case #multiline: return luaPush(L, TextInputType.multiline);
    case #number: return luaPush(L, TextInputType.number);
    case #phone: return luaPush(L, TextInputType.phone);
    case #datetime: return luaPush(L, TextInputType.datetime);
    case #emailAddress: return luaPush(L, TextInputType.emailAddress);
    case #url: return luaPush(L, TextInputType.url);
    case #visiblePassword: return luaPush(L, TextInputType.visiblePassword);
    case #name: return luaPush(L, TextInputType.name);
    case #streetAddress: return luaPush(L, TextInputType.streetAddress);
    case #none: return luaPush(L, TextInputType.none);
  }

  lua_pushnil(L);
  return 1;
}

int _TextInputType_numberWithOptions(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    bool? signed = _getNamedParam<bool>(L, top_, 'signed');
    signed ??= false;

    bool? decimal = _getNamedParam<bool>(L, top_, 'decimal');
    decimal ??= false;

    var result_ = TextInputType.numberWithOptions(signed: signed, decimal: decimal);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextEditingController_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<TextEditingController>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #text: return luaPush(L, object.text);
    case #selection: return luaPush(L, object.selection);
  }

  lua_pushnil(L);
  return 1;
}

int _TextEditingController_setProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());
  var result = false;

  var object = luaToObjectT<TextEditingController>(L, 1);
  if (object == null) {
    lua_pushboolean(L, result);
    return 1;
  }

  switch(propName) {
    case #text: object.text = luaTo<String>(L, 3)!; result = true; break;
    case #selection: object.selection = luaTo<TextSelection>(L, 3)!; result = true; break;
  }

  lua_pushboolean(L, result);
  return 1;
}

int _TextEditingController_TextEditingController(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? text = _getNamedParam<String>(L, top_, 'text');

    var result_ = TextEditingController(text: text);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextEditingController_clear(VoidPtr L) {
  try {

    TextEditingController self = luaToObjectT<TextEditingController>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    self.clear();

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextAlignVertical_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #top: return luaPush(L, TextAlignVertical.top);
    case #center: return luaPush(L, TextAlignVertical.center);
    case #bottom: return luaPush(L, TextAlignVertical.bottom);
  }

  lua_pushnil(L);
  return 1;
}

int _TextAlignVertical_TextAlignVertical(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? y = _getNamedParam<double>(L, top_, 'y')!;

    var result_ = TextAlignVertical(y: y);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Flex_Flex(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Axis? direction = _getNamedParam<Axis>(L, top_, 'direction')!;

    MainAxisAlignment? mainAxisAlignment = _getNamedParam<MainAxisAlignment>(L, top_, 'mainAxisAlignment');
    mainAxisAlignment ??= MainAxisAlignment.start;

    MainAxisSize? mainAxisSize = _getNamedParam<MainAxisSize>(L, top_, 'mainAxisSize');
    mainAxisSize ??= MainAxisSize.max;

    CrossAxisAlignment? crossAxisAlignment = _getNamedParam<CrossAxisAlignment>(L, top_, 'crossAxisAlignment');
    crossAxisAlignment ??= CrossAxisAlignment.center;

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection');

    VerticalDirection? verticalDirection = _getNamedParam<VerticalDirection>(L, top_, 'verticalDirection');
    verticalDirection ??= VerticalDirection.down;

    TextBaseline? textBaseline = _getNamedParam<TextBaseline>(L, top_, 'textBaseline');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    List<Widget>? children = _getNamedListParam<Widget>(L, top_, 'children');
    children ??= const <Widget>[];

    var result_ = Flex(key: key, direction: direction, mainAxisAlignment: mainAxisAlignment, mainAxisSize: mainAxisSize, crossAxisAlignment: crossAxisAlignment, textDirection: textDirection, verticalDirection: verticalDirection, textBaseline: textBaseline, clipBehavior: clipBehavior, children: children);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Column_Column(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    MainAxisAlignment? mainAxisAlignment = _getNamedParam<MainAxisAlignment>(L, top_, 'mainAxisAlignment');
    mainAxisAlignment ??= MainAxisAlignment.start;

    MainAxisSize? mainAxisSize = _getNamedParam<MainAxisSize>(L, top_, 'mainAxisSize');
    mainAxisSize ??= MainAxisSize.max;

    CrossAxisAlignment? crossAxisAlignment = _getNamedParam<CrossAxisAlignment>(L, top_, 'crossAxisAlignment');
    crossAxisAlignment ??= CrossAxisAlignment.center;

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection');

    VerticalDirection? verticalDirection = _getNamedParam<VerticalDirection>(L, top_, 'verticalDirection');
    verticalDirection ??= VerticalDirection.down;

    TextBaseline? textBaseline = _getNamedParam<TextBaseline>(L, top_, 'textBaseline');

    List<Widget>? children = _getNamedListParam<Widget>(L, top_, 'children');
    children ??= const <Widget>[];

    var result_ = Column(key: key, mainAxisAlignment: mainAxisAlignment, mainAxisSize: mainAxisSize, crossAxisAlignment: crossAxisAlignment, textDirection: textDirection, verticalDirection: verticalDirection, textBaseline: textBaseline, children: children);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Row_Row(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    MainAxisAlignment? mainAxisAlignment = _getNamedParam<MainAxisAlignment>(L, top_, 'mainAxisAlignment');
    mainAxisAlignment ??= MainAxisAlignment.start;

    MainAxisSize? mainAxisSize = _getNamedParam<MainAxisSize>(L, top_, 'mainAxisSize');
    mainAxisSize ??= MainAxisSize.max;

    CrossAxisAlignment? crossAxisAlignment = _getNamedParam<CrossAxisAlignment>(L, top_, 'crossAxisAlignment');
    crossAxisAlignment ??= CrossAxisAlignment.center;

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection');

    VerticalDirection? verticalDirection = _getNamedParam<VerticalDirection>(L, top_, 'verticalDirection');
    verticalDirection ??= VerticalDirection.down;

    TextBaseline? textBaseline = _getNamedParam<TextBaseline>(L, top_, 'textBaseline');

    List<Widget>? children = _getNamedListParam<Widget>(L, top_, 'children');
    children ??= const <Widget>[];

    var result_ = Row(key: key, mainAxisAlignment: mainAxisAlignment, mainAxisSize: mainAxisSize, crossAxisAlignment: crossAxisAlignment, textDirection: textDirection, verticalDirection: verticalDirection, textBaseline: textBaseline, children: children);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Flexible_Flexible(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    int? flex = _getNamedParam<int>(L, top_, 'flex');
    flex ??= 1;

    FlexFit? fit = _getNamedParam<FlexFit>(L, top_, 'fit');
    fit ??= FlexFit.loose;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = Flexible(key: key, flex: flex, fit: fit, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Expanded_Expanded(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    int? flex = _getNamedParam<int>(L, top_, 'flex');
    flex ??= 1;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = Expanded(key: key, flex: flex, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _IconButton_IconButton(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? iconSize = _getNamedParam<double>(L, top_, 'iconSize');

    VisualDensity? visualDensity = _getNamedParam<VisualDensity>(L, top_, 'visualDensity');

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');

    double? splashRadius = _getNamedParam<double>(L, top_, 'splashRadius');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    Color? highlightColor = _getNamedParam<Color>(L, top_, 'highlightColor');

    Color? splashColor = _getNamedParam<Color>(L, top_, 'splashColor');

    Color? disabledColor = _getNamedParam<Color>(L, top_, 'disabledColor');

    VoidCallback? onPressed = _getVoidCallback(L, top_, 'onPressed');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    String? tooltip = _getNamedParam<String>(L, top_, 'tooltip');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    BoxConstraints? constraints = _getNamedParam<BoxConstraints>(L, top_, 'constraints');

    ButtonStyle? style = _getNamedParam<ButtonStyle>(L, top_, 'style');

    bool? isSelected = _getNamedParam<bool>(L, top_, 'isSelected');

    Widget? selectedIcon = _getNamedParam<Widget>(L, top_, 'selectedIcon');

    Widget? icon = _getNamedParam<Widget>(L, top_, 'icon')!;

    var result_ = IconButton(key: key, iconSize: iconSize, visualDensity: visualDensity, padding: padding, alignment: alignment, splashRadius: splashRadius, color: color, focusColor: focusColor, hoverColor: hoverColor, highlightColor: highlightColor, splashColor: splashColor, disabledColor: disabledColor, onPressed: onPressed, mouseCursor: mouseCursor, focusNode: focusNode, autofocus: autofocus, tooltip: tooltip, enableFeedback: enableFeedback, constraints: constraints, style: style, isSelected: isSelected, selectedIcon: selectedIcon, icon: icon);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextButton_TextButton(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    VoidCallback? onPressed = _getVoidCallback(L, top_, 'onPressed');

    VoidCallback? onLongPress = _getVoidCallback(L, top_, 'onLongPress');

    ValueChanged<bool>? onHover = _getVoidCallbackT<bool>(L, top_, 'onHover');

    ValueChanged<bool>? onFocusChange = _getVoidCallbackT<bool>(L, top_, 'onFocusChange');

    ButtonStyle? style = _getNamedParam<ButtonStyle>(L, top_, 'style');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    MaterialStatesController? statesController = _getNamedParam<MaterialStatesController>(L, top_, 'statesController');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = TextButton(key: key, onPressed: onPressed, onLongPress: onLongPress, onHover: onHover, onFocusChange: onFocusChange, style: style, focusNode: focusNode, autofocus: autofocus, clipBehavior: clipBehavior, statesController: statesController, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextButton_icon(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    VoidCallback? onPressed = _getVoidCallback(L, top_, 'onPressed');

    VoidCallback? onLongPress = _getVoidCallback(L, top_, 'onLongPress');

    ValueChanged<bool>? onHover = _getVoidCallbackT<bool>(L, top_, 'onHover');

    ValueChanged<bool>? onFocusChange = _getVoidCallbackT<bool>(L, top_, 'onFocusChange');

    ButtonStyle? style = _getNamedParam<ButtonStyle>(L, top_, 'style');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');

    MaterialStatesController? statesController = _getNamedParam<MaterialStatesController>(L, top_, 'statesController');

    Widget? icon = _getNamedParam<Widget>(L, top_, 'icon')!;

    Widget? label = _getNamedParam<Widget>(L, top_, 'label')!;

    var result_ = TextButton.icon(key: key, onPressed: onPressed, onLongPress: onLongPress, onHover: onHover, onFocusChange: onFocusChange, style: style, focusNode: focusNode, autofocus: autofocus, clipBehavior: clipBehavior, statesController: statesController, icon: icon, label: label);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextButton_styleFrom(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Color? foregroundColor = _getNamedParam<Color>(L, top_, 'foregroundColor');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Color? disabledForegroundColor = _getNamedParam<Color>(L, top_, 'disabledForegroundColor');

    Color? disabledBackgroundColor = _getNamedParam<Color>(L, top_, 'disabledBackgroundColor');

    Color? shadowColor = _getNamedParam<Color>(L, top_, 'shadowColor');

    Color? surfaceTintColor = _getNamedParam<Color>(L, top_, 'surfaceTintColor');

    Color? iconColor = _getNamedParam<Color>(L, top_, 'iconColor');

    Color? disabledIconColor = _getNamedParam<Color>(L, top_, 'disabledIconColor');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    TextStyle? textStyle = _getNamedParam<TextStyle>(L, top_, 'textStyle');

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    Size? minimumSize = _getNamedParam<Size>(L, top_, 'minimumSize');

    Size? fixedSize = _getNamedParam<Size>(L, top_, 'fixedSize');

    Size? maximumSize = _getNamedParam<Size>(L, top_, 'maximumSize');

    BorderSide? side = _getNamedParam<BorderSide>(L, top_, 'side');

    OutlinedBorder? shape = _getNamedParam<OutlinedBorder>(L, top_, 'shape');

    MouseCursor? enabledMouseCursor = _getNamedParam<MouseCursor>(L, top_, 'enabledMouseCursor');

    MouseCursor? disabledMouseCursor = _getNamedParam<MouseCursor>(L, top_, 'disabledMouseCursor');

    VisualDensity? visualDensity = _getNamedParam<VisualDensity>(L, top_, 'visualDensity');

    MaterialTapTargetSize? tapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'tapTargetSize');

    Duration? animationDuration = _getNamedParam<Duration>(L, top_, 'animationDuration');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');

    InteractiveInkFeatureFactory? splashFactory = _getNamedParam<InteractiveInkFeatureFactory>(L, top_, 'splashFactory');

    var result_ = TextButton.styleFrom(foregroundColor: foregroundColor, backgroundColor: backgroundColor, disabledForegroundColor: disabledForegroundColor, disabledBackgroundColor: disabledBackgroundColor, shadowColor: shadowColor, surfaceTintColor: surfaceTintColor, iconColor: iconColor, disabledIconColor: disabledIconColor, elevation: elevation, textStyle: textStyle, padding: padding, minimumSize: minimumSize, fixedSize: fixedSize, maximumSize: maximumSize, side: side, shape: shape, enabledMouseCursor: enabledMouseCursor, disabledMouseCursor: disabledMouseCursor, visualDensity: visualDensity, tapTargetSize: tapTargetSize, animationDuration: animationDuration, enableFeedback: enableFeedback, alignment: alignment, splashFactory: splashFactory);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ElevatedButton_ElevatedButton(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    VoidCallback? onPressed = _getVoidCallback(L, top_, 'onPressed');

    VoidCallback? onLongPress = _getVoidCallback(L, top_, 'onLongPress');

    ValueChanged<bool>? onHover = _getVoidCallbackT<bool>(L, top_, 'onHover');

    ValueChanged<bool>? onFocusChange = _getVoidCallbackT<bool>(L, top_, 'onFocusChange');

    ButtonStyle? style = _getNamedParam<ButtonStyle>(L, top_, 'style');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    MaterialStatesController? statesController = _getNamedParam<MaterialStatesController>(L, top_, 'statesController');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = ElevatedButton(key: key, onPressed: onPressed, onLongPress: onLongPress, onHover: onHover, onFocusChange: onFocusChange, style: style, focusNode: focusNode, autofocus: autofocus, clipBehavior: clipBehavior, statesController: statesController, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ElevatedButton_icon(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    VoidCallback? onPressed = _getVoidCallback(L, top_, 'onPressed');

    VoidCallback? onLongPress = _getVoidCallback(L, top_, 'onLongPress');

    ValueChanged<bool>? onHover = _getVoidCallbackT<bool>(L, top_, 'onHover');

    ValueChanged<bool>? onFocusChange = _getVoidCallbackT<bool>(L, top_, 'onFocusChange');

    ButtonStyle? style = _getNamedParam<ButtonStyle>(L, top_, 'style');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');

    MaterialStatesController? statesController = _getNamedParam<MaterialStatesController>(L, top_, 'statesController');

    Widget? icon = _getNamedParam<Widget>(L, top_, 'icon')!;

    Widget? label = _getNamedParam<Widget>(L, top_, 'label')!;

    var result_ = ElevatedButton.icon(key: key, onPressed: onPressed, onLongPress: onLongPress, onHover: onHover, onFocusChange: onFocusChange, style: style, focusNode: focusNode, autofocus: autofocus, clipBehavior: clipBehavior, statesController: statesController, icon: icon, label: label);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ElevatedButton_styleFrom(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Color? foregroundColor = _getNamedParam<Color>(L, top_, 'foregroundColor');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Color? disabledForegroundColor = _getNamedParam<Color>(L, top_, 'disabledForegroundColor');

    Color? disabledBackgroundColor = _getNamedParam<Color>(L, top_, 'disabledBackgroundColor');

    Color? shadowColor = _getNamedParam<Color>(L, top_, 'shadowColor');

    Color? surfaceTintColor = _getNamedParam<Color>(L, top_, 'surfaceTintColor');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    TextStyle? textStyle = _getNamedParam<TextStyle>(L, top_, 'textStyle');

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    Size? minimumSize = _getNamedParam<Size>(L, top_, 'minimumSize');

    Size? fixedSize = _getNamedParam<Size>(L, top_, 'fixedSize');

    Size? maximumSize = _getNamedParam<Size>(L, top_, 'maximumSize');

    BorderSide? side = _getNamedParam<BorderSide>(L, top_, 'side');

    OutlinedBorder? shape = _getNamedParam<OutlinedBorder>(L, top_, 'shape');

    MouseCursor? enabledMouseCursor = _getNamedParam<MouseCursor>(L, top_, 'enabledMouseCursor');

    MouseCursor? disabledMouseCursor = _getNamedParam<MouseCursor>(L, top_, 'disabledMouseCursor');

    VisualDensity? visualDensity = _getNamedParam<VisualDensity>(L, top_, 'visualDensity');

    MaterialTapTargetSize? tapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'tapTargetSize');

    Duration? animationDuration = _getNamedParam<Duration>(L, top_, 'animationDuration');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');

    InteractiveInkFeatureFactory? splashFactory = _getNamedParam<InteractiveInkFeatureFactory>(L, top_, 'splashFactory');

    Color? primary = _getNamedParam<Color>(L, top_, 'primary');

    Color? onPrimary = _getNamedParam<Color>(L, top_, 'onPrimary');

    Color? onSurface = _getNamedParam<Color>(L, top_, 'onSurface');

    var result_ = ElevatedButton.styleFrom(foregroundColor: foregroundColor, backgroundColor: backgroundColor, disabledForegroundColor: disabledForegroundColor, disabledBackgroundColor: disabledBackgroundColor, shadowColor: shadowColor, surfaceTintColor: surfaceTintColor, elevation: elevation, textStyle: textStyle, padding: padding, minimumSize: minimumSize, fixedSize: fixedSize, maximumSize: maximumSize, side: side, shape: shape, enabledMouseCursor: enabledMouseCursor, disabledMouseCursor: disabledMouseCursor, visualDensity: visualDensity, tapTargetSize: tapTargetSize, animationDuration: animationDuration, enableFeedback: enableFeedback, alignment: alignment, splashFactory: splashFactory, primary: primary, onPrimary: onPrimary, onSurface: onSurface);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _OutlinedButton_OutlinedButton(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    VoidCallback? onPressed = _getVoidCallback(L, top_, 'onPressed');

    VoidCallback? onLongPress = _getVoidCallback(L, top_, 'onLongPress');

    ValueChanged<bool>? onHover = _getVoidCallbackT<bool>(L, top_, 'onHover');

    ValueChanged<bool>? onFocusChange = _getVoidCallbackT<bool>(L, top_, 'onFocusChange');

    ButtonStyle? style = _getNamedParam<ButtonStyle>(L, top_, 'style');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    MaterialStatesController? statesController = _getNamedParam<MaterialStatesController>(L, top_, 'statesController');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = OutlinedButton(key: key, onPressed: onPressed, onLongPress: onLongPress, onHover: onHover, onFocusChange: onFocusChange, style: style, focusNode: focusNode, autofocus: autofocus, clipBehavior: clipBehavior, statesController: statesController, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _OutlinedButton_icon(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    VoidCallback? onPressed = _getVoidCallback(L, top_, 'onPressed');

    VoidCallback? onLongPress = _getVoidCallback(L, top_, 'onLongPress');

    ButtonStyle? style = _getNamedParam<ButtonStyle>(L, top_, 'style');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');

    MaterialStatesController? statesController = _getNamedParam<MaterialStatesController>(L, top_, 'statesController');

    Widget? icon = _getNamedParam<Widget>(L, top_, 'icon')!;

    Widget? label = _getNamedParam<Widget>(L, top_, 'label')!;

    var result_ = OutlinedButton.icon(key: key, onPressed: onPressed, onLongPress: onLongPress, style: style, focusNode: focusNode, autofocus: autofocus, clipBehavior: clipBehavior, statesController: statesController, icon: icon, label: label);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _IconData_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<IconData>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #codePoint: return luaPush(L, object.codePoint);
    case #fontFamily: return luaPush(L, object.fontFamily);
  }

  lua_pushnil(L);
  return 1;
}

int _IconData_IconData(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? codePoint = _getParam<int>(L, 2)!;

    String? fontFamily = _getNamedParam<String>(L, top_, 'fontFamily');

    String? fontPackage = _getNamedParam<String>(L, top_, 'fontPackage');

    bool? matchTextDirection = _getNamedParam<bool>(L, top_, 'matchTextDirection');
    matchTextDirection ??= false;

    var result_ = IconData(codePoint, fontFamily: fontFamily, fontPackage: fontPackage, matchTextDirection: matchTextDirection);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Icon_Icon(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    IconData? icon = _getParam<IconData>(L, 2);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? size = _getNamedParam<double>(L, top_, 'size');

    double? fill = _getNamedParam<double>(L, top_, 'fill');

    double? weight = _getNamedParam<double>(L, top_, 'weight');

    double? grade = _getNamedParam<double>(L, top_, 'grade');

    double? opticalSize = _getNamedParam<double>(L, top_, 'opticalSize');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    List<Shadow>? shadows = _getNamedListParam<Shadow>(L, top_, 'shadows');

    String? semanticLabel = _getNamedParam<String>(L, top_, 'semanticLabel');

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection');

    var result_ = Icon(icon, key: key, size: size, fill: fill, weight: weight, grade: grade, opticalSize: opticalSize, color: color, shadows: shadows, semanticLabel: semanticLabel, textDirection: textDirection);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Color_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<Color>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #value: return luaPush(L, object.value);
    case #alpha: return luaPush(L, object.alpha);
    case #opacity: return luaPush(L, object.opacity);
    case #red: return luaPush(L, object.red);
    case #green: return luaPush(L, object.green);
    case #blue: return luaPush(L, object.blue);
  }

  lua_pushnil(L);
  return 1;
}

int _Color_Color(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? value = _getParam<int>(L, 2)!;

    var result_ = Color(value);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Color_fromARGB(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? a = _getParam<int>(L, 1)!;

    int? r = _getParam<int>(L, 2)!;

    int? g = _getParam<int>(L, 3)!;

    int? b = _getParam<int>(L, 4)!;

    var result_ = Color.fromARGB(a, r, g, b);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Color_fromRGBO(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? r = _getParam<int>(L, 1)!;

    int? g = _getParam<int>(L, 2)!;

    int? b = _getParam<int>(L, 3)!;

    double? opacity = _getParam<double>(L, 4)!;

    var result_ = Color.fromRGBO(r, g, b, opacity);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Color_withOpacity(VoidPtr L) {
  try {

    Color self = luaToObjectT<Color>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? opacity = _getParam<double>(L, 2)!;

    var result_ = self.withOpacity(opacity);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Color_withAlpha(VoidPtr L) {
  try {

    Color self = luaToObjectT<Color>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? a = _getParam<int>(L, 2)!;

    var result_ = self.withAlpha(a);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Color_withRed(VoidPtr L) {
  try {

    Color self = luaToObjectT<Color>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? r = _getParam<int>(L, 2)!;

    var result_ = self.withRed(r);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Color_withGreen(VoidPtr L) {
  try {

    Color self = luaToObjectT<Color>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? g = _getParam<int>(L, 2)!;

    var result_ = self.withGreen(g);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Color_withBlue(VoidPtr L) {
  try {

    Color self = luaToObjectT<Color>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? b = _getParam<int>(L, 2)!;

    var result_ = self.withBlue(b);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Color_computeLuminance(VoidPtr L) {
  try {

    Color self = luaToObjectT<Color>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    var result_ = self.computeLuminance();

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Color_lerp(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Color? a = _getParam<Color>(L, 1)!;

    Color? b = _getParam<Color>(L, 2)!;

    double? t = _getParam<double>(L, 3)!;

    var result_ = Color.lerp(a, b, t);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Color_alphaBlend(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Color? foreground = _getParam<Color>(L, 1)!;

    Color? background = _getParam<Color>(L, 2)!;

    var result_ = Color.alphaBlend(foreground, background);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Color_getAlphaFromOpacity(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? opacity = _getParam<double>(L, 1)!;

    var result_ = Color.getAlphaFromOpacity(opacity);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MaterialColor_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<MaterialColor>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #shade50: return luaPush(L, object.shade50);
    case #shade100: return luaPush(L, object.shade100);
    case #shade200: return luaPush(L, object.shade200);
    case #shade300: return luaPush(L, object.shade300);
    case #shade400: return luaPush(L, object.shade400);
    case #shade500: return luaPush(L, object.shade500);
    case #shade600: return luaPush(L, object.shade600);
    case #shade700: return luaPush(L, object.shade700);
    case #shade800: return luaPush(L, object.shade800);
    case #shade900: return luaPush(L, object.shade900);
  }

  lua_pushnil(L);
  return 1;
}

int _MaterialAccentColor_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<MaterialAccentColor>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #shade100: return luaPush(L, object.shade100);
    case #shade200: return luaPush(L, object.shade200);
    case #shade400: return luaPush(L, object.shade400);
    case #shade700: return luaPush(L, object.shade700);
  }

  lua_pushnil(L);
  return 1;
}

int _Colors_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #transparent: return luaPush(L, Colors.transparent);
    case #black: return luaPush(L, Colors.black);
    case #black87: return luaPush(L, Colors.black87);
    case #black54: return luaPush(L, Colors.black54);
    case #black45: return luaPush(L, Colors.black45);
    case #black38: return luaPush(L, Colors.black38);
    case #black26: return luaPush(L, Colors.black26);
    case #black12: return luaPush(L, Colors.black12);
    case #white: return luaPush(L, Colors.white);
    case #white70: return luaPush(L, Colors.white70);
    case #white60: return luaPush(L, Colors.white60);
    case #white54: return luaPush(L, Colors.white54);
    case #white38: return luaPush(L, Colors.white38);
    case #white30: return luaPush(L, Colors.white30);
    case #white24: return luaPush(L, Colors.white24);
    case #white12: return luaPush(L, Colors.white12);
    case #white10: return luaPush(L, Colors.white10);
    case #red: return luaPush(L, Colors.red);
    case #redAccent: return luaPush(L, Colors.redAccent);
    case #pink: return luaPush(L, Colors.pink);
    case #pinkAccent: return luaPush(L, Colors.pinkAccent);
    case #purple: return luaPush(L, Colors.purple);
    case #purpleAccent: return luaPush(L, Colors.purpleAccent);
    case #deepPurple: return luaPush(L, Colors.deepPurple);
    case #deepPurpleAccent: return luaPush(L, Colors.deepPurpleAccent);
    case #indigo: return luaPush(L, Colors.indigo);
    case #indigoAccent: return luaPush(L, Colors.indigoAccent);
    case #blue: return luaPush(L, Colors.blue);
    case #blueAccent: return luaPush(L, Colors.blueAccent);
    case #lightBlue: return luaPush(L, Colors.lightBlue);
    case #lightBlueAccent: return luaPush(L, Colors.lightBlueAccent);
    case #cyan: return luaPush(L, Colors.cyan);
    case #cyanAccent: return luaPush(L, Colors.cyanAccent);
    case #teal: return luaPush(L, Colors.teal);
    case #tealAccent: return luaPush(L, Colors.tealAccent);
    case #green: return luaPush(L, Colors.green);
    case #greenAccent: return luaPush(L, Colors.greenAccent);
    case #lightGreen: return luaPush(L, Colors.lightGreen);
    case #lightGreenAccent: return luaPush(L, Colors.lightGreenAccent);
    case #lime: return luaPush(L, Colors.lime);
    case #limeAccent: return luaPush(L, Colors.limeAccent);
    case #yellow: return luaPush(L, Colors.yellow);
    case #yellowAccent: return luaPush(L, Colors.yellowAccent);
    case #amber: return luaPush(L, Colors.amber);
    case #amberAccent: return luaPush(L, Colors.amberAccent);
    case #orange: return luaPush(L, Colors.orange);
    case #orangeAccent: return luaPush(L, Colors.orangeAccent);
    case #deepOrange: return luaPush(L, Colors.deepOrange);
    case #deepOrangeAccent: return luaPush(L, Colors.deepOrangeAccent);
    case #brown: return luaPush(L, Colors.brown);
    case #grey: return luaPush(L, Colors.grey);
    case #blueGrey: return luaPush(L, Colors.blueGrey);
  }

  lua_pushnil(L);
  return 1;
}

int _WidgetsBinding_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #instance: return luaPush(L, WidgetsBinding.instance);
  }

  lua_pushnil(L);
  return 1;
}

int _WidgetsBinding_scheduleAttachRootWidget(VoidPtr L) {
  try {

    WidgetsBinding self = luaToObjectT<WidgetsBinding>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Widget? rootWidget = _getParam<Widget>(L, 2)!;

    self.scheduleAttachRootWidget(rootWidget);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _WidgetsBinding_scheduleWarmUpFrame(VoidPtr L) {
  try {

    WidgetsBinding self = luaToObjectT<WidgetsBinding>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    self.scheduleWarmUpFrame();

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _WidgetsBinding_attachRootWidget(VoidPtr L) {
  try {

    WidgetsBinding self = luaToObjectT<WidgetsBinding>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Widget? rootWidget = _getParam<Widget>(L, 2)!;

    self.attachRootWidget(rootWidget);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _WidgetsBinding_scheduleFrameCallback(VoidPtr L) {
  try {

    WidgetsBinding self = luaToObjectT<WidgetsBinding>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    FrameCallback? callback = _getVoidCallbackT<Duration>(L, 2, null)!;

    bool? rescheduling = _getNamedParam<bool>(L, top_, 'rescheduling');
    rescheduling ??= false;

    var result_ = self.scheduleFrameCallback(callback, rescheduling: rescheduling);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _WidgetsBinding_addPostFrameCallback(VoidPtr L) {
  try {

    WidgetsBinding self = luaToObjectT<WidgetsBinding>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    FrameCallback? callback = _getVoidCallbackT<Duration>(L, 2, null)!;

    self.addPostFrameCallback(callback);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _WidgetsBinding_wrapWithDefaultView(VoidPtr L) {
  try {

    WidgetsBinding self = luaToObjectT<WidgetsBinding>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Widget? rootWidget = _getParam<Widget>(L, 2)!;

    var result_ = self.wrapWithDefaultView(rootWidget);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _WidgetsFlutterBinding_ensureInitialized(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    var result_ = WidgetsFlutterBinding.ensureInitialized();

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MaterialApp_MaterialApp(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    GlobalKey<NavigatorState>? navigatorKey = _getNamedParam<GlobalKey<NavigatorState>>(L, top_, 'navigatorKey');

    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey = _getNamedParam<GlobalKey<ScaffoldMessengerState>>(L, top_, 'scaffoldMessengerKey');

    Widget? home = _getNamedParam<Widget>(L, top_, 'home');

    Map<String, WidgetBuilder>? routes = _getNamedMapParam<String, WidgetBuilder>(L, top_, 'routes');
    routes ??= const <String, WidgetBuilder>{};

    String? initialRoute = _getNamedParam<String>(L, top_, 'initialRoute');

    RouteFactory? onGenerateRoute = _getRouteFactory(L, top_, 'onGenerateRoute');

    InitialRouteListFactory? onGenerateInitialRoutes = _getNamedParam<InitialRouteListFactory>(L, top_, 'onGenerateInitialRoutes');

    RouteFactory? onUnknownRoute = _getRouteFactory(L, top_, 'onUnknownRoute');

    List<NavigatorObserver>? navigatorObservers = _getNamedListParam<NavigatorObserver>(L, top_, 'navigatorObservers');
    navigatorObservers ??= const <NavigatorObserver>[];

    TransitionBuilder? builder = _getNamedParam<TransitionBuilder>(L, top_, 'builder');

    String? title = _getNamedParam<String>(L, top_, 'title');
    title ??= '';

    GenerateAppTitle? onGenerateTitle = _getNamedParam<GenerateAppTitle>(L, top_, 'onGenerateTitle');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    ThemeData? theme = _getNamedParam<ThemeData>(L, top_, 'theme');

    ThemeData? darkTheme = _getNamedParam<ThemeData>(L, top_, 'darkTheme');

    ThemeData? highContrastTheme = _getNamedParam<ThemeData>(L, top_, 'highContrastTheme');

    ThemeData? highContrastDarkTheme = _getNamedParam<ThemeData>(L, top_, 'highContrastDarkTheme');

    ThemeMode? themeMode = _getNamedParam<ThemeMode>(L, top_, 'themeMode');
    themeMode ??= ThemeMode.system;

    Duration? themeAnimationDuration = _getNamedParam<Duration>(L, top_, 'themeAnimationDuration');
    themeAnimationDuration ??= kThemeAnimationDuration;

    Curve? themeAnimationCurve = _getNamedParam<Curve>(L, top_, 'themeAnimationCurve');
    themeAnimationCurve ??= Curves.linear;

    Locale? locale = _getNamedParam<Locale>(L, top_, 'locale');

    Iterable<LocalizationsDelegate>? localizationsDelegates = _getNamedParam<Iterable<LocalizationsDelegate>>(L, top_, 'localizationsDelegates');

    LocaleListResolutionCallback? localeListResolutionCallback = _getNamedParam<LocaleListResolutionCallback>(L, top_, 'localeListResolutionCallback');

    LocaleResolutionCallback? localeResolutionCallback = _getNamedParam<LocaleResolutionCallback>(L, top_, 'localeResolutionCallback');

    Iterable<Locale>? supportedLocales = _getNamedParam<Iterable<Locale>>(L, top_, 'supportedLocales');
    supportedLocales ??= const <Locale>[Locale('en', 'US')];

    bool? debugShowMaterialGrid = _getNamedParam<bool>(L, top_, 'debugShowMaterialGrid');
    debugShowMaterialGrid ??= false;

    bool? showPerformanceOverlay = _getNamedParam<bool>(L, top_, 'showPerformanceOverlay');
    showPerformanceOverlay ??= false;

    bool? checkerboardRasterCacheImages = _getNamedParam<bool>(L, top_, 'checkerboardRasterCacheImages');
    checkerboardRasterCacheImages ??= false;

    bool? checkerboardOffscreenLayers = _getNamedParam<bool>(L, top_, 'checkerboardOffscreenLayers');
    checkerboardOffscreenLayers ??= false;

    bool? showSemanticsDebugger = _getNamedParam<bool>(L, top_, 'showSemanticsDebugger');
    showSemanticsDebugger ??= false;

    bool? debugShowCheckedModeBanner = _getNamedParam<bool>(L, top_, 'debugShowCheckedModeBanner');
    debugShowCheckedModeBanner ??= true;

    String? restorationScopeId = _getNamedParam<String>(L, top_, 'restorationScopeId');

    ScrollBehavior? scrollBehavior = _getNamedParam<ScrollBehavior>(L, top_, 'scrollBehavior');

    var result_ = MaterialApp(key: key, navigatorKey: navigatorKey, scaffoldMessengerKey: scaffoldMessengerKey, home: home, routes: routes, initialRoute: initialRoute, onGenerateRoute: onGenerateRoute, onGenerateInitialRoutes: onGenerateInitialRoutes, onUnknownRoute: onUnknownRoute, navigatorObservers: navigatorObservers, builder: builder, title: title, onGenerateTitle: onGenerateTitle, color: color, theme: theme, darkTheme: darkTheme, highContrastTheme: highContrastTheme, highContrastDarkTheme: highContrastDarkTheme, themeMode: themeMode, themeAnimationDuration: themeAnimationDuration, themeAnimationCurve: themeAnimationCurve, locale: locale, localizationsDelegates: localizationsDelegates, localeListResolutionCallback: localeListResolutionCallback, localeResolutionCallback: localeResolutionCallback, supportedLocales: supportedLocales, debugShowMaterialGrid: debugShowMaterialGrid, showPerformanceOverlay: showPerformanceOverlay, checkerboardRasterCacheImages: checkerboardRasterCacheImages, checkerboardOffscreenLayers: checkerboardOffscreenLayers, showSemanticsDebugger: showSemanticsDebugger, debugShowCheckedModeBanner: debugShowCheckedModeBanner, restorationScopeId: restorationScopeId, scrollBehavior: scrollBehavior);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MaterialApp_router(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey = _getNamedParam<GlobalKey<ScaffoldMessengerState>>(L, top_, 'scaffoldMessengerKey');

    RouteInformationProvider? routeInformationProvider = _getNamedParam<RouteInformationProvider>(L, top_, 'routeInformationProvider');

    RouteInformationParser<Object>? routeInformationParser = _getNamedParam<RouteInformationParser<Object>>(L, top_, 'routeInformationParser');

    RouterDelegate<Object>? routerDelegate = _getNamedParam<RouterDelegate<Object>>(L, top_, 'routerDelegate');

    RouterConfig<Object>? routerConfig = _getNamedParam<RouterConfig<Object>>(L, top_, 'routerConfig');

    BackButtonDispatcher? backButtonDispatcher = _getNamedParam<BackButtonDispatcher>(L, top_, 'backButtonDispatcher');

    TransitionBuilder? builder = _getNamedParam<TransitionBuilder>(L, top_, 'builder');

    String? title = _getNamedParam<String>(L, top_, 'title');
    title ??= '';

    GenerateAppTitle? onGenerateTitle = _getNamedParam<GenerateAppTitle>(L, top_, 'onGenerateTitle');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    ThemeData? theme = _getNamedParam<ThemeData>(L, top_, 'theme');

    ThemeData? darkTheme = _getNamedParam<ThemeData>(L, top_, 'darkTheme');

    ThemeData? highContrastTheme = _getNamedParam<ThemeData>(L, top_, 'highContrastTheme');

    ThemeData? highContrastDarkTheme = _getNamedParam<ThemeData>(L, top_, 'highContrastDarkTheme');

    ThemeMode? themeMode = _getNamedParam<ThemeMode>(L, top_, 'themeMode');
    themeMode ??= ThemeMode.system;

    Duration? themeAnimationDuration = _getNamedParam<Duration>(L, top_, 'themeAnimationDuration');
    themeAnimationDuration ??= kThemeAnimationDuration;

    Curve? themeAnimationCurve = _getNamedParam<Curve>(L, top_, 'themeAnimationCurve');
    themeAnimationCurve ??= Curves.linear;

    Locale? locale = _getNamedParam<Locale>(L, top_, 'locale');

    Iterable<LocalizationsDelegate>? localizationsDelegates = _getNamedParam<Iterable<LocalizationsDelegate>>(L, top_, 'localizationsDelegates');

    LocaleListResolutionCallback? localeListResolutionCallback = _getNamedParam<LocaleListResolutionCallback>(L, top_, 'localeListResolutionCallback');

    LocaleResolutionCallback? localeResolutionCallback = _getNamedParam<LocaleResolutionCallback>(L, top_, 'localeResolutionCallback');

    Iterable<Locale>? supportedLocales = _getNamedParam<Iterable<Locale>>(L, top_, 'supportedLocales');
    supportedLocales ??= const <Locale>[Locale('en', 'US')];

    bool? debugShowMaterialGrid = _getNamedParam<bool>(L, top_, 'debugShowMaterialGrid');
    debugShowMaterialGrid ??= false;

    bool? showPerformanceOverlay = _getNamedParam<bool>(L, top_, 'showPerformanceOverlay');
    showPerformanceOverlay ??= false;

    bool? checkerboardRasterCacheImages = _getNamedParam<bool>(L, top_, 'checkerboardRasterCacheImages');
    checkerboardRasterCacheImages ??= false;

    bool? checkerboardOffscreenLayers = _getNamedParam<bool>(L, top_, 'checkerboardOffscreenLayers');
    checkerboardOffscreenLayers ??= false;

    bool? showSemanticsDebugger = _getNamedParam<bool>(L, top_, 'showSemanticsDebugger');
    showSemanticsDebugger ??= false;

    bool? debugShowCheckedModeBanner = _getNamedParam<bool>(L, top_, 'debugShowCheckedModeBanner');
    debugShowCheckedModeBanner ??= true;

    String? restorationScopeId = _getNamedParam<String>(L, top_, 'restorationScopeId');

    ScrollBehavior? scrollBehavior = _getNamedParam<ScrollBehavior>(L, top_, 'scrollBehavior');

    var result_ = MaterialApp.router(key: key, scaffoldMessengerKey: scaffoldMessengerKey, routeInformationProvider: routeInformationProvider, routeInformationParser: routeInformationParser, routerDelegate: routerDelegate, routerConfig: routerConfig, backButtonDispatcher: backButtonDispatcher, builder: builder, title: title, onGenerateTitle: onGenerateTitle, color: color, theme: theme, darkTheme: darkTheme, highContrastTheme: highContrastTheme, highContrastDarkTheme: highContrastDarkTheme, themeMode: themeMode, themeAnimationDuration: themeAnimationDuration, themeAnimationCurve: themeAnimationCurve, locale: locale, localizationsDelegates: localizationsDelegates, localeListResolutionCallback: localeListResolutionCallback, localeResolutionCallback: localeResolutionCallback, supportedLocales: supportedLocales, debugShowMaterialGrid: debugShowMaterialGrid, showPerformanceOverlay: showPerformanceOverlay, checkerboardRasterCacheImages: checkerboardRasterCacheImages, checkerboardOffscreenLayers: checkerboardOffscreenLayers, showSemanticsDebugger: showSemanticsDebugger, debugShowCheckedModeBanner: debugShowCheckedModeBanner, restorationScopeId: restorationScopeId, scrollBehavior: scrollBehavior);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ThemeData_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<ThemeData>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #colorScheme: return luaPush(L, object.colorScheme);
    case #textTheme: return luaPush(L, object.textTheme);
    case #primaryTextTheme: return luaPush(L, object.primaryTextTheme);
    case #dialogBackgroundColor: return luaPush(L, object.dialogBackgroundColor);
    case #disabledColor: return luaPush(L, object.disabledColor);
    case #dividerColor: return luaPush(L, object.dividerColor);
    case #focusColor: return luaPush(L, object.focusColor);
    case #highlightColor: return luaPush(L, object.highlightColor);
    case #hintColor: return luaPush(L, object.hintColor);
    case #hoverColor: return luaPush(L, object.hoverColor);
    case #indicatorColor: return luaPush(L, object.indicatorColor);
    case #primaryColor: return luaPush(L, object.primaryColor);
    case #primaryColorDark: return luaPush(L, object.primaryColorDark);
    case #primaryColorLight: return luaPush(L, object.primaryColorLight);
    case #scaffoldBackgroundColor: return luaPush(L, object.scaffoldBackgroundColor);
    case #secondaryHeaderColor: return luaPush(L, object.secondaryHeaderColor);
    case #shadowColor: return luaPush(L, object.shadowColor);
    case #splashColor: return luaPush(L, object.splashColor);
    case #unselectedWidgetColor: return luaPush(L, object.unselectedWidgetColor);
  }

  lua_pushnil(L);
  return 1;
}

int _ThemeData_ThemeData(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    bool? useMaterial3 = _getNamedParam<bool>(L, top_, 'useMaterial3');

    MaterialColor? primarySwatch = _getNamedParam<MaterialColor>(L, top_, 'primarySwatch');

    Brightness? brightness = _getNamedParam<Brightness>(L, top_, 'brightness');

    Color? colorSchemeSeed = _getNamedParam<Color>(L, top_, 'colorSchemeSeed');

    var result_ = ThemeData(useMaterial3: useMaterial3, primarySwatch: primarySwatch, brightness: brightness, colorSchemeSeed: colorSchemeSeed);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ThemeData_copyWith(VoidPtr L) {
  try {

    ThemeData self = luaToObjectT<ThemeData>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    bool? applyElevationOverlayColor = _getNamedParam<bool>(L, top_, 'applyElevationOverlayColor');

    NoDefaultCupertinoThemeData? cupertinoOverrideTheme = _getNamedParam<NoDefaultCupertinoThemeData>(L, top_, 'cupertinoOverrideTheme');

    Iterable<ThemeExtension>? extensions = _getNamedParam<Iterable<ThemeExtension>>(L, top_, 'extensions');

    InputDecorationTheme? inputDecorationTheme = _getNamedParam<InputDecorationTheme>(L, top_, 'inputDecorationTheme');

    MaterialTapTargetSize? materialTapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'materialTapTargetSize');

    PageTransitionsTheme? pageTransitionsTheme = _getNamedParam<PageTransitionsTheme>(L, top_, 'pageTransitionsTheme');

    TargetPlatform? platform = _getNamedParam<TargetPlatform>(L, top_, 'platform');

    ScrollbarThemeData? scrollbarTheme = _getNamedParam<ScrollbarThemeData>(L, top_, 'scrollbarTheme');

    InteractiveInkFeatureFactory? splashFactory = _getNamedParam<InteractiveInkFeatureFactory>(L, top_, 'splashFactory');

    bool? useMaterial3 = _getNamedParam<bool>(L, top_, 'useMaterial3');

    VisualDensity? visualDensity = _getNamedParam<VisualDensity>(L, top_, 'visualDensity');

    Brightness? brightness = _getNamedParam<Brightness>(L, top_, 'brightness');

    Color? canvasColor = _getNamedParam<Color>(L, top_, 'canvasColor');

    Color? cardColor = _getNamedParam<Color>(L, top_, 'cardColor');

    ColorScheme? colorScheme = _getNamedParam<ColorScheme>(L, top_, 'colorScheme');

    Color? dialogBackgroundColor = _getNamedParam<Color>(L, top_, 'dialogBackgroundColor');

    Color? disabledColor = _getNamedParam<Color>(L, top_, 'disabledColor');

    Color? dividerColor = _getNamedParam<Color>(L, top_, 'dividerColor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? highlightColor = _getNamedParam<Color>(L, top_, 'highlightColor');

    Color? hintColor = _getNamedParam<Color>(L, top_, 'hintColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    Color? indicatorColor = _getNamedParam<Color>(L, top_, 'indicatorColor');

    Color? primaryColor = _getNamedParam<Color>(L, top_, 'primaryColor');

    Color? primaryColorDark = _getNamedParam<Color>(L, top_, 'primaryColorDark');

    Color? primaryColorLight = _getNamedParam<Color>(L, top_, 'primaryColorLight');

    Color? scaffoldBackgroundColor = _getNamedParam<Color>(L, top_, 'scaffoldBackgroundColor');

    Color? secondaryHeaderColor = _getNamedParam<Color>(L, top_, 'secondaryHeaderColor');

    Color? shadowColor = _getNamedParam<Color>(L, top_, 'shadowColor');

    Color? splashColor = _getNamedParam<Color>(L, top_, 'splashColor');

    Color? unselectedWidgetColor = _getNamedParam<Color>(L, top_, 'unselectedWidgetColor');

    IconThemeData? iconTheme = _getNamedParam<IconThemeData>(L, top_, 'iconTheme');

    IconThemeData? primaryIconTheme = _getNamedParam<IconThemeData>(L, top_, 'primaryIconTheme');

    TextTheme? primaryTextTheme = _getNamedParam<TextTheme>(L, top_, 'primaryTextTheme');

    TextTheme? textTheme = _getNamedParam<TextTheme>(L, top_, 'textTheme');

    Typography? typography = _getNamedParam<Typography>(L, top_, 'typography');

    AppBarTheme? appBarTheme = _getNamedParam<AppBarTheme>(L, top_, 'appBarTheme');

    BadgeThemeData? badgeTheme = _getNamedParam<BadgeThemeData>(L, top_, 'badgeTheme');

    MaterialBannerThemeData? bannerTheme = _getNamedParam<MaterialBannerThemeData>(L, top_, 'bannerTheme');

    BottomAppBarTheme? bottomAppBarTheme = _getNamedParam<BottomAppBarTheme>(L, top_, 'bottomAppBarTheme');

    BottomNavigationBarThemeData? bottomNavigationBarTheme = _getNamedParam<BottomNavigationBarThemeData>(L, top_, 'bottomNavigationBarTheme');

    BottomSheetThemeData? bottomSheetTheme = _getNamedParam<BottomSheetThemeData>(L, top_, 'bottomSheetTheme');

    ButtonBarThemeData? buttonBarTheme = _getNamedParam<ButtonBarThemeData>(L, top_, 'buttonBarTheme');

    ButtonThemeData? buttonTheme = _getNamedParam<ButtonThemeData>(L, top_, 'buttonTheme');

    CardTheme? cardTheme = _getNamedParam<CardTheme>(L, top_, 'cardTheme');

    CheckboxThemeData? checkboxTheme = _getNamedParam<CheckboxThemeData>(L, top_, 'checkboxTheme');

    ChipThemeData? chipTheme = _getNamedParam<ChipThemeData>(L, top_, 'chipTheme');

    DataTableThemeData? dataTableTheme = _getNamedParam<DataTableThemeData>(L, top_, 'dataTableTheme');

    DialogTheme? dialogTheme = _getNamedParam<DialogTheme>(L, top_, 'dialogTheme');

    DividerThemeData? dividerTheme = _getNamedParam<DividerThemeData>(L, top_, 'dividerTheme');

    DrawerThemeData? drawerTheme = _getNamedParam<DrawerThemeData>(L, top_, 'drawerTheme');

    ElevatedButtonThemeData? elevatedButtonTheme = _getNamedParam<ElevatedButtonThemeData>(L, top_, 'elevatedButtonTheme');

    ExpansionTileThemeData? expansionTileTheme = _getNamedParam<ExpansionTileThemeData>(L, top_, 'expansionTileTheme');

    FilledButtonThemeData? filledButtonTheme = _getNamedParam<FilledButtonThemeData>(L, top_, 'filledButtonTheme');

    FloatingActionButtonThemeData? floatingActionButtonTheme = _getNamedParam<FloatingActionButtonThemeData>(L, top_, 'floatingActionButtonTheme');

    IconButtonThemeData? iconButtonTheme = _getNamedParam<IconButtonThemeData>(L, top_, 'iconButtonTheme');

    ListTileThemeData? listTileTheme = _getNamedParam<ListTileThemeData>(L, top_, 'listTileTheme');

    MenuBarThemeData? menuBarTheme = _getNamedParam<MenuBarThemeData>(L, top_, 'menuBarTheme');

    MenuButtonThemeData? menuButtonTheme = _getNamedParam<MenuButtonThemeData>(L, top_, 'menuButtonTheme');

    MenuThemeData? menuTheme = _getNamedParam<MenuThemeData>(L, top_, 'menuTheme');

    NavigationBarThemeData? navigationBarTheme = _getNamedParam<NavigationBarThemeData>(L, top_, 'navigationBarTheme');

    NavigationDrawerThemeData? navigationDrawerTheme = _getNamedParam<NavigationDrawerThemeData>(L, top_, 'navigationDrawerTheme');

    NavigationRailThemeData? navigationRailTheme = _getNamedParam<NavigationRailThemeData>(L, top_, 'navigationRailTheme');

    OutlinedButtonThemeData? outlinedButtonTheme = _getNamedParam<OutlinedButtonThemeData>(L, top_, 'outlinedButtonTheme');

    PopupMenuThemeData? popupMenuTheme = _getNamedParam<PopupMenuThemeData>(L, top_, 'popupMenuTheme');

    ProgressIndicatorThemeData? progressIndicatorTheme = _getNamedParam<ProgressIndicatorThemeData>(L, top_, 'progressIndicatorTheme');

    RadioThemeData? radioTheme = _getNamedParam<RadioThemeData>(L, top_, 'radioTheme');

    SegmentedButtonThemeData? segmentedButtonTheme = _getNamedParam<SegmentedButtonThemeData>(L, top_, 'segmentedButtonTheme');

    SliderThemeData? sliderTheme = _getNamedParam<SliderThemeData>(L, top_, 'sliderTheme');

    SnackBarThemeData? snackBarTheme = _getNamedParam<SnackBarThemeData>(L, top_, 'snackBarTheme');

    SwitchThemeData? switchTheme = _getNamedParam<SwitchThemeData>(L, top_, 'switchTheme');

    TabBarTheme? tabBarTheme = _getNamedParam<TabBarTheme>(L, top_, 'tabBarTheme');

    TextButtonThemeData? textButtonTheme = _getNamedParam<TextButtonThemeData>(L, top_, 'textButtonTheme');

    TextSelectionThemeData? textSelectionTheme = _getNamedParam<TextSelectionThemeData>(L, top_, 'textSelectionTheme');

    TimePickerThemeData? timePickerTheme = _getNamedParam<TimePickerThemeData>(L, top_, 'timePickerTheme');

    ToggleButtonsThemeData? toggleButtonsTheme = _getNamedParam<ToggleButtonsThemeData>(L, top_, 'toggleButtonsTheme');

    TooltipThemeData? tooltipTheme = _getNamedParam<TooltipThemeData>(L, top_, 'tooltipTheme');

    bool? fixTextFieldOutlineLabel = _getNamedParam<bool>(L, top_, 'fixTextFieldOutlineLabel');

    Brightness? primaryColorBrightness = _getNamedParam<Brightness>(L, top_, 'primaryColorBrightness');

    AndroidOverscrollIndicator? androidOverscrollIndicator = _getNamedParam<AndroidOverscrollIndicator>(L, top_, 'androidOverscrollIndicator');

    Color? toggleableActiveColor = _getNamedParam<Color>(L, top_, 'toggleableActiveColor');

    Color? selectedRowColor = _getNamedParam<Color>(L, top_, 'selectedRowColor');

    Color? errorColor = _getNamedParam<Color>(L, top_, 'errorColor');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Color? bottomAppBarColor = _getNamedParam<Color>(L, top_, 'bottomAppBarColor');

    var result_ = self.copyWith(applyElevationOverlayColor: applyElevationOverlayColor, cupertinoOverrideTheme: cupertinoOverrideTheme, extensions: extensions, inputDecorationTheme: inputDecorationTheme, materialTapTargetSize: materialTapTargetSize, pageTransitionsTheme: pageTransitionsTheme, platform: platform, scrollbarTheme: scrollbarTheme, splashFactory: splashFactory, useMaterial3: useMaterial3, visualDensity: visualDensity, brightness: brightness, canvasColor: canvasColor, cardColor: cardColor, colorScheme: colorScheme, dialogBackgroundColor: dialogBackgroundColor, disabledColor: disabledColor, dividerColor: dividerColor, focusColor: focusColor, highlightColor: highlightColor, hintColor: hintColor, hoverColor: hoverColor, indicatorColor: indicatorColor, primaryColor: primaryColor, primaryColorDark: primaryColorDark, primaryColorLight: primaryColorLight, scaffoldBackgroundColor: scaffoldBackgroundColor, secondaryHeaderColor: secondaryHeaderColor, shadowColor: shadowColor, splashColor: splashColor, unselectedWidgetColor: unselectedWidgetColor, iconTheme: iconTheme, primaryIconTheme: primaryIconTheme, primaryTextTheme: primaryTextTheme, textTheme: textTheme, typography: typography, appBarTheme: appBarTheme, badgeTheme: badgeTheme, bannerTheme: bannerTheme, bottomAppBarTheme: bottomAppBarTheme, bottomNavigationBarTheme: bottomNavigationBarTheme, bottomSheetTheme: bottomSheetTheme, buttonBarTheme: buttonBarTheme, buttonTheme: buttonTheme, cardTheme: cardTheme, checkboxTheme: checkboxTheme, chipTheme: chipTheme, dataTableTheme: dataTableTheme, dialogTheme: dialogTheme, dividerTheme: dividerTheme, drawerTheme: drawerTheme, elevatedButtonTheme: elevatedButtonTheme, expansionTileTheme: expansionTileTheme, filledButtonTheme: filledButtonTheme, floatingActionButtonTheme: floatingActionButtonTheme, iconButtonTheme: iconButtonTheme, listTileTheme: listTileTheme, menuBarTheme: menuBarTheme, menuButtonTheme: menuButtonTheme, menuTheme: menuTheme, navigationBarTheme: navigationBarTheme, navigationDrawerTheme: navigationDrawerTheme, navigationRailTheme: navigationRailTheme, outlinedButtonTheme: outlinedButtonTheme, popupMenuTheme: popupMenuTheme, progressIndicatorTheme: progressIndicatorTheme, radioTheme: radioTheme, segmentedButtonTheme: segmentedButtonTheme, sliderTheme: sliderTheme, snackBarTheme: snackBarTheme, switchTheme: switchTheme, tabBarTheme: tabBarTheme, textButtonTheme: textButtonTheme, textSelectionTheme: textSelectionTheme, timePickerTheme: timePickerTheme, toggleButtonsTheme: toggleButtonsTheme, tooltipTheme: tooltipTheme, fixTextFieldOutlineLabel: fixTextFieldOutlineLabel, primaryColorBrightness: primaryColorBrightness, androidOverscrollIndicator: androidOverscrollIndicator, toggleableActiveColor: toggleableActiveColor, selectedRowColor: selectedRowColor, errorColor: errorColor, backgroundColor: backgroundColor, bottomAppBarColor: bottomAppBarColor);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Theme_Theme(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    ThemeData? data = _getNamedParam<ThemeData>(L, top_, 'data')!;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = Theme(key: key, data: data, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Theme_of(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BuildContext? context = _getParam<BuildContext>(L, 1)!;

    var result_ = Theme.of(context);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ColorScheme_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<ColorScheme>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #background: return luaPush(L, object.background);
    case #brightness: return luaPush(L, object.brightness);
    case #error: return luaPush(L, object.error);
    case #errorContainer: return luaPush(L, object.errorContainer);
    case #inversePrimary: return luaPush(L, object.inversePrimary);
    case #inverseSurface: return luaPush(L, object.inverseSurface);
    case #onBackground: return luaPush(L, object.onBackground);
    case #onError: return luaPush(L, object.onError);
    case #onErrorContainer: return luaPush(L, object.onErrorContainer);
    case #onInverseSurface: return luaPush(L, object.onInverseSurface);
    case #onPrimary: return luaPush(L, object.onPrimary);
    case #onPrimaryContainer: return luaPush(L, object.onPrimaryContainer);
    case #onSecondary: return luaPush(L, object.onSecondary);
    case #onSecondaryContainer: return luaPush(L, object.onSecondaryContainer);
    case #onSurface: return luaPush(L, object.onSurface);
    case #onSurfaceVariant: return luaPush(L, object.onSurfaceVariant);
    case #onTertiary: return luaPush(L, object.onTertiary);
    case #onTertiaryContainer: return luaPush(L, object.onTertiaryContainer);
    case #outline: return luaPush(L, object.outline);
    case #outlineVariant: return luaPush(L, object.outlineVariant);
    case #primary: return luaPush(L, object.primary);
    case #primaryContainer: return luaPush(L, object.primaryContainer);
    case #scrim: return luaPush(L, object.scrim);
    case #secondary: return luaPush(L, object.secondary);
    case #secondaryContainer: return luaPush(L, object.secondaryContainer);
    case #shadow: return luaPush(L, object.shadow);
    case #surface: return luaPush(L, object.surface);
    case #surfaceTint: return luaPush(L, object.surfaceTint);
    case #surfaceVariant: return luaPush(L, object.surfaceVariant);
    case #tertiary: return luaPush(L, object.tertiary);
    case #tertiaryContainer: return luaPush(L, object.tertiaryContainer);
  }

  lua_pushnil(L);
  return 1;
}

int _ColorScheme_ColorScheme(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Brightness? brightness = _getNamedParam<Brightness>(L, top_, 'brightness')!;

    Color? primary = _getNamedParam<Color>(L, top_, 'primary')!;

    Color? onPrimary = _getNamedParam<Color>(L, top_, 'onPrimary')!;

    Color? primaryContainer = _getNamedParam<Color>(L, top_, 'primaryContainer');

    Color? onPrimaryContainer = _getNamedParam<Color>(L, top_, 'onPrimaryContainer');

    Color? secondary = _getNamedParam<Color>(L, top_, 'secondary')!;

    Color? onSecondary = _getNamedParam<Color>(L, top_, 'onSecondary')!;

    Color? secondaryContainer = _getNamedParam<Color>(L, top_, 'secondaryContainer');

    Color? onSecondaryContainer = _getNamedParam<Color>(L, top_, 'onSecondaryContainer');

    Color? tertiary = _getNamedParam<Color>(L, top_, 'tertiary');

    Color? onTertiary = _getNamedParam<Color>(L, top_, 'onTertiary');

    Color? tertiaryContainer = _getNamedParam<Color>(L, top_, 'tertiaryContainer');

    Color? onTertiaryContainer = _getNamedParam<Color>(L, top_, 'onTertiaryContainer');

    Color? error = _getNamedParam<Color>(L, top_, 'error')!;

    Color? onError = _getNamedParam<Color>(L, top_, 'onError')!;

    Color? errorContainer = _getNamedParam<Color>(L, top_, 'errorContainer');

    Color? onErrorContainer = _getNamedParam<Color>(L, top_, 'onErrorContainer');

    Color? background = _getNamedParam<Color>(L, top_, 'background')!;

    Color? onBackground = _getNamedParam<Color>(L, top_, 'onBackground')!;

    Color? surface = _getNamedParam<Color>(L, top_, 'surface')!;

    Color? onSurface = _getNamedParam<Color>(L, top_, 'onSurface')!;

    Color? surfaceVariant = _getNamedParam<Color>(L, top_, 'surfaceVariant');

    Color? onSurfaceVariant = _getNamedParam<Color>(L, top_, 'onSurfaceVariant');

    Color? outline = _getNamedParam<Color>(L, top_, 'outline');

    Color? outlineVariant = _getNamedParam<Color>(L, top_, 'outlineVariant');

    Color? shadow = _getNamedParam<Color>(L, top_, 'shadow');

    Color? scrim = _getNamedParam<Color>(L, top_, 'scrim');

    Color? inverseSurface = _getNamedParam<Color>(L, top_, 'inverseSurface');

    Color? onInverseSurface = _getNamedParam<Color>(L, top_, 'onInverseSurface');

    Color? inversePrimary = _getNamedParam<Color>(L, top_, 'inversePrimary');

    Color? surfaceTint = _getNamedParam<Color>(L, top_, 'surfaceTint');

    var result_ = ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, primaryContainer: primaryContainer, onPrimaryContainer: onPrimaryContainer, secondary: secondary, onSecondary: onSecondary, secondaryContainer: secondaryContainer, onSecondaryContainer: onSecondaryContainer, tertiary: tertiary, onTertiary: onTertiary, tertiaryContainer: tertiaryContainer, onTertiaryContainer: onTertiaryContainer, error: error, onError: onError, errorContainer: errorContainer, onErrorContainer: onErrorContainer, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface, surfaceVariant: surfaceVariant, onSurfaceVariant: onSurfaceVariant, outline: outline, outlineVariant: outlineVariant, shadow: shadow, scrim: scrim, inverseSurface: inverseSurface, onInverseSurface: onInverseSurface, inversePrimary: inversePrimary, surfaceTint: surfaceTint);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ColorScheme_dark(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Brightness? brightness = _getNamedParam<Brightness>(L, top_, 'brightness');
    brightness ??= Brightness.dark;

    Color? primary = _getNamedParam<Color>(L, top_, 'primary');
    primary ??= const Color(0xffbb86fc);

    Color? onPrimary = _getNamedParam<Color>(L, top_, 'onPrimary');
    onPrimary ??= Colors.black;

    Color? primaryContainer = _getNamedParam<Color>(L, top_, 'primaryContainer');

    Color? onPrimaryContainer = _getNamedParam<Color>(L, top_, 'onPrimaryContainer');

    Color? secondary = _getNamedParam<Color>(L, top_, 'secondary');
    secondary ??= const Color(0xff03dac6);

    Color? onSecondary = _getNamedParam<Color>(L, top_, 'onSecondary');
    onSecondary ??= Colors.black;

    Color? secondaryContainer = _getNamedParam<Color>(L, top_, 'secondaryContainer');

    Color? onSecondaryContainer = _getNamedParam<Color>(L, top_, 'onSecondaryContainer');

    Color? tertiary = _getNamedParam<Color>(L, top_, 'tertiary');

    Color? onTertiary = _getNamedParam<Color>(L, top_, 'onTertiary');

    Color? tertiaryContainer = _getNamedParam<Color>(L, top_, 'tertiaryContainer');

    Color? onTertiaryContainer = _getNamedParam<Color>(L, top_, 'onTertiaryContainer');

    Color? error = _getNamedParam<Color>(L, top_, 'error');
    error ??= const Color(0xffcf6679);

    Color? onError = _getNamedParam<Color>(L, top_, 'onError');
    onError ??= Colors.black;

    Color? errorContainer = _getNamedParam<Color>(L, top_, 'errorContainer');

    Color? onErrorContainer = _getNamedParam<Color>(L, top_, 'onErrorContainer');

    Color? background = _getNamedParam<Color>(L, top_, 'background');
    background ??= const Color(0xff121212);

    Color? onBackground = _getNamedParam<Color>(L, top_, 'onBackground');
    onBackground ??= Colors.white;

    Color? surface = _getNamedParam<Color>(L, top_, 'surface');
    surface ??= const Color(0xff121212);

    Color? onSurface = _getNamedParam<Color>(L, top_, 'onSurface');
    onSurface ??= Colors.white;

    Color? surfaceVariant = _getNamedParam<Color>(L, top_, 'surfaceVariant');

    Color? onSurfaceVariant = _getNamedParam<Color>(L, top_, 'onSurfaceVariant');

    Color? outline = _getNamedParam<Color>(L, top_, 'outline');

    Color? outlineVariant = _getNamedParam<Color>(L, top_, 'outlineVariant');

    Color? shadow = _getNamedParam<Color>(L, top_, 'shadow');

    Color? scrim = _getNamedParam<Color>(L, top_, 'scrim');

    Color? inverseSurface = _getNamedParam<Color>(L, top_, 'inverseSurface');

    Color? onInverseSurface = _getNamedParam<Color>(L, top_, 'onInverseSurface');

    Color? inversePrimary = _getNamedParam<Color>(L, top_, 'inversePrimary');

    Color? surfaceTint = _getNamedParam<Color>(L, top_, 'surfaceTint');

    var result_ = ColorScheme.dark(brightness: brightness, primary: primary, onPrimary: onPrimary, primaryContainer: primaryContainer, onPrimaryContainer: onPrimaryContainer, secondary: secondary, onSecondary: onSecondary, secondaryContainer: secondaryContainer, onSecondaryContainer: onSecondaryContainer, tertiary: tertiary, onTertiary: onTertiary, tertiaryContainer: tertiaryContainer, onTertiaryContainer: onTertiaryContainer, error: error, onError: onError, errorContainer: errorContainer, onErrorContainer: onErrorContainer, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface, surfaceVariant: surfaceVariant, onSurfaceVariant: onSurfaceVariant, outline: outline, outlineVariant: outlineVariant, shadow: shadow, scrim: scrim, inverseSurface: inverseSurface, onInverseSurface: onInverseSurface, inversePrimary: inversePrimary, surfaceTint: surfaceTint);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ColorScheme_fromSeed(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Color? seedColor = _getNamedParam<Color>(L, top_, 'seedColor')!;

    Brightness? brightness = _getNamedParam<Brightness>(L, top_, 'brightness');
    brightness ??= Brightness.light;

    Color? primary = _getNamedParam<Color>(L, top_, 'primary');

    Color? onPrimary = _getNamedParam<Color>(L, top_, 'onPrimary');

    Color? primaryContainer = _getNamedParam<Color>(L, top_, 'primaryContainer');

    Color? onPrimaryContainer = _getNamedParam<Color>(L, top_, 'onPrimaryContainer');

    Color? secondary = _getNamedParam<Color>(L, top_, 'secondary');

    Color? onSecondary = _getNamedParam<Color>(L, top_, 'onSecondary');

    Color? secondaryContainer = _getNamedParam<Color>(L, top_, 'secondaryContainer');

    Color? onSecondaryContainer = _getNamedParam<Color>(L, top_, 'onSecondaryContainer');

    Color? tertiary = _getNamedParam<Color>(L, top_, 'tertiary');

    Color? onTertiary = _getNamedParam<Color>(L, top_, 'onTertiary');

    Color? tertiaryContainer = _getNamedParam<Color>(L, top_, 'tertiaryContainer');

    Color? onTertiaryContainer = _getNamedParam<Color>(L, top_, 'onTertiaryContainer');

    Color? error = _getNamedParam<Color>(L, top_, 'error');

    Color? onError = _getNamedParam<Color>(L, top_, 'onError');

    Color? errorContainer = _getNamedParam<Color>(L, top_, 'errorContainer');

    Color? onErrorContainer = _getNamedParam<Color>(L, top_, 'onErrorContainer');

    Color? outline = _getNamedParam<Color>(L, top_, 'outline');

    Color? outlineVariant = _getNamedParam<Color>(L, top_, 'outlineVariant');

    Color? background = _getNamedParam<Color>(L, top_, 'background');

    Color? onBackground = _getNamedParam<Color>(L, top_, 'onBackground');

    Color? surface = _getNamedParam<Color>(L, top_, 'surface');

    Color? onSurface = _getNamedParam<Color>(L, top_, 'onSurface');

    Color? surfaceVariant = _getNamedParam<Color>(L, top_, 'surfaceVariant');

    Color? onSurfaceVariant = _getNamedParam<Color>(L, top_, 'onSurfaceVariant');

    Color? inverseSurface = _getNamedParam<Color>(L, top_, 'inverseSurface');

    Color? onInverseSurface = _getNamedParam<Color>(L, top_, 'onInverseSurface');

    Color? inversePrimary = _getNamedParam<Color>(L, top_, 'inversePrimary');

    Color? shadow = _getNamedParam<Color>(L, top_, 'shadow');

    Color? scrim = _getNamedParam<Color>(L, top_, 'scrim');

    Color? surfaceTint = _getNamedParam<Color>(L, top_, 'surfaceTint');

    var result_ = ColorScheme.fromSeed(seedColor: seedColor, brightness: brightness, primary: primary, onPrimary: onPrimary, primaryContainer: primaryContainer, onPrimaryContainer: onPrimaryContainer, secondary: secondary, onSecondary: onSecondary, secondaryContainer: secondaryContainer, onSecondaryContainer: onSecondaryContainer, tertiary: tertiary, onTertiary: onTertiary, tertiaryContainer: tertiaryContainer, onTertiaryContainer: onTertiaryContainer, error: error, onError: onError, errorContainer: errorContainer, onErrorContainer: onErrorContainer, outline: outline, outlineVariant: outlineVariant, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface, surfaceVariant: surfaceVariant, onSurfaceVariant: onSurfaceVariant, inverseSurface: inverseSurface, onInverseSurface: onInverseSurface, inversePrimary: inversePrimary, shadow: shadow, scrim: scrim, surfaceTint: surfaceTint);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ColorScheme_fromSwatch(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    MaterialColor? primarySwatch = _getNamedParam<MaterialColor>(L, top_, 'primarySwatch');
    primarySwatch ??= Colors.blue;

    Color? primaryColorDark = _getNamedParam<Color>(L, top_, 'primaryColorDark');

    Color? accentColor = _getNamedParam<Color>(L, top_, 'accentColor');

    Color? cardColor = _getNamedParam<Color>(L, top_, 'cardColor');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Color? errorColor = _getNamedParam<Color>(L, top_, 'errorColor');

    Brightness? brightness = _getNamedParam<Brightness>(L, top_, 'brightness');
    brightness ??= Brightness.light;

    var result_ = ColorScheme.fromSwatch(primarySwatch: primarySwatch, primaryColorDark: primaryColorDark, accentColor: accentColor, cardColor: cardColor, backgroundColor: backgroundColor, errorColor: errorColor, brightness: brightness);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ColorScheme_highContrastDark(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Brightness? brightness = _getNamedParam<Brightness>(L, top_, 'brightness');
    brightness ??= Brightness.dark;

    Color? primary = _getNamedParam<Color>(L, top_, 'primary');
    primary ??= const Color(0xffefb7ff);

    Color? onPrimary = _getNamedParam<Color>(L, top_, 'onPrimary');
    onPrimary ??= Colors.black;

    Color? primaryContainer = _getNamedParam<Color>(L, top_, 'primaryContainer');

    Color? onPrimaryContainer = _getNamedParam<Color>(L, top_, 'onPrimaryContainer');

    Color? secondary = _getNamedParam<Color>(L, top_, 'secondary');
    secondary ??= const Color(0xff66fff9);

    Color? onSecondary = _getNamedParam<Color>(L, top_, 'onSecondary');
    onSecondary ??= Colors.black;

    Color? secondaryContainer = _getNamedParam<Color>(L, top_, 'secondaryContainer');

    Color? onSecondaryContainer = _getNamedParam<Color>(L, top_, 'onSecondaryContainer');

    Color? tertiary = _getNamedParam<Color>(L, top_, 'tertiary');

    Color? onTertiary = _getNamedParam<Color>(L, top_, 'onTertiary');

    Color? tertiaryContainer = _getNamedParam<Color>(L, top_, 'tertiaryContainer');

    Color? onTertiaryContainer = _getNamedParam<Color>(L, top_, 'onTertiaryContainer');

    Color? error = _getNamedParam<Color>(L, top_, 'error');
    error ??= const Color(0xff9b374d);

    Color? onError = _getNamedParam<Color>(L, top_, 'onError');
    onError ??= Colors.black;

    Color? errorContainer = _getNamedParam<Color>(L, top_, 'errorContainer');

    Color? onErrorContainer = _getNamedParam<Color>(L, top_, 'onErrorContainer');

    Color? background = _getNamedParam<Color>(L, top_, 'background');
    background ??= const Color(0xff121212);

    Color? onBackground = _getNamedParam<Color>(L, top_, 'onBackground');
    onBackground ??= Colors.white;

    Color? surface = _getNamedParam<Color>(L, top_, 'surface');
    surface ??= const Color(0xff121212);

    Color? onSurface = _getNamedParam<Color>(L, top_, 'onSurface');
    onSurface ??= Colors.white;

    Color? surfaceVariant = _getNamedParam<Color>(L, top_, 'surfaceVariant');

    Color? onSurfaceVariant = _getNamedParam<Color>(L, top_, 'onSurfaceVariant');

    Color? outline = _getNamedParam<Color>(L, top_, 'outline');

    Color? outlineVariant = _getNamedParam<Color>(L, top_, 'outlineVariant');

    Color? shadow = _getNamedParam<Color>(L, top_, 'shadow');

    Color? scrim = _getNamedParam<Color>(L, top_, 'scrim');

    Color? inverseSurface = _getNamedParam<Color>(L, top_, 'inverseSurface');

    Color? onInverseSurface = _getNamedParam<Color>(L, top_, 'onInverseSurface');

    Color? inversePrimary = _getNamedParam<Color>(L, top_, 'inversePrimary');

    Color? surfaceTint = _getNamedParam<Color>(L, top_, 'surfaceTint');

    var result_ = ColorScheme.highContrastDark(brightness: brightness, primary: primary, onPrimary: onPrimary, primaryContainer: primaryContainer, onPrimaryContainer: onPrimaryContainer, secondary: secondary, onSecondary: onSecondary, secondaryContainer: secondaryContainer, onSecondaryContainer: onSecondaryContainer, tertiary: tertiary, onTertiary: onTertiary, tertiaryContainer: tertiaryContainer, onTertiaryContainer: onTertiaryContainer, error: error, onError: onError, errorContainer: errorContainer, onErrorContainer: onErrorContainer, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface, surfaceVariant: surfaceVariant, onSurfaceVariant: onSurfaceVariant, outline: outline, outlineVariant: outlineVariant, shadow: shadow, scrim: scrim, inverseSurface: inverseSurface, onInverseSurface: onInverseSurface, inversePrimary: inversePrimary, surfaceTint: surfaceTint);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ColorScheme_highContrastLight(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Brightness? brightness = _getNamedParam<Brightness>(L, top_, 'brightness');
    brightness ??= Brightness.light;

    Color? primary = _getNamedParam<Color>(L, top_, 'primary');
    primary ??= const Color(0xff0000ba);

    Color? onPrimary = _getNamedParam<Color>(L, top_, 'onPrimary');
    onPrimary ??= Colors.white;

    Color? primaryContainer = _getNamedParam<Color>(L, top_, 'primaryContainer');

    Color? onPrimaryContainer = _getNamedParam<Color>(L, top_, 'onPrimaryContainer');

    Color? secondary = _getNamedParam<Color>(L, top_, 'secondary');
    secondary ??= const Color(0xff66fff9);

    Color? onSecondary = _getNamedParam<Color>(L, top_, 'onSecondary');
    onSecondary ??= Colors.black;

    Color? secondaryContainer = _getNamedParam<Color>(L, top_, 'secondaryContainer');

    Color? onSecondaryContainer = _getNamedParam<Color>(L, top_, 'onSecondaryContainer');

    Color? tertiary = _getNamedParam<Color>(L, top_, 'tertiary');

    Color? onTertiary = _getNamedParam<Color>(L, top_, 'onTertiary');

    Color? tertiaryContainer = _getNamedParam<Color>(L, top_, 'tertiaryContainer');

    Color? onTertiaryContainer = _getNamedParam<Color>(L, top_, 'onTertiaryContainer');

    Color? error = _getNamedParam<Color>(L, top_, 'error');
    error ??= const Color(0xff790000);

    Color? onError = _getNamedParam<Color>(L, top_, 'onError');
    onError ??= Colors.white;

    Color? errorContainer = _getNamedParam<Color>(L, top_, 'errorContainer');

    Color? onErrorContainer = _getNamedParam<Color>(L, top_, 'onErrorContainer');

    Color? background = _getNamedParam<Color>(L, top_, 'background');
    background ??= Colors.white;

    Color? onBackground = _getNamedParam<Color>(L, top_, 'onBackground');
    onBackground ??= Colors.black;

    Color? surface = _getNamedParam<Color>(L, top_, 'surface');
    surface ??= Colors.white;

    Color? onSurface = _getNamedParam<Color>(L, top_, 'onSurface');
    onSurface ??= Colors.black;

    Color? surfaceVariant = _getNamedParam<Color>(L, top_, 'surfaceVariant');

    Color? onSurfaceVariant = _getNamedParam<Color>(L, top_, 'onSurfaceVariant');

    Color? outline = _getNamedParam<Color>(L, top_, 'outline');

    Color? outlineVariant = _getNamedParam<Color>(L, top_, 'outlineVariant');

    Color? shadow = _getNamedParam<Color>(L, top_, 'shadow');

    Color? scrim = _getNamedParam<Color>(L, top_, 'scrim');

    Color? inverseSurface = _getNamedParam<Color>(L, top_, 'inverseSurface');

    Color? onInverseSurface = _getNamedParam<Color>(L, top_, 'onInverseSurface');

    Color? inversePrimary = _getNamedParam<Color>(L, top_, 'inversePrimary');

    Color? surfaceTint = _getNamedParam<Color>(L, top_, 'surfaceTint');

    var result_ = ColorScheme.highContrastLight(brightness: brightness, primary: primary, onPrimary: onPrimary, primaryContainer: primaryContainer, onPrimaryContainer: onPrimaryContainer, secondary: secondary, onSecondary: onSecondary, secondaryContainer: secondaryContainer, onSecondaryContainer: onSecondaryContainer, tertiary: tertiary, onTertiary: onTertiary, tertiaryContainer: tertiaryContainer, onTertiaryContainer: onTertiaryContainer, error: error, onError: onError, errorContainer: errorContainer, onErrorContainer: onErrorContainer, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface, surfaceVariant: surfaceVariant, onSurfaceVariant: onSurfaceVariant, outline: outline, outlineVariant: outlineVariant, shadow: shadow, scrim: scrim, inverseSurface: inverseSurface, onInverseSurface: onInverseSurface, inversePrimary: inversePrimary, surfaceTint: surfaceTint);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ColorScheme_light(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Brightness? brightness = _getNamedParam<Brightness>(L, top_, 'brightness');
    brightness ??= Brightness.light;

    Color? primary = _getNamedParam<Color>(L, top_, 'primary');
    primary ??= const Color(0xff6200ee);

    Color? onPrimary = _getNamedParam<Color>(L, top_, 'onPrimary');
    onPrimary ??= Colors.white;

    Color? primaryContainer = _getNamedParam<Color>(L, top_, 'primaryContainer');

    Color? onPrimaryContainer = _getNamedParam<Color>(L, top_, 'onPrimaryContainer');

    Color? secondary = _getNamedParam<Color>(L, top_, 'secondary');
    secondary ??= const Color(0xff03dac6);

    Color? onSecondary = _getNamedParam<Color>(L, top_, 'onSecondary');
    onSecondary ??= Colors.black;

    Color? secondaryContainer = _getNamedParam<Color>(L, top_, 'secondaryContainer');

    Color? onSecondaryContainer = _getNamedParam<Color>(L, top_, 'onSecondaryContainer');

    Color? tertiary = _getNamedParam<Color>(L, top_, 'tertiary');

    Color? onTertiary = _getNamedParam<Color>(L, top_, 'onTertiary');

    Color? tertiaryContainer = _getNamedParam<Color>(L, top_, 'tertiaryContainer');

    Color? onTertiaryContainer = _getNamedParam<Color>(L, top_, 'onTertiaryContainer');

    Color? error = _getNamedParam<Color>(L, top_, 'error');
    error ??= const Color(0xffb00020);

    Color? onError = _getNamedParam<Color>(L, top_, 'onError');
    onError ??= Colors.white;

    Color? errorContainer = _getNamedParam<Color>(L, top_, 'errorContainer');

    Color? onErrorContainer = _getNamedParam<Color>(L, top_, 'onErrorContainer');

    Color? background = _getNamedParam<Color>(L, top_, 'background');
    background ??= Colors.white;

    Color? onBackground = _getNamedParam<Color>(L, top_, 'onBackground');
    onBackground ??= Colors.black;

    Color? surface = _getNamedParam<Color>(L, top_, 'surface');
    surface ??= Colors.white;

    Color? onSurface = _getNamedParam<Color>(L, top_, 'onSurface');
    onSurface ??= Colors.black;

    Color? surfaceVariant = _getNamedParam<Color>(L, top_, 'surfaceVariant');

    Color? onSurfaceVariant = _getNamedParam<Color>(L, top_, 'onSurfaceVariant');

    Color? outline = _getNamedParam<Color>(L, top_, 'outline');

    Color? outlineVariant = _getNamedParam<Color>(L, top_, 'outlineVariant');

    Color? shadow = _getNamedParam<Color>(L, top_, 'shadow');

    Color? scrim = _getNamedParam<Color>(L, top_, 'scrim');

    Color? inverseSurface = _getNamedParam<Color>(L, top_, 'inverseSurface');

    Color? onInverseSurface = _getNamedParam<Color>(L, top_, 'onInverseSurface');

    Color? inversePrimary = _getNamedParam<Color>(L, top_, 'inversePrimary');

    Color? surfaceTint = _getNamedParam<Color>(L, top_, 'surfaceTint');

    var result_ = ColorScheme.light(brightness: brightness, primary: primary, onPrimary: onPrimary, primaryContainer: primaryContainer, onPrimaryContainer: onPrimaryContainer, secondary: secondary, onSecondary: onSecondary, secondaryContainer: secondaryContainer, onSecondaryContainer: onSecondaryContainer, tertiary: tertiary, onTertiary: onTertiary, tertiaryContainer: tertiaryContainer, onTertiaryContainer: onTertiaryContainer, error: error, onError: onError, errorContainer: errorContainer, onErrorContainer: onErrorContainer, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface, surfaceVariant: surfaceVariant, onSurfaceVariant: onSurfaceVariant, outline: outline, outlineVariant: outlineVariant, shadow: shadow, scrim: scrim, inverseSurface: inverseSurface, onInverseSurface: onInverseSurface, inversePrimary: inversePrimary, surfaceTint: surfaceTint);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ColorScheme_copyWith(VoidPtr L) {
  try {

    ColorScheme self = luaToObjectT<ColorScheme>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Brightness? brightness = _getNamedParam<Brightness>(L, top_, 'brightness');

    Color? primary = _getNamedParam<Color>(L, top_, 'primary');

    Color? onPrimary = _getNamedParam<Color>(L, top_, 'onPrimary');

    Color? primaryContainer = _getNamedParam<Color>(L, top_, 'primaryContainer');

    Color? onPrimaryContainer = _getNamedParam<Color>(L, top_, 'onPrimaryContainer');

    Color? secondary = _getNamedParam<Color>(L, top_, 'secondary');

    Color? onSecondary = _getNamedParam<Color>(L, top_, 'onSecondary');

    Color? secondaryContainer = _getNamedParam<Color>(L, top_, 'secondaryContainer');

    Color? onSecondaryContainer = _getNamedParam<Color>(L, top_, 'onSecondaryContainer');

    Color? tertiary = _getNamedParam<Color>(L, top_, 'tertiary');

    Color? onTertiary = _getNamedParam<Color>(L, top_, 'onTertiary');

    Color? tertiaryContainer = _getNamedParam<Color>(L, top_, 'tertiaryContainer');

    Color? onTertiaryContainer = _getNamedParam<Color>(L, top_, 'onTertiaryContainer');

    Color? error = _getNamedParam<Color>(L, top_, 'error');

    Color? onError = _getNamedParam<Color>(L, top_, 'onError');

    Color? errorContainer = _getNamedParam<Color>(L, top_, 'errorContainer');

    Color? onErrorContainer = _getNamedParam<Color>(L, top_, 'onErrorContainer');

    Color? background = _getNamedParam<Color>(L, top_, 'background');

    Color? onBackground = _getNamedParam<Color>(L, top_, 'onBackground');

    Color? surface = _getNamedParam<Color>(L, top_, 'surface');

    Color? onSurface = _getNamedParam<Color>(L, top_, 'onSurface');

    Color? surfaceVariant = _getNamedParam<Color>(L, top_, 'surfaceVariant');

    Color? onSurfaceVariant = _getNamedParam<Color>(L, top_, 'onSurfaceVariant');

    Color? outline = _getNamedParam<Color>(L, top_, 'outline');

    Color? outlineVariant = _getNamedParam<Color>(L, top_, 'outlineVariant');

    Color? shadow = _getNamedParam<Color>(L, top_, 'shadow');

    Color? scrim = _getNamedParam<Color>(L, top_, 'scrim');

    Color? inverseSurface = _getNamedParam<Color>(L, top_, 'inverseSurface');

    Color? onInverseSurface = _getNamedParam<Color>(L, top_, 'onInverseSurface');

    Color? inversePrimary = _getNamedParam<Color>(L, top_, 'inversePrimary');

    Color? surfaceTint = _getNamedParam<Color>(L, top_, 'surfaceTint');

    Color? primaryVariant = _getNamedParam<Color>(L, top_, 'primaryVariant');

    Color? secondaryVariant = _getNamedParam<Color>(L, top_, 'secondaryVariant');

    var result_ = self.copyWith(brightness: brightness, primary: primary, onPrimary: onPrimary, primaryContainer: primaryContainer, onPrimaryContainer: onPrimaryContainer, secondary: secondary, onSecondary: onSecondary, secondaryContainer: secondaryContainer, onSecondaryContainer: onSecondaryContainer, tertiary: tertiary, onTertiary: onTertiary, tertiaryContainer: tertiaryContainer, onTertiaryContainer: onTertiaryContainer, error: error, onError: onError, errorContainer: errorContainer, onErrorContainer: onErrorContainer, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface, surfaceVariant: surfaceVariant, onSurfaceVariant: onSurfaceVariant, outline: outline, outlineVariant: outlineVariant, shadow: shadow, scrim: scrim, inverseSurface: inverseSurface, onInverseSurface: onInverseSurface, inversePrimary: inversePrimary, surfaceTint: surfaceTint, primaryVariant: primaryVariant, secondaryVariant: secondaryVariant);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ColorScheme_lerp(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    ColorScheme? a = _getParam<ColorScheme>(L, 1)!;

    ColorScheme? b = _getParam<ColorScheme>(L, 2)!;

    double? t = _getParam<double>(L, 3)!;

    var result_ = ColorScheme.lerp(a, b, t);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextTheme_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<TextTheme>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #displayLarge: return luaPush(L, object.displayLarge);
    case #displayMedium: return luaPush(L, object.displayMedium);
    case #displaySmall: return luaPush(L, object.displaySmall);
    case #headlineLarge: return luaPush(L, object.headlineLarge);
    case #headlineMedium: return luaPush(L, object.headlineMedium);
    case #headlineSmall: return luaPush(L, object.headlineSmall);
    case #titleLarge: return luaPush(L, object.titleLarge);
    case #titleMedium: return luaPush(L, object.titleMedium);
    case #titleSmall: return luaPush(L, object.titleSmall);
    case #bodyLarge: return luaPush(L, object.bodyLarge);
    case #bodyMedium: return luaPush(L, object.bodyMedium);
    case #bodySmall: return luaPush(L, object.bodySmall);
    case #labelLarge: return luaPush(L, object.labelLarge);
    case #labelMedium: return luaPush(L, object.labelMedium);
    case #labelSmall: return luaPush(L, object.labelSmall);
  }

  lua_pushnil(L);
  return 1;
}

int _NavigationService_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #navigatorKey: return luaPush(L, NavigationService.navigatorKey);
  }

  lua_pushnil(L);
  return 1;
}

int _NavigationService_setProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());
  var result = false;

  switch(propName) {
    case #navigatorKey: NavigationService.navigatorKey = luaTo<GlobalKey<NavigatorState>>(L, 3)!; result = true; break;
  }

  if (result) {
    lua_pushboolean(L, result);
    return 1;
  }

  lua_pushboolean(L, result);
  return 1;
}

int _NavigationService_context(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    var result_ = NavigationService.context();

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Navigator_of(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BuildContext? context = _getParam<BuildContext>(L, 1)!;

    bool? rootNavigator = _getNamedParam<bool>(L, top_, 'rootNavigator');
    rootNavigator ??= false;

    var result_ = Navigator.of(context, rootNavigator: rootNavigator);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _NavigatorState_pushReplacementNamed(VoidPtr L) {
  try {

    NavigatorState self = luaToObjectT<NavigatorState>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? routeName = _getParam<String>(L, 2)!;

    self.pushReplacementNamed(routeName);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _NavigatorState_popAndPushNamed(VoidPtr L) {
  try {

    NavigatorState self = luaToObjectT<NavigatorState>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? routeName = _getParam<String>(L, 2)!;

    self.popAndPushNamed(routeName);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _NavigatorState_pushNamed(VoidPtr L) {
  try {

    NavigatorState self = luaToObjectT<NavigatorState>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? routeName = _getParam<String>(L, 2)!;

    self.pushNamed(routeName);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _NavigatorState_canPop(VoidPtr L) {
  try {

    NavigatorState self = luaToObjectT<NavigatorState>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    var result_ = self.canPop();

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _NavigatorState_pop(VoidPtr L) {
  try {

    NavigatorState self = luaToObjectT<NavigatorState>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Object? result = _getParam<Object>(L, 2);

    self.pop(result);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _NavigatorState_push(VoidPtr L) {
  try {

    NavigatorState self = luaToObjectT<NavigatorState>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Route? route = _getParam<Route>(L, 2)!;

    self.push(route);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _NavigatorState_removeRoute(VoidPtr L) {
  try {

    NavigatorState self = luaToObjectT<NavigatorState>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Route? route = _getParam<Route>(L, 2)!;

    self.removeRoute(route);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _DialogRoute_DialogRoute(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BuildContext? context = _getNamedParam<BuildContext>(L, top_, 'context')!;

    WidgetBuilder? builder = _getWidgetBuilder(L, top_, 'builder')!;

    CapturedThemes? themes = _getNamedParam<CapturedThemes>(L, top_, 'themes');

    Color? barrierColor = _getNamedParam<Color>(L, top_, 'barrierColor');
    barrierColor ??= Colors.black54;

    bool? barrierDismissible = _getNamedParam<bool>(L, top_, 'barrierDismissible');
    barrierDismissible ??= true;

    String? barrierLabel = _getNamedParam<String>(L, top_, 'barrierLabel');

    bool? useSafeArea = _getNamedParam<bool>(L, top_, 'useSafeArea');
    useSafeArea ??= true;

    RouteSettings? settings = _getNamedParam<RouteSettings>(L, top_, 'settings');

    Offset? anchorPoint = _getNamedParam<Offset>(L, top_, 'anchorPoint');

    var result_ = DialogRoute(context: context, builder: builder, themes: themes, barrierColor: barrierColor, barrierDismissible: barrierDismissible, barrierLabel: barrierLabel, useSafeArea: useSafeArea, settings: settings, anchorPoint: anchorPoint);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Center_Center(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? widthFactor = _getNamedParam<double>(L, top_, 'widthFactor');

    double? heightFactor = _getNamedParam<double>(L, top_, 'heightFactor');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = Center(key: key, widthFactor: widthFactor, heightFactor: heightFactor, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _LStatelessWidget_LStatelessWidget(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    WidgetBuilder? builder = _getWidgetBuilder(L, top_, 'builder')!;

    var result_ = LStatelessWidget(key: key, builder: builder);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _LStatefulWidget_LStatefulWidget(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    StateCreator? stateCreator = _getStateCreator(L, top_, 'stateCreator')!;

    var result_ = LStatefulWidget(key: key, stateCreator: stateCreator);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _LState_LState(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    WidgetBuilder? builder = _getWidgetBuilder(L, top_, 'builder')!;

    VoidCallback? onInit = _getVoidCallback(L, top_, 'onInit');

    var result_ = LState(builder: builder, onInit: onInit);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _LState_markNeedsBuild(VoidPtr L) {
  try {

    LState self = luaToObjectT<LState>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    self.markNeedsBuild();

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Builder_Builder(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    WidgetBuilder? builder = _getWidgetBuilder(L, top_, 'builder')!;

    var result_ = Builder(key: key, builder: builder);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _StatefulBuilder_StatefulBuilder(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    StatefulWidgetBuilder? builder = _getStatefulWidgetBuilder(L, top_, 'builder')!;

    var result_ = StatefulBuilder(key: key, builder: builder);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SizedBox_SizedBox(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? height = _getNamedParam<double>(L, top_, 'height');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = SizedBox(key: key, width: width, height: height, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SizedBox_expand(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = SizedBox.expand(key: key, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SizedBox_fromSize(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    Size? size = _getNamedParam<Size>(L, top_, 'size');

    var result_ = SizedBox.fromSize(key: key, child: child, size: size);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SizedBox_shrink(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = SizedBox.shrink(key: key, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SizedBox_square(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    double? dimension = _getNamedParam<double>(L, top_, 'dimension');

    var result_ = SizedBox.square(key: key, child: child, dimension: dimension);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Spacer_Spacer(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    int? flex = _getNamedParam<int>(L, top_, 'flex');
    flex ??= 1;

    var result_ = Spacer(key: key, flex: flex);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Material_Material(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    MaterialType? type = _getNamedParam<MaterialType>(L, top_, 'type');
    type ??= MaterialType.canvas;

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');
    elevation ??= 0.0;

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Color? shadowColor = _getNamedParam<Color>(L, top_, 'shadowColor');

    Color? surfaceTintColor = _getNamedParam<Color>(L, top_, 'surfaceTintColor');

    TextStyle? textStyle = _getNamedParam<TextStyle>(L, top_, 'textStyle');

    BorderRadiusGeometry? borderRadius = _getNamedParam<BorderRadiusGeometry>(L, top_, 'borderRadius');

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    bool? borderOnForeground = _getNamedParam<bool>(L, top_, 'borderOnForeground');
    borderOnForeground ??= true;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    Duration? animationDuration = _getNamedParam<Duration>(L, top_, 'animationDuration');
    animationDuration ??= kThemeChangeDuration;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = Material(key: key, type: type, elevation: elevation, color: color, shadowColor: shadowColor, surfaceTintColor: surfaceTintColor, textStyle: textStyle, borderRadius: borderRadius, shape: shape, borderOnForeground: borderOnForeground, clipBehavior: clipBehavior, animationDuration: animationDuration, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _InkWell_InkWell(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    GestureTapCallback? onTap = _getVoidCallback(L, top_, 'onTap');

    GestureTapCallback? onDoubleTap = _getVoidCallback(L, top_, 'onDoubleTap');

    GestureLongPressCallback? onLongPress = _getVoidCallback(L, top_, 'onLongPress');

    GestureTapDownCallback? onTapDown = _getVoidCallbackT<TapDownDetails>(L, top_, 'onTapDown');

    GestureTapUpCallback? onTapUp = _getVoidCallbackT<TapUpDetails>(L, top_, 'onTapUp');

    GestureTapCallback? onTapCancel = _getVoidCallback(L, top_, 'onTapCancel');

    GestureTapCallback? onSecondaryTap = _getVoidCallback(L, top_, 'onSecondaryTap');

    GestureTapUpCallback? onSecondaryTapUp = _getVoidCallbackT<TapUpDetails>(L, top_, 'onSecondaryTapUp');

    GestureTapDownCallback? onSecondaryTapDown = _getVoidCallbackT<TapDownDetails>(L, top_, 'onSecondaryTapDown');

    GestureTapCallback? onSecondaryTapCancel = _getVoidCallback(L, top_, 'onSecondaryTapCancel');

    ValueChanged<bool>? onHighlightChanged = _getVoidCallbackT<bool>(L, top_, 'onHighlightChanged');

    ValueChanged<bool>? onHover = _getVoidCallbackT<bool>(L, top_, 'onHover');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    Color? highlightColor = _getNamedParam<Color>(L, top_, 'highlightColor');

    MaterialStateProperty<Color?>? overlayColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'overlayColor');

    Color? splashColor = _getNamedParam<Color>(L, top_, 'splashColor');

    InteractiveInkFeatureFactory? splashFactory = _getNamedParam<InteractiveInkFeatureFactory>(L, top_, 'splashFactory');

    double? radius = _getNamedParam<double>(L, top_, 'radius');

    BorderRadius? borderRadius = _getNamedParam<BorderRadius>(L, top_, 'borderRadius');

    ShapeBorder? customBorder = _getNamedParam<ShapeBorder>(L, top_, 'customBorder');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');
    enableFeedback ??= true;

    bool? excludeFromSemantics = _getNamedParam<bool>(L, top_, 'excludeFromSemantics');
    excludeFromSemantics ??= false;

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? canRequestFocus = _getNamedParam<bool>(L, top_, 'canRequestFocus');
    canRequestFocus ??= true;

    ValueChanged<bool>? onFocusChange = _getVoidCallbackT<bool>(L, top_, 'onFocusChange');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    MaterialStatesController? statesController = _getNamedParam<MaterialStatesController>(L, top_, 'statesController');

    var result_ = InkWell(key: key, child: child, onTap: onTap, onDoubleTap: onDoubleTap, onLongPress: onLongPress, onTapDown: onTapDown, onTapUp: onTapUp, onTapCancel: onTapCancel, onSecondaryTap: onSecondaryTap, onSecondaryTapUp: onSecondaryTapUp, onSecondaryTapDown: onSecondaryTapDown, onSecondaryTapCancel: onSecondaryTapCancel, onHighlightChanged: onHighlightChanged, onHover: onHover, mouseCursor: mouseCursor, focusColor: focusColor, hoverColor: hoverColor, highlightColor: highlightColor, overlayColor: overlayColor, splashColor: splashColor, splashFactory: splashFactory, radius: radius, borderRadius: borderRadius, customBorder: customBorder, enableFeedback: enableFeedback, excludeFromSemantics: excludeFromSemantics, focusNode: focusNode, canRequestFocus: canRequestFocus, onFocusChange: onFocusChange, autofocus: autofocus, statesController: statesController);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _InkResponse_InkResponse(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    GestureTapCallback? onTap = _getVoidCallback(L, top_, 'onTap');

    GestureTapDownCallback? onTapDown = _getVoidCallbackT<TapDownDetails>(L, top_, 'onTapDown');

    GestureTapUpCallback? onTapUp = _getVoidCallbackT<TapUpDetails>(L, top_, 'onTapUp');

    GestureTapCallback? onTapCancel = _getVoidCallback(L, top_, 'onTapCancel');

    GestureTapCallback? onDoubleTap = _getVoidCallback(L, top_, 'onDoubleTap');

    GestureLongPressCallback? onLongPress = _getVoidCallback(L, top_, 'onLongPress');

    GestureTapCallback? onSecondaryTap = _getVoidCallback(L, top_, 'onSecondaryTap');

    GestureTapUpCallback? onSecondaryTapUp = _getVoidCallbackT<TapUpDetails>(L, top_, 'onSecondaryTapUp');

    GestureTapDownCallback? onSecondaryTapDown = _getVoidCallbackT<TapDownDetails>(L, top_, 'onSecondaryTapDown');

    GestureTapCallback? onSecondaryTapCancel = _getVoidCallback(L, top_, 'onSecondaryTapCancel');

    ValueChanged<bool>? onHighlightChanged = _getVoidCallbackT<bool>(L, top_, 'onHighlightChanged');

    ValueChanged<bool>? onHover = _getVoidCallbackT<bool>(L, top_, 'onHover');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    bool? containedInkWell = _getNamedParam<bool>(L, top_, 'containedInkWell');
    containedInkWell ??= false;

    BoxShape? highlightShape = _getNamedParam<BoxShape>(L, top_, 'highlightShape');
    highlightShape ??= BoxShape.circle;

    double? radius = _getNamedParam<double>(L, top_, 'radius');

    BorderRadius? borderRadius = _getNamedParam<BorderRadius>(L, top_, 'borderRadius');

    ShapeBorder? customBorder = _getNamedParam<ShapeBorder>(L, top_, 'customBorder');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    Color? highlightColor = _getNamedParam<Color>(L, top_, 'highlightColor');

    MaterialStateProperty<Color?>? overlayColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'overlayColor');

    Color? splashColor = _getNamedParam<Color>(L, top_, 'splashColor');

    InteractiveInkFeatureFactory? splashFactory = _getNamedParam<InteractiveInkFeatureFactory>(L, top_, 'splashFactory');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');
    enableFeedback ??= true;

    bool? excludeFromSemantics = _getNamedParam<bool>(L, top_, 'excludeFromSemantics');
    excludeFromSemantics ??= false;

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? canRequestFocus = _getNamedParam<bool>(L, top_, 'canRequestFocus');
    canRequestFocus ??= true;

    ValueChanged<bool>? onFocusChange = _getVoidCallbackT<bool>(L, top_, 'onFocusChange');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    MaterialStatesController? statesController = _getNamedParam<MaterialStatesController>(L, top_, 'statesController');

    var result_ = InkResponse(key: key, child: child, onTap: onTap, onTapDown: onTapDown, onTapUp: onTapUp, onTapCancel: onTapCancel, onDoubleTap: onDoubleTap, onLongPress: onLongPress, onSecondaryTap: onSecondaryTap, onSecondaryTapUp: onSecondaryTapUp, onSecondaryTapDown: onSecondaryTapDown, onSecondaryTapCancel: onSecondaryTapCancel, onHighlightChanged: onHighlightChanged, onHover: onHover, mouseCursor: mouseCursor, containedInkWell: containedInkWell, highlightShape: highlightShape, radius: radius, borderRadius: borderRadius, customBorder: customBorder, focusColor: focusColor, hoverColor: hoverColor, highlightColor: highlightColor, overlayColor: overlayColor, splashColor: splashColor, splashFactory: splashFactory, enableFeedback: enableFeedback, excludeFromSemantics: excludeFromSemantics, focusNode: focusNode, canRequestFocus: canRequestFocus, onFocusChange: onFocusChange, autofocus: autofocus, statesController: statesController);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Scrollbar_Scrollbar(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    ScrollController? controller = _getNamedParam<ScrollController>(L, top_, 'controller');

    bool? thumbVisibility = _getNamedParam<bool>(L, top_, 'thumbVisibility');

    bool? trackVisibility = _getNamedParam<bool>(L, top_, 'trackVisibility');

    double? thickness = _getNamedParam<double>(L, top_, 'thickness');

    Radius? radius = _getNamedParam<Radius>(L, top_, 'radius');

    ScrollNotificationPredicate? notificationPredicate = _getNamedParam<ScrollNotificationPredicate>(L, top_, 'notificationPredicate');

    bool? interactive = _getNamedParam<bool>(L, top_, 'interactive');

    ScrollbarOrientation? scrollbarOrientation = _getNamedParam<ScrollbarOrientation>(L, top_, 'scrollbarOrientation');

    var result_ = Scrollbar(key: key, child: child, controller: controller, thumbVisibility: thumbVisibility, trackVisibility: trackVisibility, thickness: thickness, radius: radius, notificationPredicate: notificationPredicate, interactive: interactive, scrollbarOrientation: scrollbarOrientation);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ScrollController_ScrollController(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? initialScrollOffset = _getNamedParam<double>(L, top_, 'initialScrollOffset');
    initialScrollOffset ??= 0.0;

    bool? keepScrollOffset = _getNamedParam<bool>(L, top_, 'keepScrollOffset');
    keepScrollOffset ??= true;

    String? debugLabel = _getNamedParam<String>(L, top_, 'debugLabel');

    var result_ = ScrollController(initialScrollOffset: initialScrollOffset, keepScrollOffset: keepScrollOffset, debugLabel: debugLabel);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ListView_ListView(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Axis? scrollDirection = _getNamedParam<Axis>(L, top_, 'scrollDirection');
    scrollDirection ??= Axis.vertical;

    bool? reverse = _getNamedParam<bool>(L, top_, 'reverse');
    reverse ??= false;

    ScrollController? controller = _getNamedParam<ScrollController>(L, top_, 'controller');

    bool? primary = _getNamedParam<bool>(L, top_, 'primary');

    ScrollPhysics? physics = _getNamedParam<ScrollPhysics>(L, top_, 'physics');

    bool? shrinkWrap = _getNamedParam<bool>(L, top_, 'shrinkWrap');
    shrinkWrap ??= false;

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    double? itemExtent = _getNamedParam<double>(L, top_, 'itemExtent');

    Widget? prototypeItem = _getNamedParam<Widget>(L, top_, 'prototypeItem');

    bool? addAutomaticKeepAlives = _getNamedParam<bool>(L, top_, 'addAutomaticKeepAlives');
    addAutomaticKeepAlives ??= true;

    bool? addRepaintBoundaries = _getNamedParam<bool>(L, top_, 'addRepaintBoundaries');
    addRepaintBoundaries ??= true;

    bool? addSemanticIndexes = _getNamedParam<bool>(L, top_, 'addSemanticIndexes');
    addSemanticIndexes ??= true;

    double? cacheExtent = _getNamedParam<double>(L, top_, 'cacheExtent');

    List<Widget>? children = _getNamedListParam<Widget>(L, top_, 'children');
    children ??= const <Widget>[];

    int? semanticChildCount = _getNamedParam<int>(L, top_, 'semanticChildCount');

    DragStartBehavior? dragStartBehavior = _getNamedParam<DragStartBehavior>(L, top_, 'dragStartBehavior');
    dragStartBehavior ??= DragStartBehavior.start;

    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior = _getNamedParam<ScrollViewKeyboardDismissBehavior>(L, top_, 'keyboardDismissBehavior');
    keyboardDismissBehavior ??= ScrollViewKeyboardDismissBehavior.manual;

    String? restorationId = _getNamedParam<String>(L, top_, 'restorationId');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.hardEdge;

    var result_ = ListView(key: key, scrollDirection: scrollDirection, reverse: reverse, controller: controller, primary: primary, physics: physics, shrinkWrap: shrinkWrap, padding: padding, itemExtent: itemExtent, prototypeItem: prototypeItem, addAutomaticKeepAlives: addAutomaticKeepAlives, addRepaintBoundaries: addRepaintBoundaries, addSemanticIndexes: addSemanticIndexes, cacheExtent: cacheExtent, children: children, semanticChildCount: semanticChildCount, dragStartBehavior: dragStartBehavior, keyboardDismissBehavior: keyboardDismissBehavior, restorationId: restorationId, clipBehavior: clipBehavior);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ListView_builder(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Axis? scrollDirection = _getNamedParam<Axis>(L, top_, 'scrollDirection');
    scrollDirection ??= Axis.vertical;

    bool? reverse = _getNamedParam<bool>(L, top_, 'reverse');
    reverse ??= false;

    ScrollController? controller = _getNamedParam<ScrollController>(L, top_, 'controller');

    bool? primary = _getNamedParam<bool>(L, top_, 'primary');

    ScrollPhysics? physics = _getNamedParam<ScrollPhysics>(L, top_, 'physics');

    bool? shrinkWrap = _getNamedParam<bool>(L, top_, 'shrinkWrap');
    shrinkWrap ??= false;

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    double? itemExtent = _getNamedParam<double>(L, top_, 'itemExtent');

    Widget? prototypeItem = _getNamedParam<Widget>(L, top_, 'prototypeItem');

    NullableIndexedWidgetBuilder? itemBuilder = _getNullableIndexedWidgetBuilder(L, top_, 'itemBuilder')!;

    ChildIndexGetter? findChildIndexCallback = _getNamedParam<ChildIndexGetter>(L, top_, 'findChildIndexCallback');

    int? itemCount = _getNamedParam<int>(L, top_, 'itemCount');

    bool? addAutomaticKeepAlives = _getNamedParam<bool>(L, top_, 'addAutomaticKeepAlives');
    addAutomaticKeepAlives ??= true;

    bool? addRepaintBoundaries = _getNamedParam<bool>(L, top_, 'addRepaintBoundaries');
    addRepaintBoundaries ??= true;

    bool? addSemanticIndexes = _getNamedParam<bool>(L, top_, 'addSemanticIndexes');
    addSemanticIndexes ??= true;

    double? cacheExtent = _getNamedParam<double>(L, top_, 'cacheExtent');

    int? semanticChildCount = _getNamedParam<int>(L, top_, 'semanticChildCount');

    DragStartBehavior? dragStartBehavior = _getNamedParam<DragStartBehavior>(L, top_, 'dragStartBehavior');
    dragStartBehavior ??= DragStartBehavior.start;

    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior = _getNamedParam<ScrollViewKeyboardDismissBehavior>(L, top_, 'keyboardDismissBehavior');
    keyboardDismissBehavior ??= ScrollViewKeyboardDismissBehavior.manual;

    String? restorationId = _getNamedParam<String>(L, top_, 'restorationId');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.hardEdge;

    var result_ = ListView.builder(key: key, scrollDirection: scrollDirection, reverse: reverse, controller: controller, primary: primary, physics: physics, shrinkWrap: shrinkWrap, padding: padding, itemExtent: itemExtent, prototypeItem: prototypeItem, itemBuilder: itemBuilder, findChildIndexCallback: findChildIndexCallback, itemCount: itemCount, addAutomaticKeepAlives: addAutomaticKeepAlives, addRepaintBoundaries: addRepaintBoundaries, addSemanticIndexes: addSemanticIndexes, cacheExtent: cacheExtent, semanticChildCount: semanticChildCount, dragStartBehavior: dragStartBehavior, keyboardDismissBehavior: keyboardDismissBehavior, restorationId: restorationId, clipBehavior: clipBehavior);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SingleChildScrollView_SingleChildScrollView(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Axis? scrollDirection = _getNamedParam<Axis>(L, top_, 'scrollDirection');
    scrollDirection ??= Axis.vertical;

    bool? reverse = _getNamedParam<bool>(L, top_, 'reverse');
    reverse ??= false;

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    bool? primary = _getNamedParam<bool>(L, top_, 'primary');

    ScrollPhysics? physics = _getNamedParam<ScrollPhysics>(L, top_, 'physics');

    ScrollController? controller = _getNamedParam<ScrollController>(L, top_, 'controller');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    DragStartBehavior? dragStartBehavior = _getNamedParam<DragStartBehavior>(L, top_, 'dragStartBehavior');
    dragStartBehavior ??= DragStartBehavior.start;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.hardEdge;

    String? restorationId = _getNamedParam<String>(L, top_, 'restorationId');

    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior = _getNamedParam<ScrollViewKeyboardDismissBehavior>(L, top_, 'keyboardDismissBehavior');
    keyboardDismissBehavior ??= ScrollViewKeyboardDismissBehavior.manual;

    var result_ = SingleChildScrollView(key: key, scrollDirection: scrollDirection, reverse: reverse, padding: padding, primary: primary, physics: physics, controller: controller, child: child, dragStartBehavior: dragStartBehavior, clipBehavior: clipBehavior, restorationId: restorationId, keyboardDismissBehavior: keyboardDismissBehavior);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BlockPointer_BlockPointer(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = BlockPointer(key: key, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ListTile_ListTile(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? leading = _getNamedParam<Widget>(L, top_, 'leading');

    Widget? title = _getNamedParam<Widget>(L, top_, 'title');

    Widget? subtitle = _getNamedParam<Widget>(L, top_, 'subtitle');

    Widget? trailing = _getNamedParam<Widget>(L, top_, 'trailing');

    bool? isThreeLine = _getNamedParam<bool>(L, top_, 'isThreeLine');
    isThreeLine ??= false;

    bool? dense = _getNamedParam<bool>(L, top_, 'dense');

    VisualDensity? visualDensity = _getNamedParam<VisualDensity>(L, top_, 'visualDensity');

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    ListTileStyle? style = _getNamedParam<ListTileStyle>(L, top_, 'style');

    Color? selectedColor = _getNamedParam<Color>(L, top_, 'selectedColor');

    Color? iconColor = _getNamedParam<Color>(L, top_, 'iconColor');

    Color? textColor = _getNamedParam<Color>(L, top_, 'textColor');

    EdgeInsetsGeometry? contentPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'contentPadding');

    bool? enabled = _getNamedParam<bool>(L, top_, 'enabled');
    enabled ??= true;

    GestureTapCallback? onTap = _getVoidCallback(L, top_, 'onTap');

    GestureLongPressCallback? onLongPress = _getVoidCallback(L, top_, 'onLongPress');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    bool? selected = _getNamedParam<bool>(L, top_, 'selected');
    selected ??= false;

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    Color? splashColor = _getNamedParam<Color>(L, top_, 'splashColor');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    Color? tileColor = _getNamedParam<Color>(L, top_, 'tileColor');

    Color? selectedTileColor = _getNamedParam<Color>(L, top_, 'selectedTileColor');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    double? horizontalTitleGap = _getNamedParam<double>(L, top_, 'horizontalTitleGap');

    double? minVerticalPadding = _getNamedParam<double>(L, top_, 'minVerticalPadding');

    double? minLeadingWidth = _getNamedParam<double>(L, top_, 'minLeadingWidth');

    var result_ = ListTile(key: key, leading: leading, title: title, subtitle: subtitle, trailing: trailing, isThreeLine: isThreeLine, dense: dense, visualDensity: visualDensity, shape: shape, style: style, selectedColor: selectedColor, iconColor: iconColor, textColor: textColor, contentPadding: contentPadding, enabled: enabled, onTap: onTap, onLongPress: onLongPress, mouseCursor: mouseCursor, selected: selected, focusColor: focusColor, hoverColor: hoverColor, splashColor: splashColor, focusNode: focusNode, autofocus: autofocus, tileColor: tileColor, selectedTileColor: selectedTileColor, enableFeedback: enableFeedback, horizontalTitleGap: horizontalTitleGap, minVerticalPadding: minVerticalPadding, minLeadingWidth: minLeadingWidth);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Container_Container(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Decoration? decoration = _getNamedParam<Decoration>(L, top_, 'decoration');

    Decoration? foregroundDecoration = _getNamedParam<Decoration>(L, top_, 'foregroundDecoration');

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? height = _getNamedParam<double>(L, top_, 'height');

    BoxConstraints? constraints = _getNamedParam<BoxConstraints>(L, top_, 'constraints');

    EdgeInsetsGeometry? margin = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'margin');

    Matrix4? transform = _getNamedParam<Matrix4>(L, top_, 'transform');

    AlignmentGeometry? transformAlignment = _getNamedParam<AlignmentGeometry>(L, top_, 'transformAlignment');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    var result_ = Container(key: key, alignment: alignment, padding: padding, color: color, decoration: decoration, foregroundDecoration: foregroundDecoration, width: width, height: height, constraints: constraints, margin: margin, transform: transform, transformAlignment: transformAlignment, child: child, clipBehavior: clipBehavior);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BoxDecoration_BoxDecoration(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    DecorationImage? image = _getNamedParam<DecorationImage>(L, top_, 'image');

    BoxBorder? border = _getNamedParam<BoxBorder>(L, top_, 'border');

    BorderRadiusGeometry? borderRadius = _getNamedParam<BorderRadiusGeometry>(L, top_, 'borderRadius');

    List<BoxShadow>? boxShadow = _getNamedListParam<BoxShadow>(L, top_, 'boxShadow');

    Gradient? gradient = _getNamedParam<Gradient>(L, top_, 'gradient');

    BlendMode? backgroundBlendMode = _getNamedParam<BlendMode>(L, top_, 'backgroundBlendMode');

    BoxShape? shape = _getNamedParam<BoxShape>(L, top_, 'shape');
    shape ??= BoxShape.rectangle;

    var result_ = BoxDecoration(color: color, image: image, border: border, borderRadius: borderRadius, boxShadow: boxShadow, gradient: gradient, backgroundBlendMode: backgroundBlendMode, shape: shape);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ShapeDecoration_ShapeDecoration(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    DecorationImage? image = _getNamedParam<DecorationImage>(L, top_, 'image');

    Gradient? gradient = _getNamedParam<Gradient>(L, top_, 'gradient');

    List<BoxShadow>? shadows = _getNamedListParam<BoxShadow>(L, top_, 'shadows');

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape')!;

    var result_ = ShapeDecoration(color: color, image: image, gradient: gradient, shadows: shadows, shape: shape);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ShapeDecoration_fromBoxDecoration(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BoxDecoration? source = _getParam<BoxDecoration>(L, 1)!;

    var result_ = ShapeDecoration.fromBoxDecoration(source);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _DecoratedBox_DecoratedBox(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Decoration? decoration = _getNamedParam<Decoration>(L, top_, 'decoration')!;

    DecorationPosition? position = _getNamedParam<DecorationPosition>(L, top_, 'position');
    position ??= DecorationPosition.background;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = DecoratedBox(key: key, decoration: decoration, position: position, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BorderSide_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #none: return luaPush(L, BorderSide.none);
    case #strokeAlignInside: return luaPush(L, BorderSide.strokeAlignInside);
    case #strokeAlignCenter: return luaPush(L, BorderSide.strokeAlignCenter);
    case #strokeAlignOutside: return luaPush(L, BorderSide.strokeAlignOutside);
  }

  lua_pushnil(L);
  return 1;
}

int _BorderSide_BorderSide(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Color? color = _getNamedParam<Color>(L, top_, 'color');
    color ??= const Color(0xFF000000);

    double? width = _getNamedParam<double>(L, top_, 'width');
    width ??= 1.0;

    BorderStyle? style = _getNamedParam<BorderStyle>(L, top_, 'style');
    style ??= BorderStyle.solid;

    double? strokeAlign = _getNamedParam<double>(L, top_, 'strokeAlign');
    strokeAlign ??= BorderSide.strokeAlignInside;

    var result_ = BorderSide(color: color, width: width, style: style, strokeAlign: strokeAlign);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Border_Border(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BorderSide? top = _getNamedParam<BorderSide>(L, top_, 'top');
    top ??= BorderSide.none;

    BorderSide? right = _getNamedParam<BorderSide>(L, top_, 'right');
    right ??= BorderSide.none;

    BorderSide? bottom = _getNamedParam<BorderSide>(L, top_, 'bottom');
    bottom ??= BorderSide.none;

    BorderSide? left = _getNamedParam<BorderSide>(L, top_, 'left');
    left ??= BorderSide.none;

    var result_ = Border(top: top, right: right, bottom: bottom, left: left);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Border_all(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Color? color = _getNamedParam<Color>(L, top_, 'color');
    color ??= const Color(0xFF000000);

    double? width = _getNamedParam<double>(L, top_, 'width');
    width ??= 1.0;

    BorderStyle? style = _getNamedParam<BorderStyle>(L, top_, 'style');
    style ??= BorderStyle.solid;

    double? strokeAlign = _getNamedParam<double>(L, top_, 'strokeAlign');
    strokeAlign ??= BorderSide.strokeAlignInside;

    var result_ = Border.all(color: color, width: width, style: style, strokeAlign: strokeAlign);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Border_fromBorderSide(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BorderSide? side = _getParam<BorderSide>(L, 1)!;

    var result_ = Border.fromBorderSide(side);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Border_symmetric(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BorderSide? vertical = _getNamedParam<BorderSide>(L, top_, 'vertical');
    vertical ??= BorderSide.none;

    BorderSide? horizontal = _getNamedParam<BorderSide>(L, top_, 'horizontal');
    horizontal ??= BorderSide.none;

    var result_ = Border.symmetric(vertical: vertical, horizontal: horizontal);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Radius_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #zero: return luaPush(L, Radius.zero);
  }

  var object = luaToObjectT<Radius>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #x: return luaPush(L, object.x);
    case #y: return luaPush(L, object.y);
  }

  lua_pushnil(L);
  return 1;
}

int _Radius_circular(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? radius = _getParam<double>(L, 1)!;

    var result_ = Radius.circular(radius);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Radius_elliptical(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? x = _getParam<double>(L, 1)!;

    double? y = _getParam<double>(L, 2)!;

    var result_ = Radius.elliptical(x, y);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BorderRadius_all(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Radius? radius = _getParam<Radius>(L, 1)!;

    var result_ = BorderRadius.all(radius);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BorderRadius_circular(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? radius = _getParam<double>(L, 1)!;

    var result_ = BorderRadius.circular(radius);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BorderRadius_vertical(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Radius? top = _getNamedParam<Radius>(L, top_, 'top');
    top ??= Radius.zero;

    Radius? bottom = _getNamedParam<Radius>(L, top_, 'bottom');
    bottom ??= Radius.zero;

    var result_ = BorderRadius.vertical(top: top, bottom: bottom);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BorderRadius_horizontal(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Radius? left = _getNamedParam<Radius>(L, top_, 'left');
    left ??= Radius.zero;

    Radius? right = _getNamedParam<Radius>(L, top_, 'right');
    right ??= Radius.zero;

    var result_ = BorderRadius.horizontal(left: left, right: right);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BorderRadius_only(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Radius? topLeft = _getNamedParam<Radius>(L, top_, 'topLeft');
    topLeft ??= Radius.zero;

    Radius? topRight = _getNamedParam<Radius>(L, top_, 'topRight');
    topRight ??= Radius.zero;

    Radius? bottomLeft = _getNamedParam<Radius>(L, top_, 'bottomLeft');
    bottomLeft ??= Radius.zero;

    Radius? bottomRight = _getNamedParam<Radius>(L, top_, 'bottomRight');
    bottomRight ??= Radius.zero;

    var result_ = BorderRadius.only(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Ink_Ink(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Decoration? decoration = _getNamedParam<Decoration>(L, top_, 'decoration');

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? height = _getNamedParam<double>(L, top_, 'height');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = Ink(key: key, padding: padding, color: color, decoration: decoration, width: width, height: height, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _InputDecoration_InputDecoration(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Widget? icon = _getNamedParam<Widget>(L, top_, 'icon');

    Color? iconColor = _getNamedParam<Color>(L, top_, 'iconColor');

    Widget? label = _getNamedParam<Widget>(L, top_, 'label');

    String? labelText = _getNamedParam<String>(L, top_, 'labelText');

    TextStyle? labelStyle = _getNamedParam<TextStyle>(L, top_, 'labelStyle');

    TextStyle? floatingLabelStyle = _getNamedParam<TextStyle>(L, top_, 'floatingLabelStyle');

    String? helperText = _getNamedParam<String>(L, top_, 'helperText');

    TextStyle? helperStyle = _getNamedParam<TextStyle>(L, top_, 'helperStyle');

    int? helperMaxLines = _getNamedParam<int>(L, top_, 'helperMaxLines');

    String? hintText = _getNamedParam<String>(L, top_, 'hintText');

    TextStyle? hintStyle = _getNamedParam<TextStyle>(L, top_, 'hintStyle');

    TextDirection? hintTextDirection = _getNamedParam<TextDirection>(L, top_, 'hintTextDirection');

    int? hintMaxLines = _getNamedParam<int>(L, top_, 'hintMaxLines');

    String? errorText = _getNamedParam<String>(L, top_, 'errorText');

    TextStyle? errorStyle = _getNamedParam<TextStyle>(L, top_, 'errorStyle');

    int? errorMaxLines = _getNamedParam<int>(L, top_, 'errorMaxLines');

    FloatingLabelBehavior? floatingLabelBehavior = _getNamedParam<FloatingLabelBehavior>(L, top_, 'floatingLabelBehavior');

    FloatingLabelAlignment? floatingLabelAlignment = _getNamedParam<FloatingLabelAlignment>(L, top_, 'floatingLabelAlignment');

    bool? isCollapsed = _getNamedParam<bool>(L, top_, 'isCollapsed');
    isCollapsed ??= false;

    bool? isDense = _getNamedParam<bool>(L, top_, 'isDense');

    EdgeInsetsGeometry? contentPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'contentPadding');

    Widget? prefixIcon = _getNamedParam<Widget>(L, top_, 'prefixIcon');

    BoxConstraints? prefixIconConstraints = _getNamedParam<BoxConstraints>(L, top_, 'prefixIconConstraints');

    Widget? prefix = _getNamedParam<Widget>(L, top_, 'prefix');

    String? prefixText = _getNamedParam<String>(L, top_, 'prefixText');

    TextStyle? prefixStyle = _getNamedParam<TextStyle>(L, top_, 'prefixStyle');

    Color? prefixIconColor = _getNamedParam<Color>(L, top_, 'prefixIconColor');

    Widget? suffixIcon = _getNamedParam<Widget>(L, top_, 'suffixIcon');

    Widget? suffix = _getNamedParam<Widget>(L, top_, 'suffix');

    String? suffixText = _getNamedParam<String>(L, top_, 'suffixText');

    TextStyle? suffixStyle = _getNamedParam<TextStyle>(L, top_, 'suffixStyle');

    Color? suffixIconColor = _getNamedParam<Color>(L, top_, 'suffixIconColor');

    BoxConstraints? suffixIconConstraints = _getNamedParam<BoxConstraints>(L, top_, 'suffixIconConstraints');

    Widget? counter = _getNamedParam<Widget>(L, top_, 'counter');

    String? counterText = _getNamedParam<String>(L, top_, 'counterText');

    TextStyle? counterStyle = _getNamedParam<TextStyle>(L, top_, 'counterStyle');

    bool? filled = _getNamedParam<bool>(L, top_, 'filled');

    Color? fillColor = _getNamedParam<Color>(L, top_, 'fillColor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    InputBorder? errorBorder = _getNamedParam<InputBorder>(L, top_, 'errorBorder');

    InputBorder? focusedBorder = _getNamedParam<InputBorder>(L, top_, 'focusedBorder');

    InputBorder? focusedErrorBorder = _getNamedParam<InputBorder>(L, top_, 'focusedErrorBorder');

    InputBorder? disabledBorder = _getNamedParam<InputBorder>(L, top_, 'disabledBorder');

    InputBorder? enabledBorder = _getNamedParam<InputBorder>(L, top_, 'enabledBorder');

    InputBorder? border = _getNamedParam<InputBorder>(L, top_, 'border');

    bool? enabled = _getNamedParam<bool>(L, top_, 'enabled');
    enabled ??= true;

    String? semanticCounterText = _getNamedParam<String>(L, top_, 'semanticCounterText');

    bool? alignLabelWithHint = _getNamedParam<bool>(L, top_, 'alignLabelWithHint');

    BoxConstraints? constraints = _getNamedParam<BoxConstraints>(L, top_, 'constraints');

    var result_ = InputDecoration(icon: icon, iconColor: iconColor, label: label, labelText: labelText, labelStyle: labelStyle, floatingLabelStyle: floatingLabelStyle, helperText: helperText, helperStyle: helperStyle, helperMaxLines: helperMaxLines, hintText: hintText, hintStyle: hintStyle, hintTextDirection: hintTextDirection, hintMaxLines: hintMaxLines, errorText: errorText, errorStyle: errorStyle, errorMaxLines: errorMaxLines, floatingLabelBehavior: floatingLabelBehavior, floatingLabelAlignment: floatingLabelAlignment, isCollapsed: isCollapsed, isDense: isDense, contentPadding: contentPadding, prefixIcon: prefixIcon, prefixIconConstraints: prefixIconConstraints, prefix: prefix, prefixText: prefixText, prefixStyle: prefixStyle, prefixIconColor: prefixIconColor, suffixIcon: suffixIcon, suffix: suffix, suffixText: suffixText, suffixStyle: suffixStyle, suffixIconColor: suffixIconColor, suffixIconConstraints: suffixIconConstraints, counter: counter, counterText: counterText, counterStyle: counterStyle, filled: filled, fillColor: fillColor, focusColor: focusColor, hoverColor: hoverColor, errorBorder: errorBorder, focusedBorder: focusedBorder, focusedErrorBorder: focusedErrorBorder, disabledBorder: disabledBorder, enabledBorder: enabledBorder, border: border, enabled: enabled, semanticCounterText: semanticCounterText, alignLabelWithHint: alignLabelWithHint, constraints: constraints);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _InputDecoration_collapsed(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? hintText = _getNamedParam<String>(L, top_, 'hintText');

    FloatingLabelBehavior? floatingLabelBehavior = _getNamedParam<FloatingLabelBehavior>(L, top_, 'floatingLabelBehavior');

    FloatingLabelAlignment? floatingLabelAlignment = _getNamedParam<FloatingLabelAlignment>(L, top_, 'floatingLabelAlignment');

    TextStyle? hintStyle = _getNamedParam<TextStyle>(L, top_, 'hintStyle');

    TextDirection? hintTextDirection = _getNamedParam<TextDirection>(L, top_, 'hintTextDirection');

    bool? filled = _getNamedParam<bool>(L, top_, 'filled');
    filled ??= false;

    Color? fillColor = _getNamedParam<Color>(L, top_, 'fillColor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    InputBorder? border = _getNamedParam<InputBorder>(L, top_, 'border');
    border ??= InputBorder.none;

    bool? enabled = _getNamedParam<bool>(L, top_, 'enabled');
    enabled ??= true;

    var result_ = InputDecoration.collapsed(hintText: hintText, floatingLabelBehavior: floatingLabelBehavior, floatingLabelAlignment: floatingLabelAlignment, hintStyle: hintStyle, hintTextDirection: hintTextDirection, filled: filled, fillColor: fillColor, focusColor: focusColor, hoverColor: hoverColor, border: border, enabled: enabled);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _OutlineInputBorder_OutlineInputBorder(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BorderSide? borderSide = _getNamedParam<BorderSide>(L, top_, 'borderSide');
    borderSide ??= const BorderSide();

    BorderRadius? borderRadius = _getNamedParam<BorderRadius>(L, top_, 'borderRadius');
    borderRadius ??= const BorderRadius.all(Radius.circular(4.0));

    double? gapPadding = _getNamedParam<double>(L, top_, 'gapPadding');
    gapPadding ??= 4.0;

    var result_ = OutlineInputBorder(borderSide: borderSide, borderRadius: borderRadius, gapPadding: gapPadding);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Padding_Padding(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding')!;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = Padding(key: key, padding: padding, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _EdgeInsets_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #zero: return luaPush(L, EdgeInsets.zero);
  }

  lua_pushnil(L);
  return 1;
}

int _EdgeInsets_all(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? value = _getParam<double>(L, 1)!;

    var result_ = EdgeInsets.all(value);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _EdgeInsets_fromLTRB(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? left = _getParam<double>(L, 1)!;

    double? top = _getParam<double>(L, 2)!;

    double? right = _getParam<double>(L, 3)!;

    double? bottom = _getParam<double>(L, 4)!;

    var result_ = EdgeInsets.fromLTRB(left, top, right, bottom);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _EdgeInsets_fromWindowPadding(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    WindowPadding? padding = _getParam<WindowPadding>(L, 1)!;

    double? devicePixelRatio = _getParam<double>(L, 2)!;

    var result_ = EdgeInsets.fromWindowPadding(padding, devicePixelRatio);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _EdgeInsets_only(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? left = _getNamedParam<double>(L, top_, 'left');
    left ??= 0.0;

    double? top = _getNamedParam<double>(L, top_, 'top');
    top ??= 0.0;

    double? right = _getNamedParam<double>(L, top_, 'right');
    right ??= 0.0;

    double? bottom = _getNamedParam<double>(L, top_, 'bottom');
    bottom ??= 0.0;

    var result_ = EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _EdgeInsets_symmetric(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? vertical = _getNamedParam<double>(L, top_, 'vertical');
    vertical ??= 0.0;

    double? horizontal = _getNamedParam<double>(L, top_, 'horizontal');
    horizontal ??= 0.0;

    var result_ = EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Size_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<Size>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #aspectRatio: return luaPush(L, object.aspectRatio);
    case #flipped: return luaPush(L, object.flipped);
    case #height: return luaPush(L, object.height);
    case #isEmpty: return luaPush(L, object.isEmpty);
    case #isFinite: return luaPush(L, object.isFinite);
    case #isInfinite: return luaPush(L, object.isInfinite);
    case #longestSide: return luaPush(L, object.longestSide);
    case #shortestSide: return luaPush(L, object.shortestSide);
    case #width: return luaPush(L, object.width);
  }

  lua_pushnil(L);
  return 1;
}

int _Size_Size(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? width = _getParam<double>(L, 2)!;

    double? height = _getParam<double>(L, 3)!;

    var result_ = Size(width, height);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Size_copy(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Size? source = _getParam<Size>(L, 1)!;

    var result_ = Size.copy(source);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Size_fromHeight(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? height = _getParam<double>(L, 1)!;

    var result_ = Size.fromHeight(height);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Size_fromRadius(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? radius = _getParam<double>(L, 1)!;

    var result_ = Size.fromRadius(radius);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Size_fromWidth(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? width = _getParam<double>(L, 1)!;

    var result_ = Size.fromWidth(width);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Size_square(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? dimension = _getParam<double>(L, 1)!;

    var result_ = Size.square(dimension);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BoxConstraints_BoxConstraints(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? minWidth = _getNamedParam<double>(L, top_, 'minWidth');
    minWidth ??= 0.0;

    double? maxWidth = _getNamedParam<double>(L, top_, 'maxWidth');
    maxWidth ??= double.infinity;

    double? minHeight = _getNamedParam<double>(L, top_, 'minHeight');
    minHeight ??= 0.0;

    double? maxHeight = _getNamedParam<double>(L, top_, 'maxHeight');
    maxHeight ??= double.infinity;

    var result_ = BoxConstraints(minWidth: minWidth, maxWidth: maxWidth, minHeight: minHeight, maxHeight: maxHeight);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BoxConstraints_expand(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? height = _getNamedParam<double>(L, top_, 'height');

    var result_ = BoxConstraints.expand(width: width, height: height);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BoxConstraints_loose(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Size? size = _getParam<Size>(L, 1)!;

    var result_ = BoxConstraints.loose(size);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BoxConstraints_tight(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Size? size = _getParam<Size>(L, 1)!;

    var result_ = BoxConstraints.tight(size);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BoxConstraints_tightFor(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? height = _getNamedParam<double>(L, top_, 'height');

    var result_ = BoxConstraints.tightFor(width: width, height: height);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BoxConstraints_tightForFinite(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? width = _getNamedParam<double>(L, top_, 'width');
    width ??= double.infinity;

    double? height = _getNamedParam<double>(L, top_, 'height');
    height ??= double.infinity;

    var result_ = BoxConstraints.tightForFinite(width: width, height: height);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ConstrainedBox_ConstrainedBox(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    BoxConstraints? constraints = _getNamedParam<BoxConstraints>(L, top_, 'constraints')!;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = ConstrainedBox(key: key, constraints: constraints, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _LimitedBox_LimitedBox(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? maxWidth = _getNamedParam<double>(L, top_, 'maxWidth');
    maxWidth ??= double.infinity;

    double? maxHeight = _getNamedParam<double>(L, top_, 'maxHeight');
    maxHeight ??= double.infinity;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = LimitedBox(key: key, maxWidth: maxWidth, maxHeight: maxHeight, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Checkbox_Checkbox(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    bool? value = _getNamedParam<bool>(L, top_, 'value');

    bool? tristate = _getNamedParam<bool>(L, top_, 'tristate');
    tristate ??= false;

    BoolValueChanged? onChanged = _getVoidCallbackT2<bool>(L, top_, 'onChanged');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    Color? activeColor = _getNamedParam<Color>(L, top_, 'activeColor');

    MaterialStateProperty<Color?>? fillColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'fillColor');

    Color? checkColor = _getNamedParam<Color>(L, top_, 'checkColor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    MaterialStateProperty<Color?>? overlayColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'overlayColor');

    double? splashRadius = _getNamedParam<double>(L, top_, 'splashRadius');

    MaterialTapTargetSize? materialTapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'materialTapTargetSize');

    VisualDensity? visualDensity = _getNamedParam<VisualDensity>(L, top_, 'visualDensity');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    OutlinedBorder? shape = _getNamedParam<OutlinedBorder>(L, top_, 'shape');

    BorderSide? side = _getNamedParam<BorderSide>(L, top_, 'side');

    bool? isError = _getNamedParam<bool>(L, top_, 'isError');
    isError ??= false;

    var result_ = Checkbox(key: key, value: value, tristate: tristate, onChanged: onChanged, mouseCursor: mouseCursor, activeColor: activeColor, fillColor: fillColor, checkColor: checkColor, focusColor: focusColor, hoverColor: hoverColor, overlayColor: overlayColor, splashRadius: splashRadius, materialTapTargetSize: materialTapTargetSize, visualDensity: visualDensity, focusNode: focusNode, autofocus: autofocus, shape: shape, side: side, isError: isError);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _CheckboxListTile_CheckboxListTile(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    bool? value = _getNamedParam<bool>(L, top_, 'value');

    BoolValueChanged? onChanged = _getVoidCallbackT2<bool>(L, top_, 'onChanged');

    Color? activeColor = _getNamedParam<Color>(L, top_, 'activeColor');

    Color? checkColor = _getNamedParam<Color>(L, top_, 'checkColor');

    bool? enabled = _getNamedParam<bool>(L, top_, 'enabled');

    Color? tileColor = _getNamedParam<Color>(L, top_, 'tileColor');

    Widget? title = _getNamedParam<Widget>(L, top_, 'title');

    Widget? subtitle = _getNamedParam<Widget>(L, top_, 'subtitle');

    bool? isThreeLine = _getNamedParam<bool>(L, top_, 'isThreeLine');
    isThreeLine ??= false;

    bool? dense = _getNamedParam<bool>(L, top_, 'dense');

    Widget? secondary = _getNamedParam<Widget>(L, top_, 'secondary');

    bool? selected = _getNamedParam<bool>(L, top_, 'selected');
    selected ??= false;

    ListTileControlAffinity? controlAffinity = _getNamedParam<ListTileControlAffinity>(L, top_, 'controlAffinity');
    controlAffinity ??= ListTileControlAffinity.platform;

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    EdgeInsetsGeometry? contentPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'contentPadding');

    bool? tristate = _getNamedParam<bool>(L, top_, 'tristate');
    tristate ??= false;

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    OutlinedBorder? checkboxShape = _getNamedParam<OutlinedBorder>(L, top_, 'checkboxShape');

    Color? selectedTileColor = _getNamedParam<Color>(L, top_, 'selectedTileColor');

    BorderSide? side = _getNamedParam<BorderSide>(L, top_, 'side');

    VisualDensity? visualDensity = _getNamedParam<VisualDensity>(L, top_, 'visualDensity');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    var result_ = CheckboxListTile(key: key, value: value, onChanged: onChanged, activeColor: activeColor, checkColor: checkColor, enabled: enabled, tileColor: tileColor, title: title, subtitle: subtitle, isThreeLine: isThreeLine, dense: dense, secondary: secondary, selected: selected, controlAffinity: controlAffinity, autofocus: autofocus, contentPadding: contentPadding, tristate: tristate, shape: shape, checkboxShape: checkboxShape, selectedTileColor: selectedTileColor, side: side, visualDensity: visualDensity, focusNode: focusNode, enableFeedback: enableFeedback);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _LTextInputFormatter_LTextInputFormatter(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    TextValidateFunction? validateFunction = _getValidateFunction(L, 2, null)!;

    var result_ = LTextInputFormatter(validateFunction);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ClipRect_ClipRect(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    CustomClipper<Rect>? clipper = _getNamedParam<CustomClipper<Rect>>(L, top_, 'clipper');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.hardEdge;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = ClipRect(key: key, clipper: clipper, clipBehavior: clipBehavior, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ClipRRect_ClipRRect(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    BorderRadiusGeometry? borderRadius = _getNamedParam<BorderRadiusGeometry>(L, top_, 'borderRadius');
    borderRadius ??= BorderRadius.zero;

    CustomClipper<RRect>? clipper = _getNamedParam<CustomClipper<RRect>>(L, top_, 'clipper');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.antiAlias;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = ClipRRect(key: key, borderRadius: borderRadius, clipper: clipper, clipBehavior: clipBehavior, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Tooltip_Tooltip(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    String? message = _getNamedParam<String>(L, top_, 'message');

    InlineSpan? richMessage = _getNamedParam<InlineSpan>(L, top_, 'richMessage');

    double? height = _getNamedParam<double>(L, top_, 'height');

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    EdgeInsetsGeometry? margin = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'margin');

    double? verticalOffset = _getNamedParam<double>(L, top_, 'verticalOffset');

    bool? preferBelow = _getNamedParam<bool>(L, top_, 'preferBelow');

    bool? excludeFromSemantics = _getNamedParam<bool>(L, top_, 'excludeFromSemantics');

    Decoration? decoration = _getNamedParam<Decoration>(L, top_, 'decoration');

    TextStyle? textStyle = _getNamedParam<TextStyle>(L, top_, 'textStyle');

    TextAlign? textAlign = _getNamedParam<TextAlign>(L, top_, 'textAlign');

    Duration? waitDuration = _getNamedParam<Duration>(L, top_, 'waitDuration');

    Duration? showDuration = _getNamedParam<Duration>(L, top_, 'showDuration');

    TooltipTriggerMode? triggerMode = _getNamedParam<TooltipTriggerMode>(L, top_, 'triggerMode');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    TooltipTriggeredCallback? onTriggered = _getNamedParam<TooltipTriggeredCallback>(L, top_, 'onTriggered');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = Tooltip(key: key, message: message, richMessage: richMessage, height: height, padding: padding, margin: margin, verticalOffset: verticalOffset, preferBelow: preferBelow, excludeFromSemantics: excludeFromSemantics, decoration: decoration, textStyle: textStyle, textAlign: textAlign, waitDuration: waitDuration, showDuration: showDuration, triggerMode: triggerMode, enableFeedback: enableFeedback, onTriggered: onTriggered, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Table_Table(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    List<TableRow>? children = _getNamedListParam<TableRow>(L, top_, 'children');
    children ??= const <TableRow>[];

    Map<int, TableColumnWidth>? columnWidths = _getNamedMapParam<int, TableColumnWidth>(L, top_, 'columnWidths');

    TableColumnWidth? defaultColumnWidth = _getNamedParam<TableColumnWidth>(L, top_, 'defaultColumnWidth');
    defaultColumnWidth ??= const FlexColumnWidth();

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection');

    TableBorder? border = _getNamedParam<TableBorder>(L, top_, 'border');

    TableCellVerticalAlignment? defaultVerticalAlignment = _getNamedParam<TableCellVerticalAlignment>(L, top_, 'defaultVerticalAlignment');
    defaultVerticalAlignment ??= TableCellVerticalAlignment.top;

    TextBaseline? textBaseline = _getNamedParam<TextBaseline>(L, top_, 'textBaseline');

    var result_ = Table(key: key, children: children, columnWidths: columnWidths, defaultColumnWidth: defaultColumnWidth, textDirection: textDirection, border: border, defaultVerticalAlignment: defaultVerticalAlignment, textBaseline: textBaseline);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TableRow_TableRow(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    LocalKey? key = _getNamedParam<LocalKey>(L, top_, 'key');

    Decoration? decoration = _getNamedParam<Decoration>(L, top_, 'decoration');

    List<Widget>? children = _getNamedListParam<Widget>(L, top_, 'children');
    children ??= const <Widget>[];

    var result_ = TableRow(key: key, decoration: decoration, children: children);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _FlexColumnWidth_FlexColumnWidth(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? value = _getParam<double>(L, 2);
    value ??= 1.0;

    var result_ = FlexColumnWidth(value);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MediaQueryData_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<MediaQueryData>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #size: return luaPush(L, object.size);
    case #devicePixelRatio: return luaPush(L, object.devicePixelRatio);
  }

  lua_pushnil(L);
  return 1;
}

int _MediaQueryData_MediaQueryData(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Size? size = _getNamedParam<Size>(L, top_, 'size');
    size ??= Size.zero;

    double? devicePixelRatio = _getNamedParam<double>(L, top_, 'devicePixelRatio');
    devicePixelRatio ??= 1.0;

    double? textScaleFactor = _getNamedParam<double>(L, top_, 'textScaleFactor');
    textScaleFactor ??= 1.0;

    Brightness? platformBrightness = _getNamedParam<Brightness>(L, top_, 'platformBrightness');
    platformBrightness ??= Brightness.light;

    EdgeInsets? padding = _getNamedParam<EdgeInsets>(L, top_, 'padding');
    padding ??= EdgeInsets.zero;

    EdgeInsets? viewInsets = _getNamedParam<EdgeInsets>(L, top_, 'viewInsets');
    viewInsets ??= EdgeInsets.zero;

    EdgeInsets? systemGestureInsets = _getNamedParam<EdgeInsets>(L, top_, 'systemGestureInsets');
    systemGestureInsets ??= EdgeInsets.zero;

    EdgeInsets? viewPadding = _getNamedParam<EdgeInsets>(L, top_, 'viewPadding');
    viewPadding ??= EdgeInsets.zero;

    bool? alwaysUse24HourFormat = _getNamedParam<bool>(L, top_, 'alwaysUse24HourFormat');
    alwaysUse24HourFormat ??= false;

    bool? accessibleNavigation = _getNamedParam<bool>(L, top_, 'accessibleNavigation');
    accessibleNavigation ??= false;

    bool? invertColors = _getNamedParam<bool>(L, top_, 'invertColors');
    invertColors ??= false;

    bool? highContrast = _getNamedParam<bool>(L, top_, 'highContrast');
    highContrast ??= false;

    bool? disableAnimations = _getNamedParam<bool>(L, top_, 'disableAnimations');
    disableAnimations ??= false;

    bool? boldText = _getNamedParam<bool>(L, top_, 'boldText');
    boldText ??= false;

    NavigationMode? navigationMode = _getNamedParam<NavigationMode>(L, top_, 'navigationMode');
    navigationMode ??= NavigationMode.traditional;

    DeviceGestureSettings? gestureSettings = _getNamedParam<DeviceGestureSettings>(L, top_, 'gestureSettings');
    gestureSettings ??= const DeviceGestureSettings(touchSlop: kTouchSlop);

    List<DisplayFeature>? displayFeatures = _getNamedListParam<DisplayFeature>(L, top_, 'displayFeatures');
    displayFeatures ??= const <DisplayFeature>[];

    var result_ = MediaQueryData(size: size, devicePixelRatio: devicePixelRatio, textScaleFactor: textScaleFactor, platformBrightness: platformBrightness, padding: padding, viewInsets: viewInsets, systemGestureInsets: systemGestureInsets, viewPadding: viewPadding, alwaysUse24HourFormat: alwaysUse24HourFormat, accessibleNavigation: accessibleNavigation, invertColors: invertColors, highContrast: highContrast, disableAnimations: disableAnimations, boldText: boldText, navigationMode: navigationMode, gestureSettings: gestureSettings, displayFeatures: displayFeatures);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MediaQuery_MediaQuery(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    MediaQueryData? data = _getNamedParam<MediaQueryData>(L, top_, 'data')!;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = MediaQuery(key: key, data: data, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MediaQuery_removePadding(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    BuildContext? context = _getNamedParam<BuildContext>(L, top_, 'context')!;

    bool? removeLeft = _getNamedParam<bool>(L, top_, 'removeLeft');
    removeLeft ??= false;

    bool? removeTop = _getNamedParam<bool>(L, top_, 'removeTop');
    removeTop ??= false;

    bool? removeRight = _getNamedParam<bool>(L, top_, 'removeRight');
    removeRight ??= false;

    bool? removeBottom = _getNamedParam<bool>(L, top_, 'removeBottom');
    removeBottom ??= false;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = MediaQuery.removePadding(key: key, context: context, removeLeft: removeLeft, removeTop: removeTop, removeRight: removeRight, removeBottom: removeBottom, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MediaQuery_removeViewInsets(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    BuildContext? context = _getNamedParam<BuildContext>(L, top_, 'context')!;

    bool? removeLeft = _getNamedParam<bool>(L, top_, 'removeLeft');
    removeLeft ??= false;

    bool? removeTop = _getNamedParam<bool>(L, top_, 'removeTop');
    removeTop ??= false;

    bool? removeRight = _getNamedParam<bool>(L, top_, 'removeRight');
    removeRight ??= false;

    bool? removeBottom = _getNamedParam<bool>(L, top_, 'removeBottom');
    removeBottom ??= false;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = MediaQuery.removeViewInsets(key: key, context: context, removeLeft: removeLeft, removeTop: removeTop, removeRight: removeRight, removeBottom: removeBottom, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MediaQuery_removeViewPadding(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    BuildContext? context = _getNamedParam<BuildContext>(L, top_, 'context')!;

    bool? removeLeft = _getNamedParam<bool>(L, top_, 'removeLeft');
    removeLeft ??= false;

    bool? removeTop = _getNamedParam<bool>(L, top_, 'removeTop');
    removeTop ??= false;

    bool? removeRight = _getNamedParam<bool>(L, top_, 'removeRight');
    removeRight ??= false;

    bool? removeBottom = _getNamedParam<bool>(L, top_, 'removeBottom');
    removeBottom ??= false;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = MediaQuery.removeViewPadding(key: key, context: context, removeLeft: removeLeft, removeTop: removeTop, removeRight: removeRight, removeBottom: removeBottom, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MediaQuery_of(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BuildContext? context = _getParam<BuildContext>(L, 1)!;

    var result_ = MediaQuery.of(context);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Offset_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #zero: return luaPush(L, Offset.zero);
    case #infinite: return luaPush(L, Offset.infinite);
  }

  var object = luaToObjectT<Offset>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #dx: return luaPush(L, object.dx);
    case #dy: return luaPush(L, object.dy);
  }

  lua_pushnil(L);
  return 1;
}

int _Offset_Offset(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? dx = _getParam<double>(L, 2)!;

    double? dy = _getParam<double>(L, 3)!;

    var result_ = Offset(dx, dy);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Alignment_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #topLeft: return luaPush(L, Alignment.topLeft);
    case #topCenter: return luaPush(L, Alignment.topCenter);
    case #topRight: return luaPush(L, Alignment.topRight);
    case #centerLeft: return luaPush(L, Alignment.centerLeft);
    case #center: return luaPush(L, Alignment.center);
    case #centerRight: return luaPush(L, Alignment.centerRight);
    case #bottomLeft: return luaPush(L, Alignment.bottomLeft);
    case #bottomCenter: return luaPush(L, Alignment.bottomCenter);
    case #bottomRight: return luaPush(L, Alignment.bottomRight);
  }

  lua_pushnil(L);
  return 1;
}

int _Alignment_Alignment(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? x = _getParam<double>(L, 2)!;

    double? y = _getParam<double>(L, 3)!;

    var result_ = Alignment(x, y);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _FractionalOffset_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #topLeft: return luaPush(L, FractionalOffset.topLeft);
    case #topCenter: return luaPush(L, FractionalOffset.topCenter);
    case #topRight: return luaPush(L, FractionalOffset.topRight);
    case #centerLeft: return luaPush(L, FractionalOffset.centerLeft);
    case #center: return luaPush(L, FractionalOffset.center);
    case #centerRight: return luaPush(L, FractionalOffset.centerRight);
    case #bottomLeft: return luaPush(L, FractionalOffset.bottomLeft);
    case #bottomCenter: return luaPush(L, FractionalOffset.bottomCenter);
    case #bottomRight: return luaPush(L, FractionalOffset.bottomRight);
  }

  var object = luaToObjectT<FractionalOffset>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #dx: return luaPush(L, object.dx);
    case #dy: return luaPush(L, object.dy);
  }

  lua_pushnil(L);
  return 1;
}

int _FractionalOffset_FractionalOffset(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? dx = _getParam<double>(L, 2)!;

    double? dy = _getParam<double>(L, 3)!;

    var result_ = FractionalOffset(dx, dy);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Align_Align(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');
    alignment ??= Alignment.center;

    double? widthFactor = _getNamedParam<double>(L, top_, 'widthFactor');

    double? heightFactor = _getNamedParam<double>(L, top_, 'heightFactor');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = Align(key: key, alignment: alignment, widthFactor: widthFactor, heightFactor: heightFactor, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _DefaultTextStyle_DefaultTextStyle(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    TextStyle? style = _getNamedParam<TextStyle>(L, top_, 'style')!;

    TextAlign? textAlign = _getNamedParam<TextAlign>(L, top_, 'textAlign');

    bool? softWrap = _getNamedParam<bool>(L, top_, 'softWrap');
    softWrap ??= true;

    TextOverflow? overflow = _getNamedParam<TextOverflow>(L, top_, 'overflow');
    overflow ??= TextOverflow.clip;

    int? maxLines = _getNamedParam<int>(L, top_, 'maxLines');

    TextWidthBasis? textWidthBasis = _getNamedParam<TextWidthBasis>(L, top_, 'textWidthBasis');
    textWidthBasis ??= TextWidthBasis.parent;

    TextHeightBehavior? textHeightBehavior = _getNamedParam<TextHeightBehavior>(L, top_, 'textHeightBehavior');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = DefaultTextStyle(key: key, style: style, textAlign: textAlign, softWrap: softWrap, overflow: overflow, maxLines: maxLines, textWidthBasis: textWidthBasis, textHeightBehavior: textHeightBehavior, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SliderTheme_SliderTheme(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    SliderThemeData? data = _getNamedParam<SliderThemeData>(L, top_, 'data')!;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = SliderTheme(key: key, data: data, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SliderThemeData_SliderThemeData(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? trackHeight = _getNamedParam<double>(L, top_, 'trackHeight');

    Color? activeTrackColor = _getNamedParam<Color>(L, top_, 'activeTrackColor');

    Color? inactiveTrackColor = _getNamedParam<Color>(L, top_, 'inactiveTrackColor');

    Color? secondaryActiveTrackColor = _getNamedParam<Color>(L, top_, 'secondaryActiveTrackColor');

    Color? disabledActiveTrackColor = _getNamedParam<Color>(L, top_, 'disabledActiveTrackColor');

    Color? disabledInactiveTrackColor = _getNamedParam<Color>(L, top_, 'disabledInactiveTrackColor');

    Color? disabledSecondaryActiveTrackColor = _getNamedParam<Color>(L, top_, 'disabledSecondaryActiveTrackColor');

    Color? activeTickMarkColor = _getNamedParam<Color>(L, top_, 'activeTickMarkColor');

    Color? inactiveTickMarkColor = _getNamedParam<Color>(L, top_, 'inactiveTickMarkColor');

    Color? disabledActiveTickMarkColor = _getNamedParam<Color>(L, top_, 'disabledActiveTickMarkColor');

    Color? disabledInactiveTickMarkColor = _getNamedParam<Color>(L, top_, 'disabledInactiveTickMarkColor');

    Color? thumbColor = _getNamedParam<Color>(L, top_, 'thumbColor');

    Color? overlappingShapeStrokeColor = _getNamedParam<Color>(L, top_, 'overlappingShapeStrokeColor');

    Color? disabledThumbColor = _getNamedParam<Color>(L, top_, 'disabledThumbColor');

    Color? overlayColor = _getNamedParam<Color>(L, top_, 'overlayColor');

    Color? valueIndicatorColor = _getNamedParam<Color>(L, top_, 'valueIndicatorColor');

    SliderComponentShape? overlayShape = _getNamedParam<SliderComponentShape>(L, top_, 'overlayShape');

    SliderTickMarkShape? tickMarkShape = _getNamedParam<SliderTickMarkShape>(L, top_, 'tickMarkShape');

    SliderComponentShape? thumbShape = _getNamedParam<SliderComponentShape>(L, top_, 'thumbShape');

    SliderTrackShape? trackShape = _getNamedParam<SliderTrackShape>(L, top_, 'trackShape');

    SliderComponentShape? valueIndicatorShape = _getNamedParam<SliderComponentShape>(L, top_, 'valueIndicatorShape');

    RangeSliderTickMarkShape? rangeTickMarkShape = _getNamedParam<RangeSliderTickMarkShape>(L, top_, 'rangeTickMarkShape');

    RangeSliderThumbShape? rangeThumbShape = _getNamedParam<RangeSliderThumbShape>(L, top_, 'rangeThumbShape');

    RangeSliderTrackShape? rangeTrackShape = _getNamedParam<RangeSliderTrackShape>(L, top_, 'rangeTrackShape');

    RangeSliderValueIndicatorShape? rangeValueIndicatorShape = _getNamedParam<RangeSliderValueIndicatorShape>(L, top_, 'rangeValueIndicatorShape');

    ShowValueIndicator? showValueIndicator = _getNamedParam<ShowValueIndicator>(L, top_, 'showValueIndicator');

    TextStyle? valueIndicatorTextStyle = _getNamedParam<TextStyle>(L, top_, 'valueIndicatorTextStyle');

    double? minThumbSeparation = _getNamedParam<double>(L, top_, 'minThumbSeparation');

    RangeThumbSelector? thumbSelector = _getNamedParam<RangeThumbSelector>(L, top_, 'thumbSelector');

    MaterialStateProperty<MouseCursor?>? mouseCursor = _getNamedParam<MaterialStateProperty<MouseCursor?>>(L, top_, 'mouseCursor');

    var result_ = SliderThemeData(trackHeight: trackHeight, activeTrackColor: activeTrackColor, inactiveTrackColor: inactiveTrackColor, secondaryActiveTrackColor: secondaryActiveTrackColor, disabledActiveTrackColor: disabledActiveTrackColor, disabledInactiveTrackColor: disabledInactiveTrackColor, disabledSecondaryActiveTrackColor: disabledSecondaryActiveTrackColor, activeTickMarkColor: activeTickMarkColor, inactiveTickMarkColor: inactiveTickMarkColor, disabledActiveTickMarkColor: disabledActiveTickMarkColor, disabledInactiveTickMarkColor: disabledInactiveTickMarkColor, thumbColor: thumbColor, overlappingShapeStrokeColor: overlappingShapeStrokeColor, disabledThumbColor: disabledThumbColor, overlayColor: overlayColor, valueIndicatorColor: valueIndicatorColor, overlayShape: overlayShape, tickMarkShape: tickMarkShape, thumbShape: thumbShape, trackShape: trackShape, valueIndicatorShape: valueIndicatorShape, rangeTickMarkShape: rangeTickMarkShape, rangeThumbShape: rangeThumbShape, rangeTrackShape: rangeTrackShape, rangeValueIndicatorShape: rangeValueIndicatorShape, showValueIndicator: showValueIndicator, valueIndicatorTextStyle: valueIndicatorTextStyle, minThumbSeparation: minThumbSeparation, thumbSelector: thumbSelector, mouseCursor: mouseCursor);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SliderComponentShape_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #noThumb: return luaPush(L, SliderComponentShape.noThumb);
    case #noOverlay: return luaPush(L, SliderComponentShape.noOverlay);
  }

  lua_pushnil(L);
  return 1;
}

int _Slider_Slider(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? value = _getNamedParam<double>(L, top_, 'value')!;

    double? secondaryTrackValue = _getNamedParam<double>(L, top_, 'secondaryTrackValue');

    DoubleValueChanged? onChanged = _getVoidCallbackT<double>(L, top_, 'onChanged');

    DoubleValueChanged? onChangeStart = _getVoidCallbackT<double>(L, top_, 'onChangeStart');

    DoubleValueChanged? onChangeEnd = _getVoidCallbackT<double>(L, top_, 'onChangeEnd');

    double? min = _getNamedParam<double>(L, top_, 'min');
    min ??= 0.0;

    double? max = _getNamedParam<double>(L, top_, 'max');
    max ??= 1.0;

    int? divisions = _getNamedParam<int>(L, top_, 'divisions');

    String? label = _getNamedParam<String>(L, top_, 'label');

    Color? activeColor = _getNamedParam<Color>(L, top_, 'activeColor');

    Color? inactiveColor = _getNamedParam<Color>(L, top_, 'inactiveColor');

    Color? secondaryActiveColor = _getNamedParam<Color>(L, top_, 'secondaryActiveColor');

    Color? thumbColor = _getNamedParam<Color>(L, top_, 'thumbColor');

    MaterialStateProperty<Color?>? overlayColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'overlayColor');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    SemanticFormatterCallback? semanticFormatterCallback = _getNamedParam<SemanticFormatterCallback>(L, top_, 'semanticFormatterCallback');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    var result_ = Slider(key: key, value: value, secondaryTrackValue: secondaryTrackValue, onChanged: onChanged, onChangeStart: onChangeStart, onChangeEnd: onChangeEnd, min: min, max: max, divisions: divisions, label: label, activeColor: activeColor, inactiveColor: inactiveColor, secondaryActiveColor: secondaryActiveColor, thumbColor: thumbColor, overlayColor: overlayColor, mouseCursor: mouseCursor, semanticFormatterCallback: semanticFormatterCallback, focusNode: focusNode, autofocus: autofocus);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Stack_Stack(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');
    alignment ??= AlignmentDirectional.topStart;

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection');

    StackFit? fit = _getNamedParam<StackFit>(L, top_, 'fit');
    fit ??= StackFit.loose;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.hardEdge;

    List<Widget>? children = _getNamedListParam<Widget>(L, top_, 'children');
    children ??= const <Widget>[];

    var result_ = Stack(key: key, alignment: alignment, textDirection: textDirection, fit: fit, clipBehavior: clipBehavior, children: children);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Positioned_Positioned(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? left = _getNamedParam<double>(L, top_, 'left');

    double? top = _getNamedParam<double>(L, top_, 'top');

    double? right = _getNamedParam<double>(L, top_, 'right');

    double? bottom = _getNamedParam<double>(L, top_, 'bottom');

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? height = _getNamedParam<double>(L, top_, 'height');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = Positioned(key: key, left: left, top: top, right: right, bottom: bottom, width: width, height: height, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Positioned_directional(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection')!;

    double? start = _getNamedParam<double>(L, top_, 'start');

    double? top = _getNamedParam<double>(L, top_, 'top');

    double? end = _getNamedParam<double>(L, top_, 'end');

    double? bottom = _getNamedParam<double>(L, top_, 'bottom');

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? height = _getNamedParam<double>(L, top_, 'height');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = Positioned.directional(key: key, textDirection: textDirection, start: start, top: top, end: end, bottom: bottom, width: width, height: height, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Positioned_fill(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? left = _getNamedParam<double>(L, top_, 'left');
    left ??= 0.0;

    double? top = _getNamedParam<double>(L, top_, 'top');
    top ??= 0.0;

    double? right = _getNamedParam<double>(L, top_, 'right');
    right ??= 0.0;

    double? bottom = _getNamedParam<double>(L, top_, 'bottom');
    bottom ??= 0.0;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = Positioned.fill(key: key, left: left, top: top, right: right, bottom: bottom, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Positioned_fromRect(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Rect? rect = _getNamedParam<Rect>(L, top_, 'rect')!;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = Positioned.fromRect(key: key, rect: rect, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Positioned_fromRelativeRect(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    RelativeRect? rect = _getNamedParam<RelativeRect>(L, top_, 'rect')!;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = Positioned.fromRelativeRect(key: key, rect: rect, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _LongPressDraggable_LongPressDraggable(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    Widget? feedback = _getNamedParam<Widget>(L, top_, 'feedback')!;

    Object? data = _getNamedParam<Object>(L, top_, 'data');

    Axis? axis = _getNamedParam<Axis>(L, top_, 'axis');

    Widget? childWhenDragging = _getNamedParam<Widget>(L, top_, 'childWhenDragging');

    Offset? feedbackOffset = _getNamedParam<Offset>(L, top_, 'feedbackOffset');
    feedbackOffset ??= Offset.zero;

    DragAnchorStrategy? dragAnchorStrategy = _getNamedParam<DragAnchorStrategy>(L, top_, 'dragAnchorStrategy');
    dragAnchorStrategy ??= childDragAnchorStrategy;

    int? maxSimultaneousDrags = _getNamedParam<int>(L, top_, 'maxSimultaneousDrags');

    VoidCallback? onDragStarted = _getVoidCallback(L, top_, 'onDragStarted');

    DragUpdateCallback? onDragUpdate = _getNamedParam<DragUpdateCallback>(L, top_, 'onDragUpdate');

    DraggableCanceledCallback? onDraggableCanceled = _getDraggableCanceledCallback(L, top_, 'onDraggableCanceled');

    DragEndCallback? onDragEnd = _getVoidCallbackT<DraggableDetails>(L, top_, 'onDragEnd');

    VoidCallback? onDragCompleted = _getVoidCallback(L, top_, 'onDragCompleted');

    bool? hapticFeedbackOnStart = _getNamedParam<bool>(L, top_, 'hapticFeedbackOnStart');
    hapticFeedbackOnStart ??= true;

    bool? ignoringFeedbackSemantics = _getNamedParam<bool>(L, top_, 'ignoringFeedbackSemantics');
    ignoringFeedbackSemantics ??= true;

    bool? ignoringFeedbackPointer = _getNamedParam<bool>(L, top_, 'ignoringFeedbackPointer');
    ignoringFeedbackPointer ??= true;

    Duration? delay = _getNamedParam<Duration>(L, top_, 'delay');
    delay ??= kLongPressTimeout;

    var result_ = LongPressDraggable(key: key, child: child, feedback: feedback, data: data, axis: axis, childWhenDragging: childWhenDragging, feedbackOffset: feedbackOffset, dragAnchorStrategy: dragAnchorStrategy, maxSimultaneousDrags: maxSimultaneousDrags, onDragStarted: onDragStarted, onDragUpdate: onDragUpdate, onDraggableCanceled: onDraggableCanceled, onDragEnd: onDragEnd, onDragCompleted: onDragCompleted, hapticFeedbackOnStart: hapticFeedbackOnStart, ignoringFeedbackSemantics: ignoringFeedbackSemantics, ignoringFeedbackPointer: ignoringFeedbackPointer, delay: delay);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Draggable_Draggable(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    Widget? feedback = _getNamedParam<Widget>(L, top_, 'feedback')!;

    Object? data = _getNamedParam<Object>(L, top_, 'data');

    Axis? axis = _getNamedParam<Axis>(L, top_, 'axis');

    Widget? childWhenDragging = _getNamedParam<Widget>(L, top_, 'childWhenDragging');

    Offset? feedbackOffset = _getNamedParam<Offset>(L, top_, 'feedbackOffset');
    feedbackOffset ??= Offset.zero;

    DragAnchorStrategy? dragAnchorStrategy = _getNamedParam<DragAnchorStrategy>(L, top_, 'dragAnchorStrategy');
    dragAnchorStrategy ??= childDragAnchorStrategy;

    Axis? affinity = _getNamedParam<Axis>(L, top_, 'affinity');

    int? maxSimultaneousDrags = _getNamedParam<int>(L, top_, 'maxSimultaneousDrags');

    VoidCallback? onDragStarted = _getVoidCallback(L, top_, 'onDragStarted');

    DragUpdateCallback? onDragUpdate = _getNamedParam<DragUpdateCallback>(L, top_, 'onDragUpdate');

    DraggableCanceledCallback? onDraggableCanceled = _getDraggableCanceledCallback(L, top_, 'onDraggableCanceled');

    DragEndCallback? onDragEnd = _getVoidCallbackT<DraggableDetails>(L, top_, 'onDragEnd');

    VoidCallback? onDragCompleted = _getVoidCallback(L, top_, 'onDragCompleted');

    bool? ignoringFeedbackSemantics = _getNamedParam<bool>(L, top_, 'ignoringFeedbackSemantics');
    ignoringFeedbackSemantics ??= true;

    bool? ignoringFeedbackPointer = _getNamedParam<bool>(L, top_, 'ignoringFeedbackPointer');
    ignoringFeedbackPointer ??= true;

    bool? rootOverlay = _getNamedParam<bool>(L, top_, 'rootOverlay');
    rootOverlay ??= false;

    HitTestBehavior? hitTestBehavior = _getNamedParam<HitTestBehavior>(L, top_, 'hitTestBehavior');
    hitTestBehavior ??= HitTestBehavior.deferToChild;

    var result_ = Draggable(key: key, child: child, feedback: feedback, data: data, axis: axis, childWhenDragging: childWhenDragging, feedbackOffset: feedbackOffset, dragAnchorStrategy: dragAnchorStrategy, affinity: affinity, maxSimultaneousDrags: maxSimultaneousDrags, onDragStarted: onDragStarted, onDragUpdate: onDragUpdate, onDraggableCanceled: onDraggableCanceled, onDragEnd: onDragEnd, onDragCompleted: onDragCompleted, ignoringFeedbackSemantics: ignoringFeedbackSemantics, ignoringFeedbackPointer: ignoringFeedbackPointer, rootOverlay: rootOverlay, hitTestBehavior: hitTestBehavior);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _DragTarget_DragTarget(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    DragTargetBuilder<Object>? builder = _getNamedParam<DragTargetBuilder<Object>>(L, top_, 'builder')!;

    DragTargetWillAccept<Object>? onWillAccept = _getNamedParam<DragTargetWillAccept<Object>>(L, top_, 'onWillAccept');

    DragTargetAccept<Object>? onAccept = _getNamedParam<DragTargetAccept<Object>>(L, top_, 'onAccept');

    DragTargetAcceptWithDetails<Object>? onAcceptWithDetails = _getNamedParam<DragTargetAcceptWithDetails<Object>>(L, top_, 'onAcceptWithDetails');

    DragTargetLeave<Object>? onLeave = _getNamedParam<DragTargetLeave<Object>>(L, top_, 'onLeave');

    DragTargetMove<Object>? onMove = _getNamedParam<DragTargetMove<Object>>(L, top_, 'onMove');

    HitTestBehavior? hitTestBehavior = _getNamedParam<HitTestBehavior>(L, top_, 'hitTestBehavior');
    hitTestBehavior ??= HitTestBehavior.translucent;

    var result_ = DragTarget(key: key, builder: builder, onWillAccept: onWillAccept, onAccept: onAccept, onAcceptWithDetails: onAcceptWithDetails, onLeave: onLeave, onMove: onMove, hitTestBehavior: hitTestBehavior);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _DraggableDetails_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<DraggableDetails>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #wasAccepted: return luaPush(L, object.wasAccepted);
    case #velocity: return luaPush(L, object.velocity);
    case #offset: return luaPush(L, object.offset);
  }

  lua_pushnil(L);
  return 1;
}

int _Opacity_Opacity(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? opacity = _getNamedParam<double>(L, top_, 'opacity')!;

    bool? alwaysIncludeSemantics = _getNamedParam<bool>(L, top_, 'alwaysIncludeSemantics');
    alwaysIncludeSemantics ??= false;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = Opacity(key: key, opacity: opacity, alwaysIncludeSemantics: alwaysIncludeSemantics, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ColoredBox_ColoredBox(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Color? color = _getNamedParam<Color>(L, top_, 'color')!;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = ColoredBox(key: key, color: color, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Velocity_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #zero: return luaPush(L, Velocity.zero);
  }

  var object = luaToObjectT<Velocity>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #pixelsPerSecond: return luaPush(L, object.pixelsPerSecond);
  }

  lua_pushnil(L);
  return 1;
}

int _Divider_Divider(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? height = _getNamedParam<double>(L, top_, 'height');

    double? thickness = _getNamedParam<double>(L, top_, 'thickness');

    double? indent = _getNamedParam<double>(L, top_, 'indent');

    double? endIndent = _getNamedParam<double>(L, top_, 'endIndent');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    var result_ = Divider(key: key, height: height, thickness: thickness, indent: indent, endIndent: endIndent, color: color);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _VerticalDivider_VerticalDivider(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? thickness = _getNamedParam<double>(L, top_, 'thickness');

    double? indent = _getNamedParam<double>(L, top_, 'indent');

    double? endIndent = _getNamedParam<double>(L, top_, 'endIndent');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    var result_ = VerticalDivider(key: key, width: width, thickness: thickness, indent: indent, endIndent: endIndent, color: color);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Wrap_Wrap(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Axis? direction = _getNamedParam<Axis>(L, top_, 'direction');
    direction ??= Axis.horizontal;

    WrapAlignment? alignment = _getNamedParam<WrapAlignment>(L, top_, 'alignment');
    alignment ??= WrapAlignment.start;

    double? spacing = _getNamedParam<double>(L, top_, 'spacing');
    spacing ??= 0.0;

    WrapAlignment? runAlignment = _getNamedParam<WrapAlignment>(L, top_, 'runAlignment');
    runAlignment ??= WrapAlignment.start;

    double? runSpacing = _getNamedParam<double>(L, top_, 'runSpacing');
    runSpacing ??= 0.0;

    WrapCrossAlignment? crossAxisAlignment = _getNamedParam<WrapCrossAlignment>(L, top_, 'crossAxisAlignment');
    crossAxisAlignment ??= WrapCrossAlignment.start;

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection');

    VerticalDirection? verticalDirection = _getNamedParam<VerticalDirection>(L, top_, 'verticalDirection');
    verticalDirection ??= VerticalDirection.down;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    List<Widget>? children = _getNamedListParam<Widget>(L, top_, 'children');
    children ??= const <Widget>[];

    var result_ = Wrap(key: key, direction: direction, alignment: alignment, spacing: spacing, runAlignment: runAlignment, runSpacing: runSpacing, crossAxisAlignment: crossAxisAlignment, textDirection: textDirection, verticalDirection: verticalDirection, clipBehavior: clipBehavior, children: children);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _GestureDetector_GestureDetector(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    GestureTapDownCallback? onTapDown = _getVoidCallbackT<TapDownDetails>(L, top_, 'onTapDown');

    GestureTapUpCallback? onTapUp = _getVoidCallbackT<TapUpDetails>(L, top_, 'onTapUp');

    GestureTapCallback? onTap = _getVoidCallback(L, top_, 'onTap');

    GestureTapCancelCallback? onTapCancel = _getVoidCallback(L, top_, 'onTapCancel');

    GestureTapCallback? onSecondaryTap = _getVoidCallback(L, top_, 'onSecondaryTap');

    GestureTapDownCallback? onSecondaryTapDown = _getVoidCallbackT<TapDownDetails>(L, top_, 'onSecondaryTapDown');

    GestureTapUpCallback? onSecondaryTapUp = _getVoidCallbackT<TapUpDetails>(L, top_, 'onSecondaryTapUp');

    GestureTapCancelCallback? onSecondaryTapCancel = _getVoidCallback(L, top_, 'onSecondaryTapCancel');

    GestureTapDownCallback? onTertiaryTapDown = _getVoidCallbackT<TapDownDetails>(L, top_, 'onTertiaryTapDown');

    GestureTapUpCallback? onTertiaryTapUp = _getVoidCallbackT<TapUpDetails>(L, top_, 'onTertiaryTapUp');

    GestureTapCancelCallback? onTertiaryTapCancel = _getVoidCallback(L, top_, 'onTertiaryTapCancel');

    GestureTapDownCallback? onDoubleTapDown = _getVoidCallbackT<TapDownDetails>(L, top_, 'onDoubleTapDown');

    GestureTapCallback? onDoubleTap = _getVoidCallback(L, top_, 'onDoubleTap');

    GestureTapCancelCallback? onDoubleTapCancel = _getVoidCallback(L, top_, 'onDoubleTapCancel');

    GestureLongPressDownCallback? onLongPressDown = _getVoidCallbackT<LongPressDownDetails>(L, top_, 'onLongPressDown');

    GestureLongPressCancelCallback? onLongPressCancel = _getVoidCallback(L, top_, 'onLongPressCancel');

    GestureLongPressCallback? onLongPress = _getVoidCallback(L, top_, 'onLongPress');

    GestureLongPressStartCallback? onLongPressStart = _getVoidCallbackT<LongPressStartDetails>(L, top_, 'onLongPressStart');

    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate = _getVoidCallbackT<LongPressMoveUpdateDetails>(L, top_, 'onLongPressMoveUpdate');

    GestureLongPressUpCallback? onLongPressUp = _getVoidCallback(L, top_, 'onLongPressUp');

    GestureLongPressEndCallback? onLongPressEnd = _getVoidCallbackT<LongPressEndDetails>(L, top_, 'onLongPressEnd');

    GestureLongPressDownCallback? onSecondaryLongPressDown = _getVoidCallbackT<LongPressDownDetails>(L, top_, 'onSecondaryLongPressDown');

    GestureLongPressCancelCallback? onSecondaryLongPressCancel = _getVoidCallback(L, top_, 'onSecondaryLongPressCancel');

    GestureLongPressCallback? onSecondaryLongPress = _getVoidCallback(L, top_, 'onSecondaryLongPress');

    GestureLongPressStartCallback? onSecondaryLongPressStart = _getVoidCallbackT<LongPressStartDetails>(L, top_, 'onSecondaryLongPressStart');

    GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate = _getVoidCallbackT<LongPressMoveUpdateDetails>(L, top_, 'onSecondaryLongPressMoveUpdate');

    GestureLongPressUpCallback? onSecondaryLongPressUp = _getVoidCallback(L, top_, 'onSecondaryLongPressUp');

    GestureLongPressEndCallback? onSecondaryLongPressEnd = _getVoidCallbackT<LongPressEndDetails>(L, top_, 'onSecondaryLongPressEnd');

    GestureLongPressDownCallback? onTertiaryLongPressDown = _getVoidCallbackT<LongPressDownDetails>(L, top_, 'onTertiaryLongPressDown');

    GestureLongPressCancelCallback? onTertiaryLongPressCancel = _getVoidCallback(L, top_, 'onTertiaryLongPressCancel');

    GestureLongPressCallback? onTertiaryLongPress = _getVoidCallback(L, top_, 'onTertiaryLongPress');

    GestureLongPressStartCallback? onTertiaryLongPressStart = _getVoidCallbackT<LongPressStartDetails>(L, top_, 'onTertiaryLongPressStart');

    GestureLongPressMoveUpdateCallback? onTertiaryLongPressMoveUpdate = _getVoidCallbackT<LongPressMoveUpdateDetails>(L, top_, 'onTertiaryLongPressMoveUpdate');

    GestureLongPressUpCallback? onTertiaryLongPressUp = _getVoidCallback(L, top_, 'onTertiaryLongPressUp');

    GestureLongPressEndCallback? onTertiaryLongPressEnd = _getVoidCallbackT<LongPressEndDetails>(L, top_, 'onTertiaryLongPressEnd');

    GestureDragDownCallback? onVerticalDragDown = _getVoidCallbackT<DragDownDetails>(L, top_, 'onVerticalDragDown');

    GestureDragStartCallback? onVerticalDragStart = _getVoidCallbackT<DragStartDetails>(L, top_, 'onVerticalDragStart');

    GestureDragUpdateCallback? onVerticalDragUpdate = _getVoidCallbackT<DragUpdateDetails>(L, top_, 'onVerticalDragUpdate');

    GestureDragEndCallback? onVerticalDragEnd = _getVoidCallbackT<DragEndDetails>(L, top_, 'onVerticalDragEnd');

    GestureDragCancelCallback? onVerticalDragCancel = _getVoidCallback(L, top_, 'onVerticalDragCancel');

    GestureDragDownCallback? onHorizontalDragDown = _getVoidCallbackT<DragDownDetails>(L, top_, 'onHorizontalDragDown');

    GestureDragStartCallback? onHorizontalDragStart = _getVoidCallbackT<DragStartDetails>(L, top_, 'onHorizontalDragStart');

    GestureDragUpdateCallback? onHorizontalDragUpdate = _getVoidCallbackT<DragUpdateDetails>(L, top_, 'onHorizontalDragUpdate');

    GestureDragEndCallback? onHorizontalDragEnd = _getVoidCallbackT<DragEndDetails>(L, top_, 'onHorizontalDragEnd');

    GestureDragCancelCallback? onHorizontalDragCancel = _getVoidCallback(L, top_, 'onHorizontalDragCancel');

    GestureForcePressStartCallback? onForcePressStart = _getNamedParam<GestureForcePressStartCallback>(L, top_, 'onForcePressStart');

    GestureForcePressPeakCallback? onForcePressPeak = _getNamedParam<GestureForcePressPeakCallback>(L, top_, 'onForcePressPeak');

    GestureForcePressUpdateCallback? onForcePressUpdate = _getNamedParam<GestureForcePressUpdateCallback>(L, top_, 'onForcePressUpdate');

    GestureForcePressEndCallback? onForcePressEnd = _getNamedParam<GestureForcePressEndCallback>(L, top_, 'onForcePressEnd');

    GestureDragDownCallback? onPanDown = _getVoidCallbackT<DragDownDetails>(L, top_, 'onPanDown');

    GestureDragStartCallback? onPanStart = _getVoidCallbackT<DragStartDetails>(L, top_, 'onPanStart');

    GestureDragUpdateCallback? onPanUpdate = _getVoidCallbackT<DragUpdateDetails>(L, top_, 'onPanUpdate');

    GestureDragEndCallback? onPanEnd = _getVoidCallbackT<DragEndDetails>(L, top_, 'onPanEnd');

    GestureDragCancelCallback? onPanCancel = _getVoidCallback(L, top_, 'onPanCancel');

    GestureScaleStartCallback? onScaleStart = _getNamedParam<GestureScaleStartCallback>(L, top_, 'onScaleStart');

    GestureScaleUpdateCallback? onScaleUpdate = _getNamedParam<GestureScaleUpdateCallback>(L, top_, 'onScaleUpdate');

    GestureScaleEndCallback? onScaleEnd = _getNamedParam<GestureScaleEndCallback>(L, top_, 'onScaleEnd');

    HitTestBehavior? behavior = _getNamedParam<HitTestBehavior>(L, top_, 'behavior');

    bool? excludeFromSemantics = _getNamedParam<bool>(L, top_, 'excludeFromSemantics');
    excludeFromSemantics ??= false;

    DragStartBehavior? dragStartBehavior = _getNamedParam<DragStartBehavior>(L, top_, 'dragStartBehavior');
    dragStartBehavior ??= DragStartBehavior.start;

    Set<PointerDeviceKind>? supportedDevices = _getNamedSetParam<PointerDeviceKind>(L, top_, 'supportedDevices');

    var result_ = GestureDetector(key: key, child: child, onTapDown: onTapDown, onTapUp: onTapUp, onTap: onTap, onTapCancel: onTapCancel, onSecondaryTap: onSecondaryTap, onSecondaryTapDown: onSecondaryTapDown, onSecondaryTapUp: onSecondaryTapUp, onSecondaryTapCancel: onSecondaryTapCancel, onTertiaryTapDown: onTertiaryTapDown, onTertiaryTapUp: onTertiaryTapUp, onTertiaryTapCancel: onTertiaryTapCancel, onDoubleTapDown: onDoubleTapDown, onDoubleTap: onDoubleTap, onDoubleTapCancel: onDoubleTapCancel, onLongPressDown: onLongPressDown, onLongPressCancel: onLongPressCancel, onLongPress: onLongPress, onLongPressStart: onLongPressStart, onLongPressMoveUpdate: onLongPressMoveUpdate, onLongPressUp: onLongPressUp, onLongPressEnd: onLongPressEnd, onSecondaryLongPressDown: onSecondaryLongPressDown, onSecondaryLongPressCancel: onSecondaryLongPressCancel, onSecondaryLongPress: onSecondaryLongPress, onSecondaryLongPressStart: onSecondaryLongPressStart, onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate, onSecondaryLongPressUp: onSecondaryLongPressUp, onSecondaryLongPressEnd: onSecondaryLongPressEnd, onTertiaryLongPressDown: onTertiaryLongPressDown, onTertiaryLongPressCancel: onTertiaryLongPressCancel, onTertiaryLongPress: onTertiaryLongPress, onTertiaryLongPressStart: onTertiaryLongPressStart, onTertiaryLongPressMoveUpdate: onTertiaryLongPressMoveUpdate, onTertiaryLongPressUp: onTertiaryLongPressUp, onTertiaryLongPressEnd: onTertiaryLongPressEnd, onVerticalDragDown: onVerticalDragDown, onVerticalDragStart: onVerticalDragStart, onVerticalDragUpdate: onVerticalDragUpdate, onVerticalDragEnd: onVerticalDragEnd, onVerticalDragCancel: onVerticalDragCancel, onHorizontalDragDown: onHorizontalDragDown, onHorizontalDragStart: onHorizontalDragStart, onHorizontalDragUpdate: onHorizontalDragUpdate, onHorizontalDragEnd: onHorizontalDragEnd, onHorizontalDragCancel: onHorizontalDragCancel, onForcePressStart: onForcePressStart, onForcePressPeak: onForcePressPeak, onForcePressUpdate: onForcePressUpdate, onForcePressEnd: onForcePressEnd, onPanDown: onPanDown, onPanStart: onPanStart, onPanUpdate: onPanUpdate, onPanEnd: onPanEnd, onPanCancel: onPanCancel, onScaleStart: onScaleStart, onScaleUpdate: onScaleUpdate, onScaleEnd: onScaleEnd, behavior: behavior, excludeFromSemantics: excludeFromSemantics, dragStartBehavior: dragStartBehavior, supportedDevices: supportedDevices);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _DragStartDetails_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<DragStartDetails>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #globalPosition: return luaPush(L, object.globalPosition);
    case #localPosition: return luaPush(L, object.localPosition);
  }

  lua_pushnil(L);
  return 1;
}

int _DragUpdateDetails_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  var object = luaToObjectT<DragUpdateDetails>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #delta: return luaPush(L, object.delta);
    case #globalPosition: return luaPush(L, object.globalPosition);
    case #localPosition: return luaPush(L, object.localPosition);
  }

  lua_pushnil(L);
  return 1;
}

int _UniqueKey_UniqueKey(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    var result_ = UniqueKey();

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Duration_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #zero: return luaPush(L, Duration.zero);
  }

  var object = luaToObjectT<Duration>(L, 1);
  if (object == null) {
    lua_pushnil(L);
    return 1;
  }

  switch(propName) {
    case #inDays: return luaPush(L, object.inDays);
    case #inHours: return luaPush(L, object.inHours);
    case #inMicroseconds: return luaPush(L, object.inMicroseconds);
    case #inMilliseconds: return luaPush(L, object.inMilliseconds);
    case #inMinutes: return luaPush(L, object.inMinutes);
    case #inSeconds: return luaPush(L, object.inSeconds);
  }

  lua_pushnil(L);
  return 1;
}

int _Duration_Duration(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? days = _getNamedParam<int>(L, top_, 'days');
    days ??= 0;

    int? hours = _getNamedParam<int>(L, top_, 'hours');
    hours ??= 0;

    int? minutes = _getNamedParam<int>(L, top_, 'minutes');
    minutes ??= 0;

    int? seconds = _getNamedParam<int>(L, top_, 'seconds');
    seconds ??= 0;

    int? milliseconds = _getNamedParam<int>(L, top_, 'milliseconds');
    milliseconds ??= 0;

    int? microseconds = _getNamedParam<int>(L, top_, 'microseconds');
    microseconds ??= 0;

    var result_ = Duration(days: days, hours: hours, minutes: minutes, seconds: seconds, milliseconds: milliseconds, microseconds: microseconds);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Duration_compareTo(VoidPtr L) {
  try {

    Duration self = luaToObjectT<Duration>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Duration? other = _getParam<Duration>(L, 2)!;

    var result_ = self.compareTo(other);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Dialog_Dialog(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    Color? shadowColor = _getNamedParam<Color>(L, top_, 'shadowColor');

    Color? surfaceTintColor = _getNamedParam<Color>(L, top_, 'surfaceTintColor');

    Duration? insetAnimationDuration = _getNamedParam<Duration>(L, top_, 'insetAnimationDuration');
    insetAnimationDuration ??= const Duration(milliseconds: 100);

    Curve? insetAnimationCurve = _getNamedParam<Curve>(L, top_, 'insetAnimationCurve');
    insetAnimationCurve ??= Curves.decelerate;

    EdgeInsets? insetPadding = _getNamedParam<EdgeInsets>(L, top_, 'insetPadding');
    insetPadding ??= _defaultInsetPadding;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = Dialog(key: key, backgroundColor: backgroundColor, elevation: elevation, shadowColor: shadowColor, surfaceTintColor: surfaceTintColor, insetAnimationDuration: insetAnimationDuration, insetAnimationCurve: insetAnimationCurve, insetPadding: insetPadding, clipBehavior: clipBehavior, shape: shape, alignment: alignment, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _AlertDialog_AlertDialog(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? icon = _getNamedParam<Widget>(L, top_, 'icon');

    EdgeInsetsGeometry? iconPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'iconPadding');

    Color? iconColor = _getNamedParam<Color>(L, top_, 'iconColor');

    Widget? title = _getNamedParam<Widget>(L, top_, 'title');

    EdgeInsetsGeometry? titlePadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'titlePadding');

    TextStyle? titleTextStyle = _getNamedParam<TextStyle>(L, top_, 'titleTextStyle');

    Widget? content = _getNamedParam<Widget>(L, top_, 'content');

    EdgeInsetsGeometry? contentPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'contentPadding');

    TextStyle? contentTextStyle = _getNamedParam<TextStyle>(L, top_, 'contentTextStyle');

    List<Widget>? actions = _getNamedListParam<Widget>(L, top_, 'actions');

    EdgeInsetsGeometry? actionsPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'actionsPadding');

    MainAxisAlignment? actionsAlignment = _getNamedParam<MainAxisAlignment>(L, top_, 'actionsAlignment');

    OverflowBarAlignment? actionsOverflowAlignment = _getNamedParam<OverflowBarAlignment>(L, top_, 'actionsOverflowAlignment');

    VerticalDirection? actionsOverflowDirection = _getNamedParam<VerticalDirection>(L, top_, 'actionsOverflowDirection');

    double? actionsOverflowButtonSpacing = _getNamedParam<double>(L, top_, 'actionsOverflowButtonSpacing');

    EdgeInsetsGeometry? buttonPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'buttonPadding');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    Color? shadowColor = _getNamedParam<Color>(L, top_, 'shadowColor');

    Color? surfaceTintColor = _getNamedParam<Color>(L, top_, 'surfaceTintColor');

    String? semanticLabel = _getNamedParam<String>(L, top_, 'semanticLabel');

    EdgeInsets? insetPadding = _getNamedParam<EdgeInsets>(L, top_, 'insetPadding');
    insetPadding ??= _defaultInsetPadding;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');

    bool? scrollable = _getNamedParam<bool>(L, top_, 'scrollable');
    scrollable ??= false;

    var result_ = AlertDialog(key: key, icon: icon, iconPadding: iconPadding, iconColor: iconColor, title: title, titlePadding: titlePadding, titleTextStyle: titleTextStyle, content: content, contentPadding: contentPadding, contentTextStyle: contentTextStyle, actions: actions, actionsPadding: actionsPadding, actionsAlignment: actionsAlignment, actionsOverflowAlignment: actionsOverflowAlignment, actionsOverflowDirection: actionsOverflowDirection, actionsOverflowButtonSpacing: actionsOverflowButtonSpacing, buttonPadding: buttonPadding, backgroundColor: backgroundColor, elevation: elevation, shadowColor: shadowColor, surfaceTintColor: surfaceTintColor, semanticLabel: semanticLabel, insetPadding: insetPadding, clipBehavior: clipBehavior, shape: shape, alignment: alignment, scrollable: scrollable);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SimpleDialog_SimpleDialog(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? title = _getNamedParam<Widget>(L, top_, 'title');

    EdgeInsetsGeometry? titlePadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'titlePadding');
    titlePadding ??= const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0);

    TextStyle? titleTextStyle = _getNamedParam<TextStyle>(L, top_, 'titleTextStyle');

    List<Widget>? children = _getNamedListParam<Widget>(L, top_, 'children');

    EdgeInsetsGeometry? contentPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'contentPadding');
    contentPadding ??= const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0);

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    Color? shadowColor = _getNamedParam<Color>(L, top_, 'shadowColor');

    Color? surfaceTintColor = _getNamedParam<Color>(L, top_, 'surfaceTintColor');

    String? semanticLabel = _getNamedParam<String>(L, top_, 'semanticLabel');

    EdgeInsets? insetPadding = _getNamedParam<EdgeInsets>(L, top_, 'insetPadding');
    insetPadding ??= _defaultInsetPadding;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');

    var result_ = SimpleDialog(key: key, title: title, titlePadding: titlePadding, titleTextStyle: titleTextStyle, children: children, contentPadding: contentPadding, backgroundColor: backgroundColor, elevation: elevation, shadowColor: shadowColor, surfaceTintColor: surfaceTintColor, semanticLabel: semanticLabel, insetPadding: insetPadding, clipBehavior: clipBehavior, shape: shape, alignment: alignment);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _CupertinoAlertDialog_CupertinoAlertDialog(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? title = _getNamedParam<Widget>(L, top_, 'title');

    Widget? content = _getNamedParam<Widget>(L, top_, 'content');

    List<Widget>? actions = _getNamedListParam<Widget>(L, top_, 'actions');
    actions ??= const <Widget>[];

    ScrollController? scrollController = _getNamedParam<ScrollController>(L, top_, 'scrollController');

    ScrollController? actionScrollController = _getNamedParam<ScrollController>(L, top_, 'actionScrollController');

    Duration? insetAnimationDuration = _getNamedParam<Duration>(L, top_, 'insetAnimationDuration');
    insetAnimationDuration ??= const Duration(milliseconds: 100);

    Curve? insetAnimationCurve = _getNamedParam<Curve>(L, top_, 'insetAnimationCurve');
    insetAnimationCurve ??= Curves.decelerate;

    var result_ = CupertinoAlertDialog(key: key, title: title, content: content, actions: actions, scrollController: scrollController, actionScrollController: actionScrollController, insetAnimationDuration: insetAnimationDuration, insetAnimationCurve: insetAnimationCurve);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Future_Future(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    VoidCallback? computation = _getVoidCallback(L, 2, null)!;

    var result_ = Future(computation);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Future_delayed(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Duration? duration = _getParam<Duration>(L, 1)!;

    VoidCallback? computation = _getVoidCallback(L, 2, null);

    var result_ = Future.delayed(duration, computation);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Future_microtask(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    VoidCallback? computation = _getVoidCallback(L, 1, null)!;

    var result_ = Future.microtask(computation);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Future_sync(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    VoidCallback? computation = _getVoidCallback(L, 1, null)!;

    var result_ = Future.sync(computation);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Future_then(VoidPtr L) {
  try {

    Future self = luaToObjectT<Future>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    DynamicCallback? onValue = _getDynamicCallback(L, 2, null)!;

    DynamicCallback? onError = _getDynamicCallback(L, top_, 'onError');

    var result_ = self.then(onValue, onError: onError);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Future_catchError(VoidPtr L) {
  try {

    Future self = luaToObjectT<Future>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    DynamicCallback? onError = _getDynamicCallback(L, 2, null)!;

    var result_ = self.catchError(onError);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Future_whenComplete(VoidPtr L) {
  try {

    Future self = luaToObjectT<Future>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    VoidCallback? action = _getVoidCallback(L, 2, null)!;

    var result_ = self.whenComplete(action);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Future_timeout(VoidPtr L) {
  try {

    Future self = luaToObjectT<Future>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Duration? timeLimit = _getParam<Duration>(L, 2)!;

    VoidCallback? onTimeout = _getVoidCallback(L, top_, 'onTimeout');

    var result_ = self.timeout(timeLimit, onTimeout: onTimeout);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _FloatingActionButton_FloatingActionButton(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    String? tooltip = _getNamedParam<String>(L, top_, 'tooltip');

    Color? foregroundColor = _getNamedParam<Color>(L, top_, 'foregroundColor');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    Color? splashColor = _getNamedParam<Color>(L, top_, 'splashColor');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    double? focusElevation = _getNamedParam<double>(L, top_, 'focusElevation');

    double? hoverElevation = _getNamedParam<double>(L, top_, 'hoverElevation');

    double? highlightElevation = _getNamedParam<double>(L, top_, 'highlightElevation');

    double? disabledElevation = _getNamedParam<double>(L, top_, 'disabledElevation');

    VoidCallback? onPressed = _getVoidCallback(L, top_, 'onPressed');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    bool? mini = _getNamedParam<bool>(L, top_, 'mini');
    mini ??= false;

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    MaterialTapTargetSize? materialTapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'materialTapTargetSize');

    bool? isExtended = _getNamedParam<bool>(L, top_, 'isExtended');
    isExtended ??= false;

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    var result_ = FloatingActionButton(key: key, child: child, tooltip: tooltip, foregroundColor: foregroundColor, backgroundColor: backgroundColor, focusColor: focusColor, hoverColor: hoverColor, splashColor: splashColor, elevation: elevation, focusElevation: focusElevation, hoverElevation: hoverElevation, highlightElevation: highlightElevation, disabledElevation: disabledElevation, onPressed: onPressed, mouseCursor: mouseCursor, mini: mini, shape: shape, clipBehavior: clipBehavior, focusNode: focusNode, autofocus: autofocus, materialTapTargetSize: materialTapTargetSize, isExtended: isExtended, enableFeedback: enableFeedback);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _FloatingActionButton_extended(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    String? tooltip = _getNamedParam<String>(L, top_, 'tooltip');

    Color? foregroundColor = _getNamedParam<Color>(L, top_, 'foregroundColor');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    double? focusElevation = _getNamedParam<double>(L, top_, 'focusElevation');

    double? hoverElevation = _getNamedParam<double>(L, top_, 'hoverElevation');

    Color? splashColor = _getNamedParam<Color>(L, top_, 'splashColor');

    double? highlightElevation = _getNamedParam<double>(L, top_, 'highlightElevation');

    double? disabledElevation = _getNamedParam<double>(L, top_, 'disabledElevation');

    VoidCallback? onPressed = _getVoidCallback(L, top_, 'onPressed');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');
    mouseCursor ??= SystemMouseCursors.click;

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    bool? isExtended = _getNamedParam<bool>(L, top_, 'isExtended');
    isExtended ??= true;

    MaterialTapTargetSize? materialTapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'materialTapTargetSize');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    double? extendedIconLabelSpacing = _getNamedParam<double>(L, top_, 'extendedIconLabelSpacing');

    EdgeInsetsGeometry? extendedPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'extendedPadding');

    TextStyle? extendedTextStyle = _getNamedParam<TextStyle>(L, top_, 'extendedTextStyle');

    Widget? icon = _getNamedParam<Widget>(L, top_, 'icon');

    Widget? label = _getNamedParam<Widget>(L, top_, 'label')!;

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    var result_ = FloatingActionButton.extended(key: key, tooltip: tooltip, foregroundColor: foregroundColor, backgroundColor: backgroundColor, focusColor: focusColor, hoverColor: hoverColor, elevation: elevation, focusElevation: focusElevation, hoverElevation: hoverElevation, splashColor: splashColor, highlightElevation: highlightElevation, disabledElevation: disabledElevation, onPressed: onPressed, mouseCursor: mouseCursor, shape: shape, isExtended: isExtended, materialTapTargetSize: materialTapTargetSize, clipBehavior: clipBehavior, focusNode: focusNode, autofocus: autofocus, extendedIconLabelSpacing: extendedIconLabelSpacing, extendedPadding: extendedPadding, extendedTextStyle: extendedTextStyle, icon: icon, label: label, enableFeedback: enableFeedback);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _FloatingActionButton_large(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    String? tooltip = _getNamedParam<String>(L, top_, 'tooltip');

    Color? foregroundColor = _getNamedParam<Color>(L, top_, 'foregroundColor');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    Color? splashColor = _getNamedParam<Color>(L, top_, 'splashColor');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    double? focusElevation = _getNamedParam<double>(L, top_, 'focusElevation');

    double? hoverElevation = _getNamedParam<double>(L, top_, 'hoverElevation');

    double? highlightElevation = _getNamedParam<double>(L, top_, 'highlightElevation');

    double? disabledElevation = _getNamedParam<double>(L, top_, 'disabledElevation');

    VoidCallback? onPressed = _getVoidCallback(L, top_, 'onPressed');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    MaterialTapTargetSize? materialTapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'materialTapTargetSize');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    var result_ = FloatingActionButton.large(key: key, child: child, tooltip: tooltip, foregroundColor: foregroundColor, backgroundColor: backgroundColor, focusColor: focusColor, hoverColor: hoverColor, splashColor: splashColor, elevation: elevation, focusElevation: focusElevation, hoverElevation: hoverElevation, highlightElevation: highlightElevation, disabledElevation: disabledElevation, onPressed: onPressed, mouseCursor: mouseCursor, shape: shape, clipBehavior: clipBehavior, focusNode: focusNode, autofocus: autofocus, materialTapTargetSize: materialTapTargetSize, enableFeedback: enableFeedback);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _FloatingActionButton_small(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    String? tooltip = _getNamedParam<String>(L, top_, 'tooltip');

    Color? foregroundColor = _getNamedParam<Color>(L, top_, 'foregroundColor');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    Color? splashColor = _getNamedParam<Color>(L, top_, 'splashColor');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    double? focusElevation = _getNamedParam<double>(L, top_, 'focusElevation');

    double? hoverElevation = _getNamedParam<double>(L, top_, 'hoverElevation');

    double? highlightElevation = _getNamedParam<double>(L, top_, 'highlightElevation');

    double? disabledElevation = _getNamedParam<double>(L, top_, 'disabledElevation');

    VoidCallback? onPressed = _getVoidCallback(L, top_, 'onPressed');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    MaterialTapTargetSize? materialTapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'materialTapTargetSize');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    var result_ = FloatingActionButton.small(key: key, child: child, tooltip: tooltip, foregroundColor: foregroundColor, backgroundColor: backgroundColor, focusColor: focusColor, hoverColor: hoverColor, splashColor: splashColor, elevation: elevation, focusElevation: focusElevation, hoverElevation: hoverElevation, highlightElevation: highlightElevation, disabledElevation: disabledElevation, onPressed: onPressed, mouseCursor: mouseCursor, shape: shape, clipBehavior: clipBehavior, focusNode: focusNode, autofocus: autofocus, materialTapTargetSize: materialTapTargetSize, enableFeedback: enableFeedback);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Scaffold_Scaffold(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    AppBar? appBar = _getNamedParam<AppBar>(L, top_, 'appBar');

    Widget? body = _getNamedParam<Widget>(L, top_, 'body');

    Widget? floatingActionButton = _getNamedParam<Widget>(L, top_, 'floatingActionButton');

    FloatingActionButtonLocation? floatingActionButtonLocation = _getNamedParam<FloatingActionButtonLocation>(L, top_, 'floatingActionButtonLocation');

    FloatingActionButtonAnimator? floatingActionButtonAnimator = _getNamedParam<FloatingActionButtonAnimator>(L, top_, 'floatingActionButtonAnimator');

    List<Widget>? persistentFooterButtons = _getNamedListParam<Widget>(L, top_, 'persistentFooterButtons');

    AlignmentDirectional? persistentFooterAlignment = _getNamedParam<AlignmentDirectional>(L, top_, 'persistentFooterAlignment');
    persistentFooterAlignment ??= AlignmentDirectional.centerEnd;

    Widget? drawer = _getNamedParam<Widget>(L, top_, 'drawer');

    DrawerCallback? onDrawerChanged = _getNamedParam<DrawerCallback>(L, top_, 'onDrawerChanged');

    Widget? endDrawer = _getNamedParam<Widget>(L, top_, 'endDrawer');

    DrawerCallback? onEndDrawerChanged = _getNamedParam<DrawerCallback>(L, top_, 'onEndDrawerChanged');

    Widget? bottomNavigationBar = _getNamedParam<Widget>(L, top_, 'bottomNavigationBar');

    Widget? bottomSheet = _getNamedParam<Widget>(L, top_, 'bottomSheet');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    bool? resizeToAvoidBottomInset = _getNamedParam<bool>(L, top_, 'resizeToAvoidBottomInset');

    bool? primary = _getNamedParam<bool>(L, top_, 'primary');
    primary ??= true;

    DragStartBehavior? drawerDragStartBehavior = _getNamedParam<DragStartBehavior>(L, top_, 'drawerDragStartBehavior');
    drawerDragStartBehavior ??= DragStartBehavior.start;

    bool? extendBody = _getNamedParam<bool>(L, top_, 'extendBody');
    extendBody ??= false;

    bool? extendBodyBehindAppBar = _getNamedParam<bool>(L, top_, 'extendBodyBehindAppBar');
    extendBodyBehindAppBar ??= false;

    Color? drawerScrimColor = _getNamedParam<Color>(L, top_, 'drawerScrimColor');

    double? drawerEdgeDragWidth = _getNamedParam<double>(L, top_, 'drawerEdgeDragWidth');

    bool? drawerEnableOpenDragGesture = _getNamedParam<bool>(L, top_, 'drawerEnableOpenDragGesture');
    drawerEnableOpenDragGesture ??= true;

    bool? endDrawerEnableOpenDragGesture = _getNamedParam<bool>(L, top_, 'endDrawerEnableOpenDragGesture');
    endDrawerEnableOpenDragGesture ??= true;

    String? restorationId = _getNamedParam<String>(L, top_, 'restorationId');

    var result_ = Scaffold(key: key, appBar: appBar, body: body, floatingActionButton: floatingActionButton, floatingActionButtonLocation: floatingActionButtonLocation, floatingActionButtonAnimator: floatingActionButtonAnimator, persistentFooterButtons: persistentFooterButtons, persistentFooterAlignment: persistentFooterAlignment, drawer: drawer, onDrawerChanged: onDrawerChanged, endDrawer: endDrawer, onEndDrawerChanged: onEndDrawerChanged, bottomNavigationBar: bottomNavigationBar, bottomSheet: bottomSheet, backgroundColor: backgroundColor, resizeToAvoidBottomInset: resizeToAvoidBottomInset, primary: primary, drawerDragStartBehavior: drawerDragStartBehavior, extendBody: extendBody, extendBodyBehindAppBar: extendBodyBehindAppBar, drawerScrimColor: drawerScrimColor, drawerEdgeDragWidth: drawerEdgeDragWidth, drawerEnableOpenDragGesture: drawerEnableOpenDragGesture, endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture, restorationId: restorationId);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _AppBar_AppBar(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? leading = _getNamedParam<Widget>(L, top_, 'leading');

    bool? automaticallyImplyLeading = _getNamedParam<bool>(L, top_, 'automaticallyImplyLeading');
    automaticallyImplyLeading ??= true;

    Widget? title = _getNamedParam<Widget>(L, top_, 'title');

    List<Widget>? actions = _getNamedListParam<Widget>(L, top_, 'actions');

    Widget? flexibleSpace = _getNamedParam<Widget>(L, top_, 'flexibleSpace');

    PreferredSizeWidget? bottom = _getNamedParam<PreferredSizeWidget>(L, top_, 'bottom');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    double? scrolledUnderElevation = _getNamedParam<double>(L, top_, 'scrolledUnderElevation');

    ScrollNotificationPredicate? notificationPredicate = _getNamedParam<ScrollNotificationPredicate>(L, top_, 'notificationPredicate');
    notificationPredicate ??= defaultScrollNotificationPredicate;

    Color? shadowColor = _getNamedParam<Color>(L, top_, 'shadowColor');

    Color? surfaceTintColor = _getNamedParam<Color>(L, top_, 'surfaceTintColor');

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Color? foregroundColor = _getNamedParam<Color>(L, top_, 'foregroundColor');

    IconThemeData? iconTheme = _getNamedParam<IconThemeData>(L, top_, 'iconTheme');

    IconThemeData? actionsIconTheme = _getNamedParam<IconThemeData>(L, top_, 'actionsIconTheme');

    bool? primary = _getNamedParam<bool>(L, top_, 'primary');
    primary ??= true;

    bool? centerTitle = _getNamedParam<bool>(L, top_, 'centerTitle');

    bool? excludeHeaderSemantics = _getNamedParam<bool>(L, top_, 'excludeHeaderSemantics');
    excludeHeaderSemantics ??= false;

    double? titleSpacing = _getNamedParam<double>(L, top_, 'titleSpacing');

    double? toolbarOpacity = _getNamedParam<double>(L, top_, 'toolbarOpacity');
    toolbarOpacity ??= 1.0;

    double? bottomOpacity = _getNamedParam<double>(L, top_, 'bottomOpacity');
    bottomOpacity ??= 1.0;

    double? toolbarHeight = _getNamedParam<double>(L, top_, 'toolbarHeight');

    double? leadingWidth = _getNamedParam<double>(L, top_, 'leadingWidth');

    TextStyle? toolbarTextStyle = _getNamedParam<TextStyle>(L, top_, 'toolbarTextStyle');

    TextStyle? titleTextStyle = _getNamedParam<TextStyle>(L, top_, 'titleTextStyle');

    SystemUiOverlayStyle? systemOverlayStyle = _getNamedParam<SystemUiOverlayStyle>(L, top_, 'systemOverlayStyle');

    var result_ = AppBar(key: key, leading: leading, automaticallyImplyLeading: automaticallyImplyLeading, title: title, actions: actions, flexibleSpace: flexibleSpace, bottom: bottom, elevation: elevation, scrolledUnderElevation: scrolledUnderElevation, notificationPredicate: notificationPredicate, shadowColor: shadowColor, surfaceTintColor: surfaceTintColor, shape: shape, backgroundColor: backgroundColor, foregroundColor: foregroundColor, iconTheme: iconTheme, actionsIconTheme: actionsIconTheme, primary: primary, centerTitle: centerTitle, excludeHeaderSemantics: excludeHeaderSemantics, titleSpacing: titleSpacing, toolbarOpacity: toolbarOpacity, bottomOpacity: bottomOpacity, toolbarHeight: toolbarHeight, leadingWidth: leadingWidth, toolbarTextStyle: toolbarTextStyle, titleTextStyle: titleTextStyle, systemOverlayStyle: systemOverlayStyle);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BottomNavigationBar_BottomNavigationBar(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    List<BottomNavigationBarItem>? items = _getNamedListParam<BottomNavigationBarItem>(L, top_, 'items')!;

    ValueChanged<int>? onTap = _getVoidCallbackT<int>(L, top_, 'onTap');

    int? currentIndex = _getNamedParam<int>(L, top_, 'currentIndex');
    currentIndex ??= 0;

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    BottomNavigationBarType? type = _getNamedParam<BottomNavigationBarType>(L, top_, 'type');

    Color? fixedColor = _getNamedParam<Color>(L, top_, 'fixedColor');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    double? iconSize = _getNamedParam<double>(L, top_, 'iconSize');
    iconSize ??= 24.0;

    Color? selectedItemColor = _getNamedParam<Color>(L, top_, 'selectedItemColor');

    Color? unselectedItemColor = _getNamedParam<Color>(L, top_, 'unselectedItemColor');

    IconThemeData? selectedIconTheme = _getNamedParam<IconThemeData>(L, top_, 'selectedIconTheme');

    IconThemeData? unselectedIconTheme = _getNamedParam<IconThemeData>(L, top_, 'unselectedIconTheme');

    double? selectedFontSize = _getNamedParam<double>(L, top_, 'selectedFontSize');
    selectedFontSize ??= 14.0;

    double? unselectedFontSize = _getNamedParam<double>(L, top_, 'unselectedFontSize');
    unselectedFontSize ??= 12.0;

    TextStyle? selectedLabelStyle = _getNamedParam<TextStyle>(L, top_, 'selectedLabelStyle');

    TextStyle? unselectedLabelStyle = _getNamedParam<TextStyle>(L, top_, 'unselectedLabelStyle');

    bool? showSelectedLabels = _getNamedParam<bool>(L, top_, 'showSelectedLabels');

    bool? showUnselectedLabels = _getNamedParam<bool>(L, top_, 'showUnselectedLabels');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    BottomNavigationBarLandscapeLayout? landscapeLayout = _getNamedParam<BottomNavigationBarLandscapeLayout>(L, top_, 'landscapeLayout');

    bool? useLegacyColorScheme = _getNamedParam<bool>(L, top_, 'useLegacyColorScheme');
    useLegacyColorScheme ??= true;

    var result_ = BottomNavigationBar(key: key, items: items, onTap: onTap, currentIndex: currentIndex, elevation: elevation, type: type, fixedColor: fixedColor, backgroundColor: backgroundColor, iconSize: iconSize, selectedItemColor: selectedItemColor, unselectedItemColor: unselectedItemColor, selectedIconTheme: selectedIconTheme, unselectedIconTheme: unselectedIconTheme, selectedFontSize: selectedFontSize, unselectedFontSize: unselectedFontSize, selectedLabelStyle: selectedLabelStyle, unselectedLabelStyle: unselectedLabelStyle, showSelectedLabels: showSelectedLabels, showUnselectedLabels: showUnselectedLabels, mouseCursor: mouseCursor, enableFeedback: enableFeedback, landscapeLayout: landscapeLayout, useLegacyColorScheme: useLegacyColorScheme);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _BottomNavigationBarItem_BottomNavigationBarItem(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Widget? icon = _getNamedParam<Widget>(L, top_, 'icon')!;

    String? label = _getNamedParam<String>(L, top_, 'label');

    Widget? activeIcon = _getNamedParam<Widget>(L, top_, 'activeIcon');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    String? tooltip = _getNamedParam<String>(L, top_, 'tooltip');

    var result_ = BottomNavigationBarItem(icon: icon, label: label, activeIcon: activeIcon, backgroundColor: backgroundColor, tooltip: tooltip);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ScaffoldMessenger_of(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BuildContext? context = _getParam<BuildContext>(L, 1)!;

    var result_ = ScaffoldMessenger.of(context);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ScaffoldMessengerState_showSnackBar(VoidPtr L) {
  try {

    ScaffoldMessengerState self = luaToObjectT<ScaffoldMessengerState>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    SnackBar? snackBar = _getParam<SnackBar>(L, 2)!;

    self.showSnackBar(snackBar);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ScaffoldMessengerState_showMaterialBanner(VoidPtr L) {
  try {

    ScaffoldMessengerState self = luaToObjectT<ScaffoldMessengerState>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    MaterialBanner? materialBanner = _getParam<MaterialBanner>(L, 2)!;

    self.showMaterialBanner(materialBanner);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SnackBar_SnackBar(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? content = _getNamedParam<Widget>(L, top_, 'content')!;

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    EdgeInsetsGeometry? margin = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'margin');

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    double? width = _getNamedParam<double>(L, top_, 'width');

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    SnackBarBehavior? behavior = _getNamedParam<SnackBarBehavior>(L, top_, 'behavior');

    SnackBarAction? action = _getNamedParam<SnackBarAction>(L, top_, 'action');

    Duration? duration = _getNamedParam<Duration>(L, top_, 'duration');
    duration ??= _snackBarDisplayDuration;

    Animation<double>? animation = _getNamedParam<Animation<double>>(L, top_, 'animation');

    VoidCallback? onVisible = _getVoidCallback(L, top_, 'onVisible');

    DismissDirection? dismissDirection = _getNamedParam<DismissDirection>(L, top_, 'dismissDirection');
    dismissDirection ??= DismissDirection.down;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.hardEdge;

    var result_ = SnackBar(key: key, content: content, backgroundColor: backgroundColor, elevation: elevation, margin: margin, padding: padding, width: width, shape: shape, behavior: behavior, action: action, duration: duration, animation: animation, onVisible: onVisible, dismissDirection: dismissDirection, clipBehavior: clipBehavior);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MaterialBanner_MaterialBanner(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? content = _getNamedParam<Widget>(L, top_, 'content')!;

    TextStyle? contentTextStyle = _getNamedParam<TextStyle>(L, top_, 'contentTextStyle');

    List<Widget>? actions = _getNamedListParam<Widget>(L, top_, 'actions')!;

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    Widget? leading = _getNamedParam<Widget>(L, top_, 'leading');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Color? surfaceTintColor = _getNamedParam<Color>(L, top_, 'surfaceTintColor');

    Color? shadowColor = _getNamedParam<Color>(L, top_, 'shadowColor');

    Color? dividerColor = _getNamedParam<Color>(L, top_, 'dividerColor');

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    EdgeInsetsGeometry? leadingPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'leadingPadding');

    bool? forceActionsBelow = _getNamedParam<bool>(L, top_, 'forceActionsBelow');
    forceActionsBelow ??= false;

    OverflowBarAlignment? overflowAlignment = _getNamedParam<OverflowBarAlignment>(L, top_, 'overflowAlignment');
    overflowAlignment ??= OverflowBarAlignment.end;

    Animation<double>? animation = _getNamedParam<Animation<double>>(L, top_, 'animation');

    VoidCallback? onVisible = _getVoidCallback(L, top_, 'onVisible');

    var result_ = MaterialBanner(key: key, content: content, contentTextStyle: contentTextStyle, actions: actions, elevation: elevation, leading: leading, backgroundColor: backgroundColor, surfaceTintColor: surfaceTintColor, shadowColor: shadowColor, dividerColor: dividerColor, padding: padding, leadingPadding: leadingPadding, forceActionsBelow: forceActionsBelow, overflowAlignment: overflowAlignment, animation: animation, onVisible: onVisible);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _PopupMenuButton_PopupMenuButton(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    PopupMenuItemBuilder<int>? itemBuilder = _getPopupMenuItemBuilder(L, top_, 'itemBuilder')!;

    int? initialValue = _getNamedParam<int>(L, top_, 'initialValue');

    VoidCallback? onOpened = _getVoidCallback(L, top_, 'onOpened');

    PopupMenuItemSelected<int>? onSelected = _getVoidCallbackT<int>(L, top_, 'onSelected');

    PopupMenuCanceled? onCanceled = _getNamedParam<PopupMenuCanceled>(L, top_, 'onCanceled');

    String? tooltip = _getNamedParam<String>(L, top_, 'tooltip');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    Color? shadowColor = _getNamedParam<Color>(L, top_, 'shadowColor');

    Color? surfaceTintColor = _getNamedParam<Color>(L, top_, 'surfaceTintColor');

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');
    padding ??= const EdgeInsets.all(8.0);

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    double? splashRadius = _getNamedParam<double>(L, top_, 'splashRadius');

    Widget? icon = _getNamedParam<Widget>(L, top_, 'icon');

    double? iconSize = _getNamedParam<double>(L, top_, 'iconSize');

    Offset? offset = _getNamedParam<Offset>(L, top_, 'offset');
    offset ??= Offset.zero;

    bool? enabled = _getNamedParam<bool>(L, top_, 'enabled');
    enabled ??= true;

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    BoxConstraints? constraints = _getNamedParam<BoxConstraints>(L, top_, 'constraints');

    PopupMenuPosition? position = _getNamedParam<PopupMenuPosition>(L, top_, 'position');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    var result_ = PopupMenuButton(key: key, itemBuilder: itemBuilder, initialValue: initialValue, onOpened: onOpened, onSelected: onSelected, onCanceled: onCanceled, tooltip: tooltip, elevation: elevation, shadowColor: shadowColor, surfaceTintColor: surfaceTintColor, padding: padding, child: child, splashRadius: splashRadius, icon: icon, iconSize: iconSize, offset: offset, enabled: enabled, shape: shape, color: color, enableFeedback: enableFeedback, constraints: constraints, position: position, clipBehavior: clipBehavior);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _PopupMenuDivider_PopupMenuDivider(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? height = _getNamedParam<double>(L, top_, 'height');
    height ??= _kMenuDividerHeight;

    var result_ = PopupMenuDivider(key: key, height: height);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _PopupMenuItem_PopupMenuItem(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    int? value = _getNamedParam<int>(L, top_, 'value');

    VoidCallback? onTap = _getVoidCallback(L, top_, 'onTap');

    bool? enabled = _getNamedParam<bool>(L, top_, 'enabled');
    enabled ??= true;

    double? height = _getNamedParam<double>(L, top_, 'height');
    height ??= kMinInteractiveDimension;

    EdgeInsets? padding = _getNamedParam<EdgeInsets>(L, top_, 'padding');

    TextStyle? textStyle = _getNamedParam<TextStyle>(L, top_, 'textStyle');

    MaterialStateProperty<TextStyle?>? labelTextStyle = _getNamedParam<MaterialStateProperty<TextStyle?>>(L, top_, 'labelTextStyle');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = PopupMenuItem(key: key, value: value, onTap: onTap, enabled: enabled, height: height, padding: padding, textStyle: textStyle, labelTextStyle: labelTextStyle, mouseCursor: mouseCursor, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _CheckedPopupMenuItem_CheckedPopupMenuItem(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    int? value = _getNamedParam<int>(L, top_, 'value');

    bool? checked = _getNamedParam<bool>(L, top_, 'checked');
    checked ??= false;

    bool? enabled = _getNamedParam<bool>(L, top_, 'enabled');
    enabled ??= true;

    EdgeInsets? padding = _getNamedParam<EdgeInsets>(L, top_, 'padding');

    double? height = _getNamedParam<double>(L, top_, 'height');
    height ??= kMinInteractiveDimension;

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = CheckedPopupMenuItem(key: key, value: value, checked: checked, enabled: enabled, padding: padding, height: height, mouseCursor: mouseCursor, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SafeArea_SafeArea(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    bool? left = _getNamedParam<bool>(L, top_, 'left');
    left ??= true;

    bool? top = _getNamedParam<bool>(L, top_, 'top');
    top ??= true;

    bool? right = _getNamedParam<bool>(L, top_, 'right');
    right ??= true;

    bool? bottom = _getNamedParam<bool>(L, top_, 'bottom');
    bottom ??= true;

    EdgeInsets? minimum = _getNamedParam<EdgeInsets>(L, top_, 'minimum');
    minimum ??= EdgeInsets.zero;

    bool? maintainBottomViewPadding = _getNamedParam<bool>(L, top_, 'maintainBottomViewPadding');
    maintainBottomViewPadding ??= false;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = SafeArea(key: key, left: left, top: top, right: right, bottom: bottom, minimum: minimum, maintainBottomViewPadding: maintainBottomViewPadding, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _RoundedRectangleBorder_RoundedRectangleBorder(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BorderSide? side = _getNamedParam<BorderSide>(L, top_, 'side');
    side ??= BorderSide.none;

    BorderRadiusGeometry? borderRadius = _getNamedParam<BorderRadiusGeometry>(L, top_, 'borderRadius');
    borderRadius ??= BorderRadius.zero;

    var result_ = RoundedRectangleBorder(side: side, borderRadius: borderRadius);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _DropdownMenuItem_DropdownMenuItem(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    VoidCallback? onTap = _getVoidCallback(L, top_, 'onTap');

    int? value = _getNamedParam<int>(L, top_, 'value');

    bool? enabled = _getNamedParam<bool>(L, top_, 'enabled');
    enabled ??= true;

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');
    alignment ??= AlignmentDirectional.centerStart;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = DropdownMenuItem(key: key, onTap: onTap, value: value, enabled: enabled, alignment: alignment, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _DropdownButton_DropdownButton(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    List<DropdownMenuItem<int>>? items = _getNamedListParam<DropdownMenuItem<int>>(L, top_, 'items');

    DropdownButtonBuilder? selectedItemBuilder = _getDropdownButtonBuilder(L, top_, 'selectedItemBuilder');

    int? value = _getNamedParam<int>(L, top_, 'value');

    Widget? hint = _getNamedParam<Widget>(L, top_, 'hint');

    Widget? disabledHint = _getNamedParam<Widget>(L, top_, 'disabledHint');

    ValueChanged<int?>? onChanged = _getVoidCallbackT2<int>(L, top_, 'onChanged');

    VoidCallback? onTap = _getVoidCallback(L, top_, 'onTap');

    int? elevation = _getNamedParam<int>(L, top_, 'elevation');
    elevation ??= 8;

    TextStyle? style = _getNamedParam<TextStyle>(L, top_, 'style');

    Widget? underline = _getNamedParam<Widget>(L, top_, 'underline');

    Widget? icon = _getNamedParam<Widget>(L, top_, 'icon');

    Color? iconDisabledColor = _getNamedParam<Color>(L, top_, 'iconDisabledColor');

    Color? iconEnabledColor = _getNamedParam<Color>(L, top_, 'iconEnabledColor');

    double? iconSize = _getNamedParam<double>(L, top_, 'iconSize');
    iconSize ??= 24.0;

    bool? isDense = _getNamedParam<bool>(L, top_, 'isDense');
    isDense ??= false;

    bool? isExpanded = _getNamedParam<bool>(L, top_, 'isExpanded');
    isExpanded ??= false;

    double? itemHeight = _getNamedParam<double>(L, top_, 'itemHeight');
    itemHeight ??= kMinInteractiveDimension;

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    Color? dropdownColor = _getNamedParam<Color>(L, top_, 'dropdownColor');

    double? menuMaxHeight = _getNamedParam<double>(L, top_, 'menuMaxHeight');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');
    alignment ??= AlignmentDirectional.centerStart;

    BorderRadius? borderRadius = _getNamedParam<BorderRadius>(L, top_, 'borderRadius');

    var result_ = DropdownButton(key: key, items: items, selectedItemBuilder: selectedItemBuilder, value: value, hint: hint, disabledHint: disabledHint, onChanged: onChanged, onTap: onTap, elevation: elevation, style: style, underline: underline, icon: icon, iconDisabledColor: iconDisabledColor, iconEnabledColor: iconEnabledColor, iconSize: iconSize, isDense: isDense, isExpanded: isExpanded, itemHeight: itemHeight, focusColor: focusColor, focusNode: focusNode, autofocus: autofocus, dropdownColor: dropdownColor, menuMaxHeight: menuMaxHeight, enableFeedback: enableFeedback, alignment: alignment, borderRadius: borderRadius);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ButtonSegment_ButtonSegment(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? value = _getNamedParam<int>(L, top_, 'value')!;

    Widget? icon = _getNamedParam<Widget>(L, top_, 'icon');

    Widget? label = _getNamedParam<Widget>(L, top_, 'label');

    bool? enabled = _getNamedParam<bool>(L, top_, 'enabled');
    enabled ??= true;

    var result_ = ButtonSegment(value: value, icon: icon, label: label, enabled: enabled);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SegmentedButton_SegmentedButton(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    List<ButtonSegment<int>>? segments = _getNamedListParam<ButtonSegment<int>>(L, top_, 'segments')!;

    Set<int>? selected = _getNamedSetParam<int>(L, top_, 'selected')!;

    ValueChanged<Set<int>>? onSelectionChanged = _getVoidCallbackT<Set<int>>(L, top_, 'onSelectionChanged');

    bool? multiSelectionEnabled = _getNamedParam<bool>(L, top_, 'multiSelectionEnabled');
    multiSelectionEnabled ??= false;

    bool? emptySelectionAllowed = _getNamedParam<bool>(L, top_, 'emptySelectionAllowed');
    emptySelectionAllowed ??= false;

    ButtonStyle? style = _getNamedParam<ButtonStyle>(L, top_, 'style');

    bool? showSelectedIcon = _getNamedParam<bool>(L, top_, 'showSelectedIcon');
    showSelectedIcon ??= true;

    Widget? selectedIcon = _getNamedParam<Widget>(L, top_, 'selectedIcon');

    var result_ = SegmentedButton(key: key, segments: segments, selected: selected, onSelectionChanged: onSelectionChanged, multiSelectionEnabled: multiSelectionEnabled, emptySelectionAllowed: emptySelectionAllowed, style: style, showSelectedIcon: showSelectedIcon, selectedIcon: selectedIcon);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Overlay_of(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BuildContext? context = _getParam<BuildContext>(L, 1)!;

    bool? rootOverlay = _getNamedParam<bool>(L, top_, 'rootOverlay');
    rootOverlay ??= false;

    Widget? debugRequiredFor = _getNamedParam<Widget>(L, top_, 'debugRequiredFor');

    var result_ = Overlay.of(context, rootOverlay: rootOverlay, debugRequiredFor: debugRequiredFor);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _OverlayState_insert(VoidPtr L) {
  try {

    OverlayState self = luaToObjectT<OverlayState>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    OverlayEntry? entry = _getParam<OverlayEntry>(L, 2)!;

    OverlayEntry? below = _getNamedParam<OverlayEntry>(L, top_, 'below');

    OverlayEntry? above = _getNamedParam<OverlayEntry>(L, top_, 'above');

    self.insert(entry, below: below, above: above);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _OverlayEntry_OverlayEntry(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    WidgetBuilder? builder = _getWidgetBuilder(L, top_, 'builder')!;

    bool? opaque = _getNamedParam<bool>(L, top_, 'opaque');
    opaque ??= false;

    bool? maintainState = _getNamedParam<bool>(L, top_, 'maintainState');
    maintainState ??= false;

    var result_ = OverlayEntry(builder: builder, opaque: opaque, maintainState: maintainState);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _OverlayEntry_markNeedsBuild(VoidPtr L) {
  try {

    OverlayEntry self = luaToObjectT<OverlayEntry>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    self.markNeedsBuild();

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _OverlayEntry_remove(VoidPtr L) {
  try {

    OverlayEntry self = luaToObjectT<OverlayEntry>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    self.remove();

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _RotatedBox_RotatedBox(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    int? quarterTurns = _getNamedParam<int>(L, top_, 'quarterTurns')!;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = RotatedBox(key: key, quarterTurns: quarterTurns, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Transform_Transform(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Matrix4? transform = _getNamedParam<Matrix4>(L, top_, 'transform')!;

    Offset? origin = _getNamedParam<Offset>(L, top_, 'origin');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');

    bool? transformHitTests = _getNamedParam<bool>(L, top_, 'transformHitTests');
    transformHitTests ??= true;

    FilterQuality? filterQuality = _getNamedParam<FilterQuality>(L, top_, 'filterQuality');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = Transform(key: key, transform: transform, origin: origin, alignment: alignment, transformHitTests: transformHitTests, filterQuality: filterQuality, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Transform_rotate(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? angle = _getNamedParam<double>(L, top_, 'angle')!;

    Offset? origin = _getNamedParam<Offset>(L, top_, 'origin');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');
    alignment ??= Alignment.center;

    bool? transformHitTests = _getNamedParam<bool>(L, top_, 'transformHitTests');
    transformHitTests ??= true;

    FilterQuality? filterQuality = _getNamedParam<FilterQuality>(L, top_, 'filterQuality');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = Transform.rotate(key: key, angle: angle, origin: origin, alignment: alignment, transformHitTests: transformHitTests, filterQuality: filterQuality, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Transform_scale(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? scale = _getNamedParam<double>(L, top_, 'scale');

    double? scaleX = _getNamedParam<double>(L, top_, 'scaleX');

    double? scaleY = _getNamedParam<double>(L, top_, 'scaleY');

    Offset? origin = _getNamedParam<Offset>(L, top_, 'origin');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');
    alignment ??= Alignment.center;

    bool? transformHitTests = _getNamedParam<bool>(L, top_, 'transformHitTests');
    transformHitTests ??= true;

    FilterQuality? filterQuality = _getNamedParam<FilterQuality>(L, top_, 'filterQuality');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = Transform.scale(key: key, scale: scale, scaleX: scaleX, scaleY: scaleY, origin: origin, alignment: alignment, transformHitTests: transformHitTests, filterQuality: filterQuality, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Transform_translate(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Offset? offset = _getNamedParam<Offset>(L, top_, 'offset')!;

    bool? transformHitTests = _getNamedParam<bool>(L, top_, 'transformHitTests');
    transformHitTests ??= true;

    FilterQuality? filterQuality = _getNamedParam<FilterQuality>(L, top_, 'filterQuality');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = Transform.translate(key: key, offset: offset, transformHitTests: transformHitTests, filterQuality: filterQuality, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _CircularProgressIndicator_CircularProgressIndicator(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? value = _getNamedParam<double>(L, top_, 'value');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Animation<Color?>? valueColor = _getNamedParam<Animation<Color?>>(L, top_, 'valueColor');

    double? strokeWidth = _getNamedParam<double>(L, top_, 'strokeWidth');
    strokeWidth ??= 4.0;

    String? semanticsLabel = _getNamedParam<String>(L, top_, 'semanticsLabel');

    String? semanticsValue = _getNamedParam<String>(L, top_, 'semanticsValue');

    var result_ = CircularProgressIndicator(key: key, value: value, backgroundColor: backgroundColor, color: color, valueColor: valueColor, strokeWidth: strokeWidth, semanticsLabel: semanticsLabel, semanticsValue: semanticsValue);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _CircularProgressIndicator_adaptive(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? value = _getNamedParam<double>(L, top_, 'value');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Animation<Color?>? valueColor = _getNamedParam<Animation<Color?>>(L, top_, 'valueColor');

    double? strokeWidth = _getNamedParam<double>(L, top_, 'strokeWidth');
    strokeWidth ??= 4.0;

    String? semanticsLabel = _getNamedParam<String>(L, top_, 'semanticsLabel');

    String? semanticsValue = _getNamedParam<String>(L, top_, 'semanticsValue');

    var result_ = CircularProgressIndicator.adaptive(key: key, value: value, backgroundColor: backgroundColor, valueColor: valueColor, strokeWidth: strokeWidth, semanticsLabel: semanticsLabel, semanticsValue: semanticsValue);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _LinearProgressIndicator_LinearProgressIndicator(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? value = _getNamedParam<double>(L, top_, 'value');

    Color? backgroundColor = _getNamedParam<Color>(L, top_, 'backgroundColor');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Animation<Color?>? valueColor = _getNamedParam<Animation<Color?>>(L, top_, 'valueColor');

    double? minHeight = _getNamedParam<double>(L, top_, 'minHeight');

    String? semanticsLabel = _getNamedParam<String>(L, top_, 'semanticsLabel');

    String? semanticsValue = _getNamedParam<String>(L, top_, 'semanticsValue');

    var result_ = LinearProgressIndicator(key: key, value: value, backgroundColor: backgroundColor, color: color, valueColor: valueColor, minHeight: minHeight, semanticsLabel: semanticsLabel, semanticsValue: semanticsValue);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _FittedBox_FittedBox(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    BoxFit? fit = _getNamedParam<BoxFit>(L, top_, 'fit');
    fit ??= BoxFit.contain;

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');
    alignment ??= Alignment.center;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.none;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = FittedBox(key: key, fit: fit, alignment: alignment, clipBehavior: clipBehavior, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SchedulerBinding_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #instance: return luaPush(L, SchedulerBinding.instance);
  }

  lua_pushnil(L);
  return 1;
}

int _SchedulerBinding_scheduleFrame(VoidPtr L) {
  try {

    SchedulerBinding self = luaToObjectT<SchedulerBinding>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    self.scheduleFrame();

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SchedulerBinding_scheduleForcedFrame(VoidPtr L) {
  try {

    SchedulerBinding self = luaToObjectT<SchedulerBinding>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    self.scheduleForcedFrame();

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SchedulerBinding_scheduleFrameCallback(VoidPtr L) {
  try {

    SchedulerBinding self = luaToObjectT<SchedulerBinding>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    FrameCallback? callback = _getVoidCallbackT<Duration>(L, 2, null)!;

    bool? rescheduling = _getNamedParam<bool>(L, top_, 'rescheduling');
    rescheduling ??= false;

    var result_ = self.scheduleFrameCallback(callback, rescheduling: rescheduling);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SchedulerBinding_addPostFrameCallback(VoidPtr L) {
  try {

    SchedulerBinding self = luaToObjectT<SchedulerBinding>(L, 1)!;

    int top_ = lua_gettop(L); assert(top_ >= 0);

    FrameCallback? callback = _getVoidCallbackT<Duration>(L, 2, null)!;

    self.addPostFrameCallback(callback);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Card_Card(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Color? shadowColor = _getNamedParam<Color>(L, top_, 'shadowColor');

    Color? surfaceTintColor = _getNamedParam<Color>(L, top_, 'surfaceTintColor');

    double? elevation = _getNamedParam<double>(L, top_, 'elevation');

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    bool? borderOnForeground = _getNamedParam<bool>(L, top_, 'borderOnForeground');
    borderOnForeground ??= true;

    EdgeInsetsGeometry? margin = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'margin');

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    bool? semanticContainer = _getNamedParam<bool>(L, top_, 'semanticContainer');
    semanticContainer ??= true;

    var result_ = Card(key: key, color: color, shadowColor: shadowColor, surfaceTintColor: surfaceTintColor, elevation: elevation, shape: shape, borderOnForeground: borderOnForeground, margin: margin, clipBehavior: clipBehavior, child: child, semanticContainer: semanticContainer);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MaterialStatePropertyT_resolveColor(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    MaterialPropertyResolver<Color>? callback = _getMaterialPropertyResolverT<Color>(L, 1, null)!;

    var result_ = MaterialStatePropertyT.resolveColor(callback);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MaterialStatePropertyT_resolveBorderSide(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    MaterialPropertyResolver<BorderSide>? callback = _getMaterialPropertyResolverT<BorderSide>(L, 1, null)!;

    var result_ = MaterialStatePropertyT.resolveBorderSide(callback);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MaterialStateColor_resolveWith(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    MaterialPropertyResolver<Color>? callback = _getMaterialPropertyResolverT<Color>(L, 1, null)!;

    var result_ = MaterialStateColor.resolveWith(callback);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ButtonStyle_ButtonStyle(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    MaterialStateProperty<TextStyle?>? textStyle = _getNamedParam<MaterialStateProperty<TextStyle?>>(L, top_, 'textStyle');

    MaterialStateProperty<Color?>? backgroundColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'backgroundColor');

    MaterialStateProperty<Color?>? foregroundColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'foregroundColor');

    MaterialStateProperty<Color?>? overlayColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'overlayColor');

    MaterialStateProperty<Color?>? shadowColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'shadowColor');

    MaterialStateProperty<Color?>? surfaceTintColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'surfaceTintColor');

    MaterialStateProperty<double?>? elevation = _getNamedParam<MaterialStateProperty<double?>>(L, top_, 'elevation');

    MaterialStateProperty<EdgeInsetsGeometry?>? padding = _getNamedParam<MaterialStateProperty<EdgeInsetsGeometry?>>(L, top_, 'padding');

    MaterialStateProperty<Size?>? minimumSize = _getNamedParam<MaterialStateProperty<Size?>>(L, top_, 'minimumSize');

    MaterialStateProperty<Size?>? fixedSize = _getNamedParam<MaterialStateProperty<Size?>>(L, top_, 'fixedSize');

    MaterialStateProperty<Size?>? maximumSize = _getNamedParam<MaterialStateProperty<Size?>>(L, top_, 'maximumSize');

    MaterialStateProperty<Color?>? iconColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'iconColor');

    MaterialStateProperty<double?>? iconSize = _getNamedParam<MaterialStateProperty<double?>>(L, top_, 'iconSize');

    MaterialStateProperty<BorderSide?>? side = _getNamedParam<MaterialStateProperty<BorderSide?>>(L, top_, 'side');

    MaterialStateProperty<OutlinedBorder?>? shape = _getNamedParam<MaterialStateProperty<OutlinedBorder?>>(L, top_, 'shape');

    MaterialStateProperty<MouseCursor?>? mouseCursor = _getNamedParam<MaterialStateProperty<MouseCursor?>>(L, top_, 'mouseCursor');

    VisualDensity? visualDensity = _getNamedParam<VisualDensity>(L, top_, 'visualDensity');

    MaterialTapTargetSize? tapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'tapTargetSize');

    Duration? animationDuration = _getNamedParam<Duration>(L, top_, 'animationDuration');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');

    InteractiveInkFeatureFactory? splashFactory = _getNamedParam<InteractiveInkFeatureFactory>(L, top_, 'splashFactory');

    var result_ = ButtonStyle(textStyle: textStyle, backgroundColor: backgroundColor, foregroundColor: foregroundColor, overlayColor: overlayColor, shadowColor: shadowColor, surfaceTintColor: surfaceTintColor, elevation: elevation, padding: padding, minimumSize: minimumSize, fixedSize: fixedSize, maximumSize: maximumSize, iconColor: iconColor, iconSize: iconSize, side: side, shape: shape, mouseCursor: mouseCursor, visualDensity: visualDensity, tapTargetSize: tapTargetSize, animationDuration: animationDuration, enableFeedback: enableFeedback, alignment: alignment, splashFactory: splashFactory);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _ToggleButtons_ToggleButtons(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    List<Widget>? children = _getNamedListParam<Widget>(L, top_, 'children')!;

    List<bool>? isSelected = _getNamedListParam<bool>(L, top_, 'isSelected')!;

    IntValueChanged? onPressed = _getVoidCallbackT<int>(L, top_, 'onPressed');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    MaterialTapTargetSize? tapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'tapTargetSize');

    TextStyle? textStyle = _getNamedParam<TextStyle>(L, top_, 'textStyle');

    BoxConstraints? constraints = _getNamedParam<BoxConstraints>(L, top_, 'constraints');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Color? selectedColor = _getNamedParam<Color>(L, top_, 'selectedColor');

    Color? disabledColor = _getNamedParam<Color>(L, top_, 'disabledColor');

    Color? fillColor = _getNamedParam<Color>(L, top_, 'fillColor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? highlightColor = _getNamedParam<Color>(L, top_, 'highlightColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    Color? splashColor = _getNamedParam<Color>(L, top_, 'splashColor');

    List<FocusNode>? focusNodes = _getNamedListParam<FocusNode>(L, top_, 'focusNodes');

    bool? renderBorder = _getNamedParam<bool>(L, top_, 'renderBorder');
    renderBorder ??= true;

    Color? borderColor = _getNamedParam<Color>(L, top_, 'borderColor');

    Color? selectedBorderColor = _getNamedParam<Color>(L, top_, 'selectedBorderColor');

    Color? disabledBorderColor = _getNamedParam<Color>(L, top_, 'disabledBorderColor');

    BorderRadius? borderRadius = _getNamedParam<BorderRadius>(L, top_, 'borderRadius');

    double? borderWidth = _getNamedParam<double>(L, top_, 'borderWidth');

    Axis? direction = _getNamedParam<Axis>(L, top_, 'direction');
    direction ??= Axis.horizontal;

    VerticalDirection? verticalDirection = _getNamedParam<VerticalDirection>(L, top_, 'verticalDirection');
    verticalDirection ??= VerticalDirection.down;

    var result_ = ToggleButtons(key: key, children: children, isSelected: isSelected, onPressed: onPressed, mouseCursor: mouseCursor, tapTargetSize: tapTargetSize, textStyle: textStyle, constraints: constraints, color: color, selectedColor: selectedColor, disabledColor: disabledColor, fillColor: fillColor, focusColor: focusColor, highlightColor: highlightColor, hoverColor: hoverColor, splashColor: splashColor, focusNodes: focusNodes, renderBorder: renderBorder, borderColor: borderColor, selectedBorderColor: selectedBorderColor, disabledBorderColor: disabledBorderColor, borderRadius: borderRadius, borderWidth: borderWidth, direction: direction, verticalDirection: verticalDirection);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Directionality_Directionality(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    TextDirection? textDirection = _getNamedParam<TextDirection>(L, top_, 'textDirection')!;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    var result_ = Directionality(key: key, textDirection: textDirection, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _IntrinsicHeight_IntrinsicHeight(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = IntrinsicHeight(key: key, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _IntrinsicWidth_IntrinsicWidth(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? stepWidth = _getNamedParam<double>(L, top_, 'stepWidth');

    double? stepHeight = _getNamedParam<double>(L, top_, 'stepHeight');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child');

    var result_ = IntrinsicWidth(key: key, stepWidth: stepWidth, stepHeight: stepHeight, child: child);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Switch_Switch(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    bool? value = _getNamedParam<bool>(L, top_, 'value')!;

    ValueChanged<bool>? onChanged = _getVoidCallbackT<bool>(L, top_, 'onChanged');

    Color? activeColor = _getNamedParam<Color>(L, top_, 'activeColor');

    Color? activeTrackColor = _getNamedParam<Color>(L, top_, 'activeTrackColor');

    Color? inactiveThumbColor = _getNamedParam<Color>(L, top_, 'inactiveThumbColor');

    Color? inactiveTrackColor = _getNamedParam<Color>(L, top_, 'inactiveTrackColor');

    ImageProvider<Object>? activeThumbImage = _getNamedParam<ImageProvider<Object>>(L, top_, 'activeThumbImage');

    ImageErrorListener? onActiveThumbImageError = _getNamedParam<ImageErrorListener>(L, top_, 'onActiveThumbImageError');

    ImageProvider<Object>? inactiveThumbImage = _getNamedParam<ImageProvider<Object>>(L, top_, 'inactiveThumbImage');

    ImageErrorListener? onInactiveThumbImageError = _getNamedParam<ImageErrorListener>(L, top_, 'onInactiveThumbImageError');

    MaterialStateProperty<Color?>? thumbColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'thumbColor');

    MaterialStateProperty<Color?>? trackColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'trackColor');

    MaterialStateProperty<Icon?>? thumbIcon = _getNamedParam<MaterialStateProperty<Icon?>>(L, top_, 'thumbIcon');

    MaterialTapTargetSize? materialTapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'materialTapTargetSize');

    DragStartBehavior? dragStartBehavior = _getNamedParam<DragStartBehavior>(L, top_, 'dragStartBehavior');
    dragStartBehavior ??= DragStartBehavior.start;

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    MaterialStateProperty<Color?>? overlayColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'overlayColor');

    double? splashRadius = _getNamedParam<double>(L, top_, 'splashRadius');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    var result_ = Switch(key: key, value: value, onChanged: onChanged, activeColor: activeColor, activeTrackColor: activeTrackColor, inactiveThumbColor: inactiveThumbColor, inactiveTrackColor: inactiveTrackColor, activeThumbImage: activeThumbImage, onActiveThumbImageError: onActiveThumbImageError, inactiveThumbImage: inactiveThumbImage, onInactiveThumbImageError: onInactiveThumbImageError, thumbColor: thumbColor, trackColor: trackColor, thumbIcon: thumbIcon, materialTapTargetSize: materialTapTargetSize, dragStartBehavior: dragStartBehavior, mouseCursor: mouseCursor, focusColor: focusColor, hoverColor: hoverColor, overlayColor: overlayColor, splashRadius: splashRadius, focusNode: focusNode, autofocus: autofocus);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Switch_adaptive(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    bool? value = _getNamedParam<bool>(L, top_, 'value')!;

    ValueChanged<bool>? onChanged = _getVoidCallbackT<bool>(L, top_, 'onChanged');

    Color? activeColor = _getNamedParam<Color>(L, top_, 'activeColor');

    Color? activeTrackColor = _getNamedParam<Color>(L, top_, 'activeTrackColor');

    Color? inactiveThumbColor = _getNamedParam<Color>(L, top_, 'inactiveThumbColor');

    Color? inactiveTrackColor = _getNamedParam<Color>(L, top_, 'inactiveTrackColor');

    ImageProvider<Object>? activeThumbImage = _getNamedParam<ImageProvider<Object>>(L, top_, 'activeThumbImage');

    ImageErrorListener? onActiveThumbImageError = _getNamedParam<ImageErrorListener>(L, top_, 'onActiveThumbImageError');

    ImageProvider<Object>? inactiveThumbImage = _getNamedParam<ImageProvider<Object>>(L, top_, 'inactiveThumbImage');

    ImageErrorListener? onInactiveThumbImageError = _getNamedParam<ImageErrorListener>(L, top_, 'onInactiveThumbImageError');

    MaterialTapTargetSize? materialTapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'materialTapTargetSize');

    MaterialStateProperty<Color?>? thumbColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'thumbColor');

    MaterialStateProperty<Color?>? trackColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'trackColor');

    MaterialStateProperty<Icon?>? thumbIcon = _getNamedParam<MaterialStateProperty<Icon?>>(L, top_, 'thumbIcon');

    DragStartBehavior? dragStartBehavior = _getNamedParam<DragStartBehavior>(L, top_, 'dragStartBehavior');
    dragStartBehavior ??= DragStartBehavior.start;

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    MaterialStateProperty<Color?>? overlayColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'overlayColor');

    double? splashRadius = _getNamedParam<double>(L, top_, 'splashRadius');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    var result_ = Switch.adaptive(key: key, value: value, onChanged: onChanged, activeColor: activeColor, activeTrackColor: activeTrackColor, inactiveThumbColor: inactiveThumbColor, inactiveTrackColor: inactiveTrackColor, activeThumbImage: activeThumbImage, onActiveThumbImageError: onActiveThumbImageError, inactiveThumbImage: inactiveThumbImage, onInactiveThumbImageError: onInactiveThumbImageError, materialTapTargetSize: materialTapTargetSize, thumbColor: thumbColor, trackColor: trackColor, thumbIcon: thumbIcon, dragStartBehavior: dragStartBehavior, mouseCursor: mouseCursor, focusColor: focusColor, hoverColor: hoverColor, overlayColor: overlayColor, splashRadius: splashRadius, focusNode: focusNode, autofocus: autofocus);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SwitchListTile_SwitchListTile(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    bool? value = _getNamedParam<bool>(L, top_, 'value')!;

    ValueChanged<bool>? onChanged = _getVoidCallbackT<bool>(L, top_, 'onChanged');

    Color? activeColor = _getNamedParam<Color>(L, top_, 'activeColor');

    Color? activeTrackColor = _getNamedParam<Color>(L, top_, 'activeTrackColor');

    Color? inactiveThumbColor = _getNamedParam<Color>(L, top_, 'inactiveThumbColor');

    Color? inactiveTrackColor = _getNamedParam<Color>(L, top_, 'inactiveTrackColor');

    ImageProvider<Object>? activeThumbImage = _getNamedParam<ImageProvider<Object>>(L, top_, 'activeThumbImage');

    ImageProvider<Object>? inactiveThumbImage = _getNamedParam<ImageProvider<Object>>(L, top_, 'inactiveThumbImage');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    Color? tileColor = _getNamedParam<Color>(L, top_, 'tileColor');

    Widget? title = _getNamedParam<Widget>(L, top_, 'title');

    Widget? subtitle = _getNamedParam<Widget>(L, top_, 'subtitle');

    bool? isThreeLine = _getNamedParam<bool>(L, top_, 'isThreeLine');
    isThreeLine ??= false;

    bool? dense = _getNamedParam<bool>(L, top_, 'dense');

    EdgeInsetsGeometry? contentPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'contentPadding');

    Widget? secondary = _getNamedParam<Widget>(L, top_, 'secondary');

    bool? selected = _getNamedParam<bool>(L, top_, 'selected');
    selected ??= false;

    ListTileControlAffinity? controlAffinity = _getNamedParam<ListTileControlAffinity>(L, top_, 'controlAffinity');
    controlAffinity ??= ListTileControlAffinity.platform;

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    Color? selectedTileColor = _getNamedParam<Color>(L, top_, 'selectedTileColor');

    VisualDensity? visualDensity = _getNamedParam<VisualDensity>(L, top_, 'visualDensity');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    var result_ = SwitchListTile(key: key, value: value, onChanged: onChanged, activeColor: activeColor, activeTrackColor: activeTrackColor, inactiveThumbColor: inactiveThumbColor, inactiveTrackColor: inactiveTrackColor, activeThumbImage: activeThumbImage, inactiveThumbImage: inactiveThumbImage, focusNode: focusNode, autofocus: autofocus, tileColor: tileColor, title: title, subtitle: subtitle, isThreeLine: isThreeLine, dense: dense, contentPadding: contentPadding, secondary: secondary, selected: selected, controlAffinity: controlAffinity, shape: shape, selectedTileColor: selectedTileColor, visualDensity: visualDensity, enableFeedback: enableFeedback, hoverColor: hoverColor);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _SwitchListTile_adaptive(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    bool? value = _getNamedParam<bool>(L, top_, 'value')!;

    ValueChanged<bool>? onChanged = _getVoidCallbackT<bool>(L, top_, 'onChanged');

    Color? activeColor = _getNamedParam<Color>(L, top_, 'activeColor');

    Color? activeTrackColor = _getNamedParam<Color>(L, top_, 'activeTrackColor');

    Color? inactiveThumbColor = _getNamedParam<Color>(L, top_, 'inactiveThumbColor');

    Color? inactiveTrackColor = _getNamedParam<Color>(L, top_, 'inactiveTrackColor');

    ImageProvider<Object>? activeThumbImage = _getNamedParam<ImageProvider<Object>>(L, top_, 'activeThumbImage');

    ImageProvider<Object>? inactiveThumbImage = _getNamedParam<ImageProvider<Object>>(L, top_, 'inactiveThumbImage');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    Color? tileColor = _getNamedParam<Color>(L, top_, 'tileColor');

    Widget? title = _getNamedParam<Widget>(L, top_, 'title');

    Widget? subtitle = _getNamedParam<Widget>(L, top_, 'subtitle');

    bool? isThreeLine = _getNamedParam<bool>(L, top_, 'isThreeLine');
    isThreeLine ??= false;

    bool? dense = _getNamedParam<bool>(L, top_, 'dense');

    EdgeInsetsGeometry? contentPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'contentPadding');

    Widget? secondary = _getNamedParam<Widget>(L, top_, 'secondary');

    bool? selected = _getNamedParam<bool>(L, top_, 'selected');
    selected ??= false;

    ListTileControlAffinity? controlAffinity = _getNamedParam<ListTileControlAffinity>(L, top_, 'controlAffinity');
    controlAffinity ??= ListTileControlAffinity.platform;

    ShapeBorder? shape = _getNamedParam<ShapeBorder>(L, top_, 'shape');

    Color? selectedTileColor = _getNamedParam<Color>(L, top_, 'selectedTileColor');

    VisualDensity? visualDensity = _getNamedParam<VisualDensity>(L, top_, 'visualDensity');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    var result_ = SwitchListTile.adaptive(key: key, value: value, onChanged: onChanged, activeColor: activeColor, activeTrackColor: activeTrackColor, inactiveThumbColor: inactiveThumbColor, inactiveTrackColor: inactiveTrackColor, activeThumbImage: activeThumbImage, inactiveThumbImage: inactiveThumbImage, focusNode: focusNode, autofocus: autofocus, tileColor: tileColor, title: title, subtitle: subtitle, isThreeLine: isThreeLine, dense: dense, contentPadding: contentPadding, secondary: secondary, selected: selected, controlAffinity: controlAffinity, shape: shape, selectedTileColor: selectedTileColor, visualDensity: visualDensity, enableFeedback: enableFeedback, hoverColor: hoverColor);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _VisualDensity_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #standard: return luaPush(L, VisualDensity.standard);
    case #comfortable: return luaPush(L, VisualDensity.comfortable);
    case #compact: return luaPush(L, VisualDensity.compact);
  }

  lua_pushnil(L);
  return 1;
}

int _VisualDensity_VisualDensity(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    double? horizontal = _getNamedParam<double>(L, top_, 'horizontal');
    horizontal ??= 0.0;

    double? vertical = _getNamedParam<double>(L, top_, 'vertical');
    vertical ??= 0.0;

    var result_ = VisualDensity(horizontal: horizontal, vertical: vertical);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _VisualDensity_defaultDensityForPlatform(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    TargetPlatform? platform = _getParam<TargetPlatform>(L, 1)!;

    var result_ = VisualDensity.defaultDensityForPlatform(platform);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextSelection_TextSelection(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? baseOffset = _getNamedParam<int>(L, top_, 'baseOffset')!;

    int? extentOffset = _getNamedParam<int>(L, top_, 'extentOffset')!;

    TextAffinity? affinity = _getNamedParam<TextAffinity>(L, top_, 'affinity');
    affinity ??= TextAffinity.downstream;

    bool? isDirectional = _getNamedParam<bool>(L, top_, 'isDirectional');
    isDirectional ??= false;

    var result_ = TextSelection(baseOffset: baseOffset, extentOffset: extentOffset, affinity: affinity, isDirectional: isDirectional);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextSelection_collapsed(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? offset = _getNamedParam<int>(L, top_, 'offset')!;

    TextAffinity? affinity = _getNamedParam<TextAffinity>(L, top_, 'affinity');
    affinity ??= TextAffinity.downstream;

    var result_ = TextSelection.collapsed(offset: offset, affinity: affinity);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextSelection_fromPosition(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    TextPosition? position = _getParam<TextPosition>(L, 1)!;

    var result_ = TextSelection.fromPosition(position);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextPosition_TextPosition(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? offset = _getNamedParam<int>(L, top_, 'offset')!;

    TextAffinity? affinity = _getNamedParam<TextAffinity>(L, top_, 'affinity');
    affinity ??= TextAffinity.downstream;

    var result_ = TextPosition(offset: offset, affinity: affinity);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextEditingValue_TextEditingValue(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? text = _getNamedParam<String>(L, top_, 'text');
    text ??= '';

    TextSelection? selection = _getNamedParam<TextSelection>(L, top_, 'selection');
    selection ??= const TextSelection.collapsed(offset: -1);

    TextRange? composing = _getNamedParam<TextRange>(L, top_, 'composing');
    composing ??= TextRange.empty;

    var result_ = TextEditingValue(text: text, selection: selection, composing: composing);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TextRange_TextRange(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? start = _getNamedParam<int>(L, top_, 'start')!;

    int? end = _getNamedParam<int>(L, top_, 'end')!;

    var result_ = TextRange(start: start, end: end);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Radio_Radio(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    int? value = _getNamedParam<int>(L, top_, 'value')!;

    int? groupValue = _getNamedParam<int>(L, top_, 'groupValue');

    ValueChanged<int?>? onChanged = _getVoidCallbackT2<int>(L, top_, 'onChanged');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    bool? toggleable = _getNamedParam<bool>(L, top_, 'toggleable');
    toggleable ??= false;

    Color? activeColor = _getNamedParam<Color>(L, top_, 'activeColor');

    MaterialStateProperty<Color?>? fillColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'fillColor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    MaterialStateProperty<Color?>? overlayColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'overlayColor');

    double? splashRadius = _getNamedParam<double>(L, top_, 'splashRadius');

    MaterialTapTargetSize? materialTapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'materialTapTargetSize');

    VisualDensity? visualDensity = _getNamedParam<VisualDensity>(L, top_, 'visualDensity');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    var result_ = Radio(key: key, value: value, groupValue: groupValue, onChanged: onChanged, mouseCursor: mouseCursor, toggleable: toggleable, activeColor: activeColor, fillColor: fillColor, focusColor: focusColor, hoverColor: hoverColor, overlayColor: overlayColor, splashRadius: splashRadius, materialTapTargetSize: materialTapTargetSize, visualDensity: visualDensity, focusNode: focusNode, autofocus: autofocus);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Radio_adaptive(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    int? value = _getNamedParam<int>(L, top_, 'value')!;

    int? groupValue = _getNamedParam<int>(L, top_, 'groupValue');

    ValueChanged<int?>? onChanged = _getVoidCallbackT2<int>(L, top_, 'onChanged');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    bool? toggleable = _getNamedParam<bool>(L, top_, 'toggleable');
    toggleable ??= false;

    Color? activeColor = _getNamedParam<Color>(L, top_, 'activeColor');

    MaterialStateProperty<Color?>? fillColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'fillColor');

    Color? focusColor = _getNamedParam<Color>(L, top_, 'focusColor');

    Color? hoverColor = _getNamedParam<Color>(L, top_, 'hoverColor');

    MaterialStateProperty<Color?>? overlayColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'overlayColor');

    double? splashRadius = _getNamedParam<double>(L, top_, 'splashRadius');

    MaterialTapTargetSize? materialTapTargetSize = _getNamedParam<MaterialTapTargetSize>(L, top_, 'materialTapTargetSize');

    VisualDensity? visualDensity = _getNamedParam<VisualDensity>(L, top_, 'visualDensity');

    FocusNode? focusNode = _getNamedParam<FocusNode>(L, top_, 'focusNode');

    bool? autofocus = _getNamedParam<bool>(L, top_, 'autofocus');
    autofocus ??= false;

    var result_ = Radio.adaptive(key: key, value: value, groupValue: groupValue, onChanged: onChanged, mouseCursor: mouseCursor, toggleable: toggleable, activeColor: activeColor, fillColor: fillColor, focusColor: focusColor, hoverColor: hoverColor, overlayColor: overlayColor, splashRadius: splashRadius, materialTapTargetSize: materialTapTargetSize, visualDensity: visualDensity, focusNode: focusNode, autofocus: autofocus);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Image_Image(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    ImageProvider<Object>? image = _getNamedParam<ImageProvider<Object>>(L, top_, 'image')!;

    ImageFrameBuilder? frameBuilder = _getNamedParam<ImageFrameBuilder>(L, top_, 'frameBuilder');

    ImageLoadingBuilder? loadingBuilder = _getNamedParam<ImageLoadingBuilder>(L, top_, 'loadingBuilder');

    ImageErrorWidgetBuilder? errorBuilder = _getNamedParam<ImageErrorWidgetBuilder>(L, top_, 'errorBuilder');

    String? semanticLabel = _getNamedParam<String>(L, top_, 'semanticLabel');

    bool? excludeFromSemantics = _getNamedParam<bool>(L, top_, 'excludeFromSemantics');
    excludeFromSemantics ??= false;

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? height = _getNamedParam<double>(L, top_, 'height');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Animation<double>? opacity = _getNamedParam<Animation<double>>(L, top_, 'opacity');

    BlendMode? colorBlendMode = _getNamedParam<BlendMode>(L, top_, 'colorBlendMode');

    BoxFit? fit = _getNamedParam<BoxFit>(L, top_, 'fit');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');
    alignment ??= Alignment.center;

    ImageRepeat? repeat = _getNamedParam<ImageRepeat>(L, top_, 'repeat');
    repeat ??= ImageRepeat.noRepeat;

    Rect? centerSlice = _getNamedParam<Rect>(L, top_, 'centerSlice');

    bool? matchTextDirection = _getNamedParam<bool>(L, top_, 'matchTextDirection');
    matchTextDirection ??= false;

    bool? gaplessPlayback = _getNamedParam<bool>(L, top_, 'gaplessPlayback');
    gaplessPlayback ??= false;

    bool? isAntiAlias = _getNamedParam<bool>(L, top_, 'isAntiAlias');
    isAntiAlias ??= false;

    FilterQuality? filterQuality = _getNamedParam<FilterQuality>(L, top_, 'filterQuality');
    filterQuality ??= FilterQuality.low;

    var result_ = Image(key: key, image: image, frameBuilder: frameBuilder, loadingBuilder: loadingBuilder, errorBuilder: errorBuilder, semanticLabel: semanticLabel, excludeFromSemantics: excludeFromSemantics, width: width, height: height, color: color, opacity: opacity, colorBlendMode: colorBlendMode, fit: fit, alignment: alignment, repeat: repeat, centerSlice: centerSlice, matchTextDirection: matchTextDirection, gaplessPlayback: gaplessPlayback, isAntiAlias: isAntiAlias, filterQuality: filterQuality);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Image_asset(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? name = _getParam<String>(L, 1)!;

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    AssetBundle? bundle = _getNamedParam<AssetBundle>(L, top_, 'bundle');

    ImageFrameBuilder? frameBuilder = _getNamedParam<ImageFrameBuilder>(L, top_, 'frameBuilder');

    ImageErrorWidgetBuilder? errorBuilder = _getNamedParam<ImageErrorWidgetBuilder>(L, top_, 'errorBuilder');

    String? semanticLabel = _getNamedParam<String>(L, top_, 'semanticLabel');

    bool? excludeFromSemantics = _getNamedParam<bool>(L, top_, 'excludeFromSemantics');
    excludeFromSemantics ??= false;

    double? scale = _getNamedParam<double>(L, top_, 'scale');

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? height = _getNamedParam<double>(L, top_, 'height');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Animation<double>? opacity = _getNamedParam<Animation<double>>(L, top_, 'opacity');

    BlendMode? colorBlendMode = _getNamedParam<BlendMode>(L, top_, 'colorBlendMode');

    BoxFit? fit = _getNamedParam<BoxFit>(L, top_, 'fit');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');
    alignment ??= Alignment.center;

    ImageRepeat? repeat = _getNamedParam<ImageRepeat>(L, top_, 'repeat');
    repeat ??= ImageRepeat.noRepeat;

    Rect? centerSlice = _getNamedParam<Rect>(L, top_, 'centerSlice');

    bool? matchTextDirection = _getNamedParam<bool>(L, top_, 'matchTextDirection');
    matchTextDirection ??= false;

    bool? gaplessPlayback = _getNamedParam<bool>(L, top_, 'gaplessPlayback');
    gaplessPlayback ??= false;

    bool? isAntiAlias = _getNamedParam<bool>(L, top_, 'isAntiAlias');
    isAntiAlias ??= false;

    String? package = _getNamedParam<String>(L, top_, 'package');

    FilterQuality? filterQuality = _getNamedParam<FilterQuality>(L, top_, 'filterQuality');
    filterQuality ??= FilterQuality.low;

    int? cacheWidth = _getNamedParam<int>(L, top_, 'cacheWidth');

    int? cacheHeight = _getNamedParam<int>(L, top_, 'cacheHeight');

    var result_ = Image.asset(name, key: key, bundle: bundle, frameBuilder: frameBuilder, errorBuilder: errorBuilder, semanticLabel: semanticLabel, excludeFromSemantics: excludeFromSemantics, scale: scale, width: width, height: height, color: color, opacity: opacity, colorBlendMode: colorBlendMode, fit: fit, alignment: alignment, repeat: repeat, centerSlice: centerSlice, matchTextDirection: matchTextDirection, gaplessPlayback: gaplessPlayback, isAntiAlias: isAntiAlias, package: package, filterQuality: filterQuality, cacheWidth: cacheWidth, cacheHeight: cacheHeight);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Image_file(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    File? file = _getParam<File>(L, 1)!;

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? scale = _getNamedParam<double>(L, top_, 'scale');
    scale ??= 1.0;

    ImageFrameBuilder? frameBuilder = _getNamedParam<ImageFrameBuilder>(L, top_, 'frameBuilder');

    ImageErrorWidgetBuilder? errorBuilder = _getNamedParam<ImageErrorWidgetBuilder>(L, top_, 'errorBuilder');

    String? semanticLabel = _getNamedParam<String>(L, top_, 'semanticLabel');

    bool? excludeFromSemantics = _getNamedParam<bool>(L, top_, 'excludeFromSemantics');
    excludeFromSemantics ??= false;

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? height = _getNamedParam<double>(L, top_, 'height');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Animation<double>? opacity = _getNamedParam<Animation<double>>(L, top_, 'opacity');

    BlendMode? colorBlendMode = _getNamedParam<BlendMode>(L, top_, 'colorBlendMode');

    BoxFit? fit = _getNamedParam<BoxFit>(L, top_, 'fit');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');
    alignment ??= Alignment.center;

    ImageRepeat? repeat = _getNamedParam<ImageRepeat>(L, top_, 'repeat');
    repeat ??= ImageRepeat.noRepeat;

    Rect? centerSlice = _getNamedParam<Rect>(L, top_, 'centerSlice');

    bool? matchTextDirection = _getNamedParam<bool>(L, top_, 'matchTextDirection');
    matchTextDirection ??= false;

    bool? gaplessPlayback = _getNamedParam<bool>(L, top_, 'gaplessPlayback');
    gaplessPlayback ??= false;

    bool? isAntiAlias = _getNamedParam<bool>(L, top_, 'isAntiAlias');
    isAntiAlias ??= false;

    FilterQuality? filterQuality = _getNamedParam<FilterQuality>(L, top_, 'filterQuality');
    filterQuality ??= FilterQuality.low;

    int? cacheWidth = _getNamedParam<int>(L, top_, 'cacheWidth');

    int? cacheHeight = _getNamedParam<int>(L, top_, 'cacheHeight');

    var result_ = Image.file(file, key: key, scale: scale, frameBuilder: frameBuilder, errorBuilder: errorBuilder, semanticLabel: semanticLabel, excludeFromSemantics: excludeFromSemantics, width: width, height: height, color: color, opacity: opacity, colorBlendMode: colorBlendMode, fit: fit, alignment: alignment, repeat: repeat, centerSlice: centerSlice, matchTextDirection: matchTextDirection, gaplessPlayback: gaplessPlayback, isAntiAlias: isAntiAlias, filterQuality: filterQuality, cacheWidth: cacheWidth, cacheHeight: cacheHeight);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Image_memory(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Uint8List? bytes = _getParam<Uint8List>(L, 1)!;

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? scale = _getNamedParam<double>(L, top_, 'scale');
    scale ??= 1.0;

    ImageFrameBuilder? frameBuilder = _getNamedParam<ImageFrameBuilder>(L, top_, 'frameBuilder');

    ImageErrorWidgetBuilder? errorBuilder = _getNamedParam<ImageErrorWidgetBuilder>(L, top_, 'errorBuilder');

    String? semanticLabel = _getNamedParam<String>(L, top_, 'semanticLabel');

    bool? excludeFromSemantics = _getNamedParam<bool>(L, top_, 'excludeFromSemantics');
    excludeFromSemantics ??= false;

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? height = _getNamedParam<double>(L, top_, 'height');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Animation<double>? opacity = _getNamedParam<Animation<double>>(L, top_, 'opacity');

    BlendMode? colorBlendMode = _getNamedParam<BlendMode>(L, top_, 'colorBlendMode');

    BoxFit? fit = _getNamedParam<BoxFit>(L, top_, 'fit');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');
    alignment ??= Alignment.center;

    ImageRepeat? repeat = _getNamedParam<ImageRepeat>(L, top_, 'repeat');
    repeat ??= ImageRepeat.noRepeat;

    Rect? centerSlice = _getNamedParam<Rect>(L, top_, 'centerSlice');

    bool? matchTextDirection = _getNamedParam<bool>(L, top_, 'matchTextDirection');
    matchTextDirection ??= false;

    bool? gaplessPlayback = _getNamedParam<bool>(L, top_, 'gaplessPlayback');
    gaplessPlayback ??= false;

    bool? isAntiAlias = _getNamedParam<bool>(L, top_, 'isAntiAlias');
    isAntiAlias ??= false;

    FilterQuality? filterQuality = _getNamedParam<FilterQuality>(L, top_, 'filterQuality');
    filterQuality ??= FilterQuality.low;

    int? cacheWidth = _getNamedParam<int>(L, top_, 'cacheWidth');

    int? cacheHeight = _getNamedParam<int>(L, top_, 'cacheHeight');

    var result_ = Image.memory(bytes, key: key, scale: scale, frameBuilder: frameBuilder, errorBuilder: errorBuilder, semanticLabel: semanticLabel, excludeFromSemantics: excludeFromSemantics, width: width, height: height, color: color, opacity: opacity, colorBlendMode: colorBlendMode, fit: fit, alignment: alignment, repeat: repeat, centerSlice: centerSlice, matchTextDirection: matchTextDirection, gaplessPlayback: gaplessPlayback, isAntiAlias: isAntiAlias, filterQuality: filterQuality, cacheWidth: cacheWidth, cacheHeight: cacheHeight);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Image_network(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? src = _getParam<String>(L, 1)!;

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    double? scale = _getNamedParam<double>(L, top_, 'scale');
    scale ??= 1.0;

    ImageFrameBuilder? frameBuilder = _getNamedParam<ImageFrameBuilder>(L, top_, 'frameBuilder');

    ImageLoadingBuilder? loadingBuilder = _getNamedParam<ImageLoadingBuilder>(L, top_, 'loadingBuilder');

    ImageErrorWidgetBuilder? errorBuilder = _getNamedParam<ImageErrorWidgetBuilder>(L, top_, 'errorBuilder');

    String? semanticLabel = _getNamedParam<String>(L, top_, 'semanticLabel');

    bool? excludeFromSemantics = _getNamedParam<bool>(L, top_, 'excludeFromSemantics');
    excludeFromSemantics ??= false;

    double? width = _getNamedParam<double>(L, top_, 'width');

    double? height = _getNamedParam<double>(L, top_, 'height');

    Color? color = _getNamedParam<Color>(L, top_, 'color');

    Animation<double>? opacity = _getNamedParam<Animation<double>>(L, top_, 'opacity');

    BlendMode? colorBlendMode = _getNamedParam<BlendMode>(L, top_, 'colorBlendMode');

    BoxFit? fit = _getNamedParam<BoxFit>(L, top_, 'fit');

    AlignmentGeometry? alignment = _getNamedParam<AlignmentGeometry>(L, top_, 'alignment');
    alignment ??= Alignment.center;

    ImageRepeat? repeat = _getNamedParam<ImageRepeat>(L, top_, 'repeat');
    repeat ??= ImageRepeat.noRepeat;

    Rect? centerSlice = _getNamedParam<Rect>(L, top_, 'centerSlice');

    bool? matchTextDirection = _getNamedParam<bool>(L, top_, 'matchTextDirection');
    matchTextDirection ??= false;

    bool? gaplessPlayback = _getNamedParam<bool>(L, top_, 'gaplessPlayback');
    gaplessPlayback ??= false;

    FilterQuality? filterQuality = _getNamedParam<FilterQuality>(L, top_, 'filterQuality');
    filterQuality ??= FilterQuality.low;

    bool? isAntiAlias = _getNamedParam<bool>(L, top_, 'isAntiAlias');
    isAntiAlias ??= false;

    Map<String, String>? headers = _getNamedMapParam<String, String>(L, top_, 'headers');

    int? cacheWidth = _getNamedParam<int>(L, top_, 'cacheWidth');

    int? cacheHeight = _getNamedParam<int>(L, top_, 'cacheHeight');

    var result_ = Image.network(src, key: key, scale: scale, frameBuilder: frameBuilder, loadingBuilder: loadingBuilder, errorBuilder: errorBuilder, semanticLabel: semanticLabel, excludeFromSemantics: excludeFromSemantics, width: width, height: height, color: color, opacity: opacity, colorBlendMode: colorBlendMode, fit: fit, alignment: alignment, repeat: repeat, centerSlice: centerSlice, matchTextDirection: matchTextDirection, gaplessPlayback: gaplessPlayback, filterQuality: filterQuality, isAntiAlias: isAntiAlias, headers: headers, cacheWidth: cacheWidth, cacheHeight: cacheHeight);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _NetworkImage_NetworkImage(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? url = _getParam<String>(L, 2)!;

    double? scale = _getNamedParam<double>(L, top_, 'scale')!;

    Map<String, String>? headers = _getNamedMapParam<String, String>(L, top_, 'headers');

    var result_ = NetworkImage(url, scale: scale, headers: headers);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _FileImage_FileImage(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    File? file = _getParam<File>(L, 2)!;

    double? scale = _getNamedParam<double>(L, top_, 'scale');
    scale ??= 1.0;

    var result_ = FileImage(file, scale: scale);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _MemoryImage_MemoryImage(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Uint8List? bytes = _getParam<Uint8List>(L, 2)!;

    double? scale = _getNamedParam<double>(L, top_, 'scale');
    scale ??= 1.0;

    var result_ = MemoryImage(bytes, scale: scale);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _File_File(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? path = _getParam<String>(L, 2)!;

    var result_ = File(path);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _File_fromRawPath(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Uint8List? rawPath = _getParam<Uint8List>(L, 1)!;

    var result_ = File.fromRawPath(rawPath);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _File_fromUri(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Uri? uri = _getParam<Uri>(L, 1)!;

    var result_ = File.fromUri(uri);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Uint8List_Uint8List(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? length = _getParam<int>(L, 2)!;

    var result_ = Uint8List(length);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Uint8List_fromList(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    List<int>? elements = _getListParam<int>(L, 1)!;

    var result_ = Uint8List.fromList(elements);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Uri_Uri(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? scheme = _getNamedParam<String>(L, top_, 'scheme');

    String? userInfo = _getNamedParam<String>(L, top_, 'userInfo');

    String? host = _getNamedParam<String>(L, top_, 'host');

    int? port = _getNamedParam<int>(L, top_, 'port');

    String? path = _getNamedParam<String>(L, top_, 'path');

    Iterable<String>? pathSegments = _getNamedParam<Iterable<String>>(L, top_, 'pathSegments');

    String? query = _getNamedParam<String>(L, top_, 'query');

    Map<String, dynamic>? queryParameters = _getNamedMapParam<String, dynamic>(L, top_, 'queryParameters');

    String? fragment = _getNamedParam<String>(L, top_, 'fragment');

    var result_ = Uri(scheme: scheme, userInfo: userInfo, host: host, port: port, path: path, pathSegments: pathSegments, query: query, queryParameters: queryParameters, fragment: fragment);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Uri_dataFromBytes(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    List<int>? bytes = _getListParam<int>(L, 1)!;

    String? mimeType = _getNamedParam<String>(L, top_, 'mimeType');
    mimeType ??= 'application/octet-stream';

    Map<String, String>? parameters = _getNamedMapParam<String, String>(L, top_, 'parameters');

    bool? percentEncoded = _getNamedParam<bool>(L, top_, 'percentEncoded');
    percentEncoded ??= false;

    var result_ = Uri.dataFromBytes(bytes, mimeType: mimeType, parameters: parameters, percentEncoded: percentEncoded);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Uri_dataFromString(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? content = _getParam<String>(L, 1)!;

    String? mimeType = _getNamedParam<String>(L, top_, 'mimeType');

    Encoding? encoding = _getNamedParam<Encoding>(L, top_, 'encoding');

    Map<String, String>? parameters = _getNamedMapParam<String, String>(L, top_, 'parameters');

    bool? base64 = _getNamedParam<bool>(L, top_, 'base64');
    base64 ??= false;

    var result_ = Uri.dataFromString(content, mimeType: mimeType, encoding: encoding, parameters: parameters, base64: base64);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Uri_directory(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? path = _getParam<String>(L, 1)!;

    bool? windows = _getNamedParam<bool>(L, top_, 'windows');

    var result_ = Uri.directory(path, windows: windows);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Uri_file(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? path = _getParam<String>(L, 1)!;

    bool? windows = _getNamedParam<bool>(L, top_, 'windows');

    var result_ = Uri.file(path, windows: windows);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Uri_http(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? authority = _getParam<String>(L, 1)!;

    var result_ = Uri.http(authority);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Uri_https(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? authority = _getParam<String>(L, 1)!;

    var result_ = Uri.https(authority);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Visibility_Visibility(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    Widget? replacement = _getNamedParam<Widget>(L, top_, 'replacement');
    replacement ??= const SizedBox.shrink();

    bool? visible = _getNamedParam<bool>(L, top_, 'visible');
    visible ??= true;

    bool? maintainState = _getNamedParam<bool>(L, top_, 'maintainState');
    maintainState ??= false;

    bool? maintainAnimation = _getNamedParam<bool>(L, top_, 'maintainAnimation');
    maintainAnimation ??= false;

    bool? maintainSize = _getNamedParam<bool>(L, top_, 'maintainSize');
    maintainSize ??= false;

    bool? maintainSemantics = _getNamedParam<bool>(L, top_, 'maintainSemantics');
    maintainSemantics ??= false;

    bool? maintainInteractivity = _getNamedParam<bool>(L, top_, 'maintainInteractivity');
    maintainInteractivity ??= false;

    var result_ = Visibility(key: key, child: child, replacement: replacement, visible: visible, maintainState: maintainState, maintainAnimation: maintainAnimation, maintainSize: maintainSize, maintainSemantics: maintainSemantics, maintainInteractivity: maintainInteractivity);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _Visibility_maintain(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    bool? visible = _getNamedParam<bool>(L, top_, 'visible');
    visible ??= true;

    var result_ = Visibility.maintain(key: key, child: child, visible: visible);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _double_getProp_(VoidPtr L) {
  var propName = Symbol(luaL_checkstring(L, 2).toDartString());

  switch(propName) {
    case #nan: return luaPush(L, double.nan);
    case #infinity: return luaPush(L, double.infinity);
    case #negativeInfinity: return luaPush(L, double.negativeInfinity);
    case #minPositive: return luaPush(L, double.minPositive);
    case #maxFinite: return luaPush(L, double.maxFinite);
  }

  lua_pushnil(L);
  return 1;
}

int _TabBar_TabBar(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    List<Widget>? tabs = _getNamedListParam<Widget>(L, top_, 'tabs')!;

    TabController? controller = _getNamedParam<TabController>(L, top_, 'controller');

    bool? isScrollable = _getNamedParam<bool>(L, top_, 'isScrollable');
    isScrollable ??= false;

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    Color? indicatorColor = _getNamedParam<Color>(L, top_, 'indicatorColor');

    bool? automaticIndicatorColorAdjustment = _getNamedParam<bool>(L, top_, 'automaticIndicatorColorAdjustment');
    automaticIndicatorColorAdjustment ??= true;

    double? indicatorWeight = _getNamedParam<double>(L, top_, 'indicatorWeight');
    indicatorWeight ??= 2.0;

    EdgeInsetsGeometry? indicatorPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'indicatorPadding');
    indicatorPadding ??= EdgeInsets.zero;

    Decoration? indicator = _getNamedParam<Decoration>(L, top_, 'indicator');

    TabBarIndicatorSize? indicatorSize = _getNamedParam<TabBarIndicatorSize>(L, top_, 'indicatorSize');

    Color? dividerColor = _getNamedParam<Color>(L, top_, 'dividerColor');

    Color? labelColor = _getNamedParam<Color>(L, top_, 'labelColor');

    TextStyle? labelStyle = _getNamedParam<TextStyle>(L, top_, 'labelStyle');

    EdgeInsetsGeometry? labelPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'labelPadding');

    Color? unselectedLabelColor = _getNamedParam<Color>(L, top_, 'unselectedLabelColor');

    TextStyle? unselectedLabelStyle = _getNamedParam<TextStyle>(L, top_, 'unselectedLabelStyle');

    DragStartBehavior? dragStartBehavior = _getNamedParam<DragStartBehavior>(L, top_, 'dragStartBehavior');
    dragStartBehavior ??= DragStartBehavior.start;

    MaterialStateProperty<Color?>? overlayColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'overlayColor');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    ValueChanged<int>? onTap = _getVoidCallbackT<int>(L, top_, 'onTap');

    ScrollPhysics? physics = _getNamedParam<ScrollPhysics>(L, top_, 'physics');

    InteractiveInkFeatureFactory? splashFactory = _getNamedParam<InteractiveInkFeatureFactory>(L, top_, 'splashFactory');

    BorderRadius? splashBorderRadius = _getNamedParam<BorderRadius>(L, top_, 'splashBorderRadius');

    var result_ = TabBar(key: key, tabs: tabs, controller: controller, isScrollable: isScrollable, padding: padding, indicatorColor: indicatorColor, automaticIndicatorColorAdjustment: automaticIndicatorColorAdjustment, indicatorWeight: indicatorWeight, indicatorPadding: indicatorPadding, indicator: indicator, indicatorSize: indicatorSize, dividerColor: dividerColor, labelColor: labelColor, labelStyle: labelStyle, labelPadding: labelPadding, unselectedLabelColor: unselectedLabelColor, unselectedLabelStyle: unselectedLabelStyle, dragStartBehavior: dragStartBehavior, overlayColor: overlayColor, mouseCursor: mouseCursor, enableFeedback: enableFeedback, onTap: onTap, physics: physics, splashFactory: splashFactory, splashBorderRadius: splashBorderRadius);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TabBar_secondary(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    List<Widget>? tabs = _getNamedListParam<Widget>(L, top_, 'tabs')!;

    TabController? controller = _getNamedParam<TabController>(L, top_, 'controller');

    bool? isScrollable = _getNamedParam<bool>(L, top_, 'isScrollable');
    isScrollable ??= false;

    EdgeInsetsGeometry? padding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'padding');

    Color? indicatorColor = _getNamedParam<Color>(L, top_, 'indicatorColor');

    bool? automaticIndicatorColorAdjustment = _getNamedParam<bool>(L, top_, 'automaticIndicatorColorAdjustment');
    automaticIndicatorColorAdjustment ??= true;

    double? indicatorWeight = _getNamedParam<double>(L, top_, 'indicatorWeight');
    indicatorWeight ??= 2.0;

    EdgeInsetsGeometry? indicatorPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'indicatorPadding');
    indicatorPadding ??= EdgeInsets.zero;

    Decoration? indicator = _getNamedParam<Decoration>(L, top_, 'indicator');

    TabBarIndicatorSize? indicatorSize = _getNamedParam<TabBarIndicatorSize>(L, top_, 'indicatorSize');

    Color? dividerColor = _getNamedParam<Color>(L, top_, 'dividerColor');

    Color? labelColor = _getNamedParam<Color>(L, top_, 'labelColor');

    TextStyle? labelStyle = _getNamedParam<TextStyle>(L, top_, 'labelStyle');

    EdgeInsetsGeometry? labelPadding = _getNamedParam<EdgeInsetsGeometry>(L, top_, 'labelPadding');

    Color? unselectedLabelColor = _getNamedParam<Color>(L, top_, 'unselectedLabelColor');

    TextStyle? unselectedLabelStyle = _getNamedParam<TextStyle>(L, top_, 'unselectedLabelStyle');

    DragStartBehavior? dragStartBehavior = _getNamedParam<DragStartBehavior>(L, top_, 'dragStartBehavior');
    dragStartBehavior ??= DragStartBehavior.start;

    MaterialStateProperty<Color?>? overlayColor = _getNamedParam<MaterialStateProperty<Color?>>(L, top_, 'overlayColor');

    MouseCursor? mouseCursor = _getNamedParam<MouseCursor>(L, top_, 'mouseCursor');

    bool? enableFeedback = _getNamedParam<bool>(L, top_, 'enableFeedback');

    ValueChanged<int>? onTap = _getVoidCallbackT<int>(L, top_, 'onTap');

    ScrollPhysics? physics = _getNamedParam<ScrollPhysics>(L, top_, 'physics');

    InteractiveInkFeatureFactory? splashFactory = _getNamedParam<InteractiveInkFeatureFactory>(L, top_, 'splashFactory');

    BorderRadius? splashBorderRadius = _getNamedParam<BorderRadius>(L, top_, 'splashBorderRadius');

    var result_ = TabBar.secondary(key: key, tabs: tabs, controller: controller, isScrollable: isScrollable, padding: padding, indicatorColor: indicatorColor, automaticIndicatorColorAdjustment: automaticIndicatorColorAdjustment, indicatorWeight: indicatorWeight, indicatorPadding: indicatorPadding, indicator: indicator, indicatorSize: indicatorSize, dividerColor: dividerColor, labelColor: labelColor, labelStyle: labelStyle, labelPadding: labelPadding, unselectedLabelColor: unselectedLabelColor, unselectedLabelStyle: unselectedLabelStyle, dragStartBehavior: dragStartBehavior, overlayColor: overlayColor, mouseCursor: mouseCursor, enableFeedback: enableFeedback, onTap: onTap, physics: physics, splashFactory: splashFactory, splashBorderRadius: splashBorderRadius);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TabBarView_TabBarView(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    List<Widget>? children = _getNamedListParam<Widget>(L, top_, 'children')!;

    TabController? controller = _getNamedParam<TabController>(L, top_, 'controller');

    ScrollPhysics? physics = _getNamedParam<ScrollPhysics>(L, top_, 'physics');

    DragStartBehavior? dragStartBehavior = _getNamedParam<DragStartBehavior>(L, top_, 'dragStartBehavior');
    dragStartBehavior ??= DragStartBehavior.start;

    double? viewportFraction = _getNamedParam<double>(L, top_, 'viewportFraction');
    viewportFraction ??= 1.0;

    Clip? clipBehavior = _getNamedParam<Clip>(L, top_, 'clipBehavior');
    clipBehavior ??= Clip.hardEdge;

    var result_ = TabBarView(key: key, children: children, controller: controller, physics: physics, dragStartBehavior: dragStartBehavior, viewportFraction: viewportFraction, clipBehavior: clipBehavior);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _TabController_TabController(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? initialIndex = _getNamedParam<int>(L, top_, 'initialIndex');
    initialIndex ??= 0;

    Duration? animationDuration = _getNamedParam<Duration>(L, top_, 'animationDuration');

    int? length = _getNamedParam<int>(L, top_, 'length')!;

    TickerProvider? vsync = _getNamedParam<TickerProvider>(L, top_, 'vsync')!;

    var result_ = TabController(initialIndex: initialIndex, animationDuration: animationDuration, length: length, vsync: vsync);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _DefaultTabController_DefaultTabController(VoidPtr L) {
  try {

    assert(lua_type(L, 1) == LUA_TTABLE);

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Key? key = _getNamedParam<Key>(L, top_, 'key');

    int? length = _getNamedParam<int>(L, top_, 'length')!;

    int? initialIndex = _getNamedParam<int>(L, top_, 'initialIndex');
    initialIndex ??= 0;

    Widget? child = _getNamedParam<Widget>(L, top_, 'child')!;

    Duration? animationDuration = _getNamedParam<Duration>(L, top_, 'animationDuration');

    var result_ = DefaultTabController(key: key, length: length, initialIndex: initialIndex, child: child, animationDuration: animationDuration);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _runApp(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    Widget? app = _getParam<Widget>(L, 1)!;

    runApp(app);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _showDialog(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BuildContext? context = _getNamedParam<BuildContext>(L, top_, 'context')!;

    WidgetBuilder? builder = _getWidgetBuilder(L, top_, 'builder')!;

    bool? barrierDismissible = _getNamedParam<bool>(L, top_, 'barrierDismissible');
    barrierDismissible ??= true;

    Color? barrierColor = _getNamedParam<Color>(L, top_, 'barrierColor');
    barrierColor ??= Colors.black54;

    String? barrierLabel = _getNamedParam<String>(L, top_, 'barrierLabel');

    bool? useSafeArea = _getNamedParam<bool>(L, top_, 'useSafeArea');
    useSafeArea ??= true;

    bool? useRootNavigator = _getNamedParam<bool>(L, top_, 'useRootNavigator');
    useRootNavigator ??= true;

    RouteSettings? routeSettings = _getNamedParam<RouteSettings>(L, top_, 'routeSettings');

    Offset? anchorPoint = _getNamedParam<Offset>(L, top_, 'anchorPoint');

    var result_ = showDialog(context: context, builder: builder, barrierDismissible: barrierDismissible, barrierColor: barrierColor, barrierLabel: barrierLabel, useSafeArea: useSafeArea, useRootNavigator: useRootNavigator, routeSettings: routeSettings, anchorPoint: anchorPoint);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _showGeneralDialog(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BuildContext? context = _getNamedParam<BuildContext>(L, top_, 'context')!;

    RoutePageBuilder? pageBuilder = _getNamedParam<RoutePageBuilder>(L, top_, 'pageBuilder')!;

    bool? barrierDismissible = _getNamedParam<bool>(L, top_, 'barrierDismissible');
    barrierDismissible ??= false;

    String? barrierLabel = _getNamedParam<String>(L, top_, 'barrierLabel');

    Color? barrierColor = _getNamedParam<Color>(L, top_, 'barrierColor');
    barrierColor ??= const Color(0x80000000);

    Duration? transitionDuration = _getNamedParam<Duration>(L, top_, 'transitionDuration');
    transitionDuration ??= const Duration(milliseconds: 200);

    RouteTransitionsBuilder? transitionBuilder = _getNamedParam<RouteTransitionsBuilder>(L, top_, 'transitionBuilder');

    bool? useRootNavigator = _getNamedParam<bool>(L, top_, 'useRootNavigator');
    useRootNavigator ??= true;

    RouteSettings? routeSettings = _getNamedParam<RouteSettings>(L, top_, 'routeSettings');

    Offset? anchorPoint = _getNamedParam<Offset>(L, top_, 'anchorPoint');

    var result_ = showGeneralDialog(context: context, pageBuilder: pageBuilder, barrierDismissible: barrierDismissible, barrierLabel: barrierLabel, barrierColor: barrierColor, transitionDuration: transitionDuration, transitionBuilder: transitionBuilder, useRootNavigator: useRootNavigator, routeSettings: routeSettings, anchorPoint: anchorPoint);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _StringKey(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    String? key = _getParam<String>(L, 1)!;

    var result_ = StringKey(key);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _IntKey(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    int? key = _getParam<int>(L, 1)!;

    var result_ = IntKey(key);

    return luaPush(L, result_);

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

int _markNeedsBuild(VoidPtr L) {
  try {

    int top_ = lua_gettop(L); assert(top_ >= 0);

    BuildContext? context = _getParam<BuildContext>(L, 1)!;

    markNeedsBuild(context);

    return 0;

  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}



void _autoBind(VoidPtr L) {
  int address = 0;
  int addressGet = 0;
  int addressSet = 0;

  luaRegisterClass(L, 'Object', '', 0, 0);

  luaRegisterClass(L, 'PointerEnterEvent', '', 0, 0);

  luaRegisterClass(L, 'PointerExitEvent', '', 0, 0);

  luaRegisterClass(L, 'Widget', '', 0, 0);

  luaRegisterClass(L, 'Text', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Text_Text, exceptionalReturn).address;
  luaRegisterMethod(L, 'Text', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Text_rich, exceptionalReturn).address;
  luaRegisterMethod(L, 'Text', 'rich', address);

  luaRegisterClass(L, 'RichText', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_RichText_RichText, exceptionalReturn).address;
  luaRegisterMethod(L, 'RichText', '__call', address);

  luaRegisterClass(L, 'TextSpan', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextSpan_TextSpan, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextSpan', '__call', address);

  luaRegisterClass(L, 'WidgetSpan', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_WidgetSpan_WidgetSpan, exceptionalReturn).address;
  luaRegisterMethod(L, 'WidgetSpan', '__call', address);

  luaRegisterClass(L, 'TextStyle', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextStyle_TextStyle, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextStyle', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextStyle_apply, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextStyle', 'apply', address);

  luaRegisterClass(L, 'TextField', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextField_TextField, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextField', '__call', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_TextInputType_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'TextInputType', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextInputType_numberWithOptions, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextInputType', 'numberWithOptions', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_TextEditingController_getProp_, exceptionalReturn).address;
  addressSet = ffi.Pointer.fromFunction<lua_CFunction>(_TextEditingController_setProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'TextEditingController', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextEditingController_TextEditingController, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextEditingController', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextEditingController_clear, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextEditingController', 'clear', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_TextAlignVertical_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'TextAlignVertical', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextAlignVertical_TextAlignVertical, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextAlignVertical', '__call', address);

  luaRegisterClass(L, 'Flex', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Flex_Flex, exceptionalReturn).address;
  luaRegisterMethod(L, 'Flex', '__call', address);

  luaRegisterClass(L, 'Column', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Column_Column, exceptionalReturn).address;
  luaRegisterMethod(L, 'Column', '__call', address);

  luaRegisterClass(L, 'Row', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Row_Row, exceptionalReturn).address;
  luaRegisterMethod(L, 'Row', '__call', address);

  luaRegisterClass(L, 'Flexible', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Flexible_Flexible, exceptionalReturn).address;
  luaRegisterMethod(L, 'Flexible', '__call', address);

  luaRegisterClass(L, 'Expanded', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Expanded_Expanded, exceptionalReturn).address;
  luaRegisterMethod(L, 'Expanded', '__call', address);

  luaRegisterClass(L, 'IconButton', 'Widget', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_IconButton_IconButton, exceptionalReturn).address;
  luaRegisterMethod(L, 'IconButton', '__call', address);

  luaRegisterClass(L, 'TextButton', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextButton_TextButton, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextButton', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextButton_icon, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextButton', 'icon', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextButton_styleFrom, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextButton', 'styleFrom', address);

  luaRegisterClass(L, 'ElevatedButton', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ElevatedButton_ElevatedButton, exceptionalReturn).address;
  luaRegisterMethod(L, 'ElevatedButton', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ElevatedButton_icon, exceptionalReturn).address;
  luaRegisterMethod(L, 'ElevatedButton', 'icon', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ElevatedButton_styleFrom, exceptionalReturn).address;
  luaRegisterMethod(L, 'ElevatedButton', 'styleFrom', address);

  luaRegisterClass(L, 'OutlinedButton', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_OutlinedButton_OutlinedButton, exceptionalReturn).address;
  luaRegisterMethod(L, 'OutlinedButton', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_OutlinedButton_icon, exceptionalReturn).address;
  luaRegisterMethod(L, 'OutlinedButton', 'icon', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_IconData_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'IconData', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_IconData_IconData, exceptionalReturn).address;
  luaRegisterMethod(L, 'IconData', '__call', address);

  luaRegisterClass(L, 'Icon', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Icon_Icon, exceptionalReturn).address;
  luaRegisterMethod(L, 'Icon', '__call', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_Color_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'Color', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Color_Color, exceptionalReturn).address;
  luaRegisterMethod(L, 'Color', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Color_fromARGB, exceptionalReturn).address;
  luaRegisterMethod(L, 'Color', 'fromARGB', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Color_fromRGBO, exceptionalReturn).address;
  luaRegisterMethod(L, 'Color', 'fromRGBO', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Color_withOpacity, exceptionalReturn).address;
  luaRegisterMethod(L, 'Color', 'withOpacity', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Color_withAlpha, exceptionalReturn).address;
  luaRegisterMethod(L, 'Color', 'withAlpha', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Color_withRed, exceptionalReturn).address;
  luaRegisterMethod(L, 'Color', 'withRed', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Color_withGreen, exceptionalReturn).address;
  luaRegisterMethod(L, 'Color', 'withGreen', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Color_withBlue, exceptionalReturn).address;
  luaRegisterMethod(L, 'Color', 'withBlue', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Color_computeLuminance, exceptionalReturn).address;
  luaRegisterMethod(L, 'Color', 'computeLuminance', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Color_lerp, exceptionalReturn).address;
  luaRegisterMethod(L, 'Color', 'lerp', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Color_alphaBlend, exceptionalReturn).address;
  luaRegisterMethod(L, 'Color', 'alphaBlend', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Color_getAlphaFromOpacity, exceptionalReturn).address;
  luaRegisterMethod(L, 'Color', 'getAlphaFromOpacity', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_MaterialColor_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'MaterialColor', 'Color', addressGet, addressSet);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_MaterialAccentColor_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'MaterialAccentColor', 'Color', addressGet, addressSet);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_Colors_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'Colors', '', addressGet, addressSet);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_WidgetsBinding_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'WidgetsBinding', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_WidgetsBinding_scheduleAttachRootWidget, exceptionalReturn).address;
  luaRegisterMethod(L, 'WidgetsBinding', 'scheduleAttachRootWidget', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_WidgetsBinding_scheduleWarmUpFrame, exceptionalReturn).address;
  luaRegisterMethod(L, 'WidgetsBinding', 'scheduleWarmUpFrame', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_WidgetsBinding_attachRootWidget, exceptionalReturn).address;
  luaRegisterMethod(L, 'WidgetsBinding', 'attachRootWidget', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_WidgetsBinding_scheduleFrameCallback, exceptionalReturn).address;
  luaRegisterMethod(L, 'WidgetsBinding', 'scheduleFrameCallback', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_WidgetsBinding_addPostFrameCallback, exceptionalReturn).address;
  luaRegisterMethod(L, 'WidgetsBinding', 'addPostFrameCallback', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_WidgetsBinding_wrapWithDefaultView, exceptionalReturn).address;
  luaRegisterMethod(L, 'WidgetsBinding', 'wrapWithDefaultView', address);

  luaRegisterClass(L, 'WidgetsFlutterBinding', 'WidgetsBinding', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_WidgetsFlutterBinding_ensureInitialized, exceptionalReturn).address;
  luaRegisterMethod(L, 'WidgetsFlutterBinding', 'ensureInitialized', address);

  luaRegisterClass(L, 'MaterialApp', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MaterialApp_MaterialApp, exceptionalReturn).address;
  luaRegisterMethod(L, 'MaterialApp', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MaterialApp_router, exceptionalReturn).address;
  luaRegisterMethod(L, 'MaterialApp', 'router', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_ThemeData_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'ThemeData', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ThemeData_ThemeData, exceptionalReturn).address;
  luaRegisterMethod(L, 'ThemeData', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ThemeData_copyWith, exceptionalReturn).address;
  luaRegisterMethod(L, 'ThemeData', 'copyWith', address);

  luaRegisterClass(L, 'Theme', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Theme_Theme, exceptionalReturn).address;
  luaRegisterMethod(L, 'Theme', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Theme_of, exceptionalReturn).address;
  luaRegisterMethod(L, 'Theme', 'of', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_ColorScheme_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'ColorScheme', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ColorScheme_ColorScheme, exceptionalReturn).address;
  luaRegisterMethod(L, 'ColorScheme', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ColorScheme_dark, exceptionalReturn).address;
  luaRegisterMethod(L, 'ColorScheme', 'dark', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ColorScheme_fromSeed, exceptionalReturn).address;
  luaRegisterMethod(L, 'ColorScheme', 'fromSeed', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ColorScheme_fromSwatch, exceptionalReturn).address;
  luaRegisterMethod(L, 'ColorScheme', 'fromSwatch', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ColorScheme_highContrastDark, exceptionalReturn).address;
  luaRegisterMethod(L, 'ColorScheme', 'highContrastDark', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ColorScheme_highContrastLight, exceptionalReturn).address;
  luaRegisterMethod(L, 'ColorScheme', 'highContrastLight', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ColorScheme_light, exceptionalReturn).address;
  luaRegisterMethod(L, 'ColorScheme', 'light', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ColorScheme_copyWith, exceptionalReturn).address;
  luaRegisterMethod(L, 'ColorScheme', 'copyWith', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ColorScheme_lerp, exceptionalReturn).address;
  luaRegisterMethod(L, 'ColorScheme', 'lerp', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_TextTheme_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'TextTheme', '', addressGet, addressSet);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_NavigationService_getProp_, exceptionalReturn).address;
  addressSet = ffi.Pointer.fromFunction<lua_CFunction>(_NavigationService_setProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'NavigationService', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_NavigationService_context, exceptionalReturn).address;
  luaRegisterMethod(L, 'NavigationService', 'context', address);

  luaRegisterClass(L, 'Navigator', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Navigator_of, exceptionalReturn).address;
  luaRegisterMethod(L, 'Navigator', 'of', address);

  luaRegisterClass(L, 'NavigatorState', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_NavigatorState_pushReplacementNamed, exceptionalReturn).address;
  luaRegisterMethod(L, 'NavigatorState', 'pushReplacementNamed', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_NavigatorState_popAndPushNamed, exceptionalReturn).address;
  luaRegisterMethod(L, 'NavigatorState', 'popAndPushNamed', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_NavigatorState_pushNamed, exceptionalReturn).address;
  luaRegisterMethod(L, 'NavigatorState', 'pushNamed', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_NavigatorState_canPop, exceptionalReturn).address;
  luaRegisterMethod(L, 'NavigatorState', 'canPop', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_NavigatorState_pop, exceptionalReturn).address;
  luaRegisterMethod(L, 'NavigatorState', 'pop', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_NavigatorState_push, exceptionalReturn).address;
  luaRegisterMethod(L, 'NavigatorState', 'push', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_NavigatorState_removeRoute, exceptionalReturn).address;
  luaRegisterMethod(L, 'NavigatorState', 'removeRoute', address);

  luaRegisterClass(L, 'Route', '', 0, 0);

  luaRegisterClass(L, 'DialogRoute', 'Route', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_DialogRoute_DialogRoute, exceptionalReturn).address;
  luaRegisterMethod(L, 'DialogRoute', '__call', address);

  luaRegisterClass(L, 'Center', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Center_Center, exceptionalReturn).address;
  luaRegisterMethod(L, 'Center', '__call', address);

  luaRegisterClass(L, 'LStatelessWidget', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_LStatelessWidget_LStatelessWidget, exceptionalReturn).address;
  luaRegisterMethod(L, 'LStatelessWidget', '__call', address);

  luaRegisterClass(L, 'LStatefulWidget', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_LStatefulWidget_LStatefulWidget, exceptionalReturn).address;
  luaRegisterMethod(L, 'LStatefulWidget', '__call', address);

  luaRegisterClass(L, 'LState', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_LState_LState, exceptionalReturn).address;
  luaRegisterMethod(L, 'LState', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_LState_markNeedsBuild, exceptionalReturn).address;
  luaRegisterMethod(L, 'LState', 'markNeedsBuild', address);

  luaRegisterClass(L, 'Builder', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Builder_Builder, exceptionalReturn).address;
  luaRegisterMethod(L, 'Builder', '__call', address);

  luaRegisterClass(L, 'StatefulBuilder', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_StatefulBuilder_StatefulBuilder, exceptionalReturn).address;
  luaRegisterMethod(L, 'StatefulBuilder', '__call', address);

  luaRegisterClass(L, 'SizedBox', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SizedBox_SizedBox, exceptionalReturn).address;
  luaRegisterMethod(L, 'SizedBox', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SizedBox_expand, exceptionalReturn).address;
  luaRegisterMethod(L, 'SizedBox', 'expand', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SizedBox_fromSize, exceptionalReturn).address;
  luaRegisterMethod(L, 'SizedBox', 'fromSize', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SizedBox_shrink, exceptionalReturn).address;
  luaRegisterMethod(L, 'SizedBox', 'shrink', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SizedBox_square, exceptionalReturn).address;
  luaRegisterMethod(L, 'SizedBox', 'square', address);

  luaRegisterClass(L, 'Spacer', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Spacer_Spacer, exceptionalReturn).address;
  luaRegisterMethod(L, 'Spacer', '__call', address);

  luaRegisterClass(L, 'Material', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Material_Material, exceptionalReturn).address;
  luaRegisterMethod(L, 'Material', '__call', address);

  luaRegisterClass(L, 'InkWell', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_InkWell_InkWell, exceptionalReturn).address;
  luaRegisterMethod(L, 'InkWell', '__call', address);

  luaRegisterClass(L, 'InkResponse', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_InkResponse_InkResponse, exceptionalReturn).address;
  luaRegisterMethod(L, 'InkResponse', '__call', address);

  luaRegisterClass(L, 'Scrollbar', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Scrollbar_Scrollbar, exceptionalReturn).address;
  luaRegisterMethod(L, 'Scrollbar', '__call', address);

  luaRegisterClass(L, 'ScrollController', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ScrollController_ScrollController, exceptionalReturn).address;
  luaRegisterMethod(L, 'ScrollController', '__call', address);

  luaRegisterClass(L, 'ListView', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ListView_ListView, exceptionalReturn).address;
  luaRegisterMethod(L, 'ListView', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ListView_builder, exceptionalReturn).address;
  luaRegisterMethod(L, 'ListView', 'builder', address);

  luaRegisterClass(L, 'SingleChildScrollView', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SingleChildScrollView_SingleChildScrollView, exceptionalReturn).address;
  luaRegisterMethod(L, 'SingleChildScrollView', '__call', address);

  luaRegisterClass(L, 'BlockPointer', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BlockPointer_BlockPointer, exceptionalReturn).address;
  luaRegisterMethod(L, 'BlockPointer', '__call', address);

  luaRegisterClass(L, 'ListTile', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ListTile_ListTile, exceptionalReturn).address;
  luaRegisterMethod(L, 'ListTile', '__call', address);

  luaRegisterClass(L, 'Container', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Container_Container, exceptionalReturn).address;
  luaRegisterMethod(L, 'Container', '__call', address);

  luaRegisterClass(L, 'Decoration', '', 0, 0);

  luaRegisterClass(L, 'BoxDecoration', 'Decoration', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BoxDecoration_BoxDecoration, exceptionalReturn).address;
  luaRegisterMethod(L, 'BoxDecoration', '__call', address);

  luaRegisterClass(L, 'ShapeDecoration', 'Decoration', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ShapeDecoration_ShapeDecoration, exceptionalReturn).address;
  luaRegisterMethod(L, 'ShapeDecoration', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ShapeDecoration_fromBoxDecoration, exceptionalReturn).address;
  luaRegisterMethod(L, 'ShapeDecoration', 'fromBoxDecoration', address);

  luaRegisterClass(L, 'DecoratedBox', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_DecoratedBox_DecoratedBox, exceptionalReturn).address;
  luaRegisterMethod(L, 'DecoratedBox', '__call', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_BorderSide_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'BorderSide', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BorderSide_BorderSide, exceptionalReturn).address;
  luaRegisterMethod(L, 'BorderSide', '__call', address);

  luaRegisterClass(L, 'Border', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Border_Border, exceptionalReturn).address;
  luaRegisterMethod(L, 'Border', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Border_all, exceptionalReturn).address;
  luaRegisterMethod(L, 'Border', 'all', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Border_fromBorderSide, exceptionalReturn).address;
  luaRegisterMethod(L, 'Border', 'fromBorderSide', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Border_symmetric, exceptionalReturn).address;
  luaRegisterMethod(L, 'Border', 'symmetric', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_Radius_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'Radius', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Radius_circular, exceptionalReturn).address;
  luaRegisterMethod(L, 'Radius', 'circular', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Radius_elliptical, exceptionalReturn).address;
  luaRegisterMethod(L, 'Radius', 'elliptical', address);

  luaRegisterClass(L, 'BorderRadiusGeometry', '', 0, 0);

  luaRegisterClass(L, 'BorderRadius', 'BorderRadiusGeometry', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BorderRadius_all, exceptionalReturn).address;
  luaRegisterMethod(L, 'BorderRadius', 'all', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BorderRadius_circular, exceptionalReturn).address;
  luaRegisterMethod(L, 'BorderRadius', 'circular', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BorderRadius_vertical, exceptionalReturn).address;
  luaRegisterMethod(L, 'BorderRadius', 'vertical', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BorderRadius_horizontal, exceptionalReturn).address;
  luaRegisterMethod(L, 'BorderRadius', 'horizontal', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BorderRadius_only, exceptionalReturn).address;
  luaRegisterMethod(L, 'BorderRadius', 'only', address);

  luaRegisterClass(L, 'Ink', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Ink_Ink, exceptionalReturn).address;
  luaRegisterMethod(L, 'Ink', '__call', address);

  luaRegisterClass(L, 'InputDecoration', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_InputDecoration_InputDecoration, exceptionalReturn).address;
  luaRegisterMethod(L, 'InputDecoration', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_InputDecoration_collapsed, exceptionalReturn).address;
  luaRegisterMethod(L, 'InputDecoration', 'collapsed', address);

  luaRegisterClass(L, 'OutlineInputBorder', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_OutlineInputBorder_OutlineInputBorder, exceptionalReturn).address;
  luaRegisterMethod(L, 'OutlineInputBorder', '__call', address);

  luaRegisterClass(L, 'Padding', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Padding_Padding, exceptionalReturn).address;
  luaRegisterMethod(L, 'Padding', '__call', address);

  luaRegisterClass(L, 'EdgeInsetsGeometry', '', 0, 0);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_EdgeInsets_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'EdgeInsets', 'EdgeInsetsGeometry', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_EdgeInsets_all, exceptionalReturn).address;
  luaRegisterMethod(L, 'EdgeInsets', 'all', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_EdgeInsets_fromLTRB, exceptionalReturn).address;
  luaRegisterMethod(L, 'EdgeInsets', 'fromLTRB', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_EdgeInsets_fromWindowPadding, exceptionalReturn).address;
  luaRegisterMethod(L, 'EdgeInsets', 'fromWindowPadding', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_EdgeInsets_only, exceptionalReturn).address;
  luaRegisterMethod(L, 'EdgeInsets', 'only', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_EdgeInsets_symmetric, exceptionalReturn).address;
  luaRegisterMethod(L, 'EdgeInsets', 'symmetric', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_Size_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'Size', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Size_Size, exceptionalReturn).address;
  luaRegisterMethod(L, 'Size', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Size_copy, exceptionalReturn).address;
  luaRegisterMethod(L, 'Size', 'copy', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Size_fromHeight, exceptionalReturn).address;
  luaRegisterMethod(L, 'Size', 'fromHeight', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Size_fromRadius, exceptionalReturn).address;
  luaRegisterMethod(L, 'Size', 'fromRadius', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Size_fromWidth, exceptionalReturn).address;
  luaRegisterMethod(L, 'Size', 'fromWidth', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Size_square, exceptionalReturn).address;
  luaRegisterMethod(L, 'Size', 'square', address);

  luaRegisterClass(L, 'BoxConstraints', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BoxConstraints_BoxConstraints, exceptionalReturn).address;
  luaRegisterMethod(L, 'BoxConstraints', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BoxConstraints_expand, exceptionalReturn).address;
  luaRegisterMethod(L, 'BoxConstraints', 'expand', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BoxConstraints_loose, exceptionalReturn).address;
  luaRegisterMethod(L, 'BoxConstraints', 'loose', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BoxConstraints_tight, exceptionalReturn).address;
  luaRegisterMethod(L, 'BoxConstraints', 'tight', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BoxConstraints_tightFor, exceptionalReturn).address;
  luaRegisterMethod(L, 'BoxConstraints', 'tightFor', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BoxConstraints_tightForFinite, exceptionalReturn).address;
  luaRegisterMethod(L, 'BoxConstraints', 'tightForFinite', address);

  luaRegisterClass(L, 'ConstrainedBox', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ConstrainedBox_ConstrainedBox, exceptionalReturn).address;
  luaRegisterMethod(L, 'ConstrainedBox', '__call', address);

  luaRegisterClass(L, 'LimitedBox', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_LimitedBox_LimitedBox, exceptionalReturn).address;
  luaRegisterMethod(L, 'LimitedBox', '__call', address);

  luaRegisterClass(L, 'Checkbox', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Checkbox_Checkbox, exceptionalReturn).address;
  luaRegisterMethod(L, 'Checkbox', '__call', address);

  luaRegisterClass(L, 'CheckboxListTile', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_CheckboxListTile_CheckboxListTile, exceptionalReturn).address;
  luaRegisterMethod(L, 'CheckboxListTile', '__call', address);

  luaRegisterClass(L, 'TextInputFormatter', '', 0, 0);

  luaRegisterClass(L, 'LTextInputFormatter', 'TextInputFormatter', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_LTextInputFormatter_LTextInputFormatter, exceptionalReturn).address;
  luaRegisterMethod(L, 'LTextInputFormatter', '__call', address);

  luaRegisterClass(L, 'ClipRect', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ClipRect_ClipRect, exceptionalReturn).address;
  luaRegisterMethod(L, 'ClipRect', '__call', address);

  luaRegisterClass(L, 'ClipRRect', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ClipRRect_ClipRRect, exceptionalReturn).address;
  luaRegisterMethod(L, 'ClipRRect', '__call', address);

  luaRegisterClass(L, 'Tooltip', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Tooltip_Tooltip, exceptionalReturn).address;
  luaRegisterMethod(L, 'Tooltip', '__call', address);

  luaRegisterClass(L, 'Table', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Table_Table, exceptionalReturn).address;
  luaRegisterMethod(L, 'Table', '__call', address);

  luaRegisterClass(L, 'TableRow', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TableRow_TableRow, exceptionalReturn).address;
  luaRegisterMethod(L, 'TableRow', '__call', address);

  luaRegisterClass(L, 'TableColumnWidth', '', 0, 0);

  luaRegisterClass(L, 'FlexColumnWidth', 'TableColumnWidth', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_FlexColumnWidth_FlexColumnWidth, exceptionalReturn).address;
  luaRegisterMethod(L, 'FlexColumnWidth', '__call', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_MediaQueryData_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'MediaQueryData', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MediaQueryData_MediaQueryData, exceptionalReturn).address;
  luaRegisterMethod(L, 'MediaQueryData', '__call', address);

  luaRegisterClass(L, 'MediaQuery', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MediaQuery_MediaQuery, exceptionalReturn).address;
  luaRegisterMethod(L, 'MediaQuery', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MediaQuery_removePadding, exceptionalReturn).address;
  luaRegisterMethod(L, 'MediaQuery', 'removePadding', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MediaQuery_removeViewInsets, exceptionalReturn).address;
  luaRegisterMethod(L, 'MediaQuery', 'removeViewInsets', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MediaQuery_removeViewPadding, exceptionalReturn).address;
  luaRegisterMethod(L, 'MediaQuery', 'removeViewPadding', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MediaQuery_of, exceptionalReturn).address;
  luaRegisterMethod(L, 'MediaQuery', 'of', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_Offset_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'Offset', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Offset_Offset, exceptionalReturn).address;
  luaRegisterMethod(L, 'Offset', '__call', address);

  luaRegisterClass(L, 'AlignmentGeometry', '', 0, 0);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_Alignment_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'Alignment', 'AlignmentGeometry', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Alignment_Alignment, exceptionalReturn).address;
  luaRegisterMethod(L, 'Alignment', '__call', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_FractionalOffset_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'FractionalOffset', 'Alignment', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_FractionalOffset_FractionalOffset, exceptionalReturn).address;
  luaRegisterMethod(L, 'FractionalOffset', '__call', address);

  luaRegisterClass(L, 'Align', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Align_Align, exceptionalReturn).address;
  luaRegisterMethod(L, 'Align', '__call', address);

  luaRegisterClass(L, 'DefaultTextStyle', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_DefaultTextStyle_DefaultTextStyle, exceptionalReturn).address;
  luaRegisterMethod(L, 'DefaultTextStyle', '__call', address);

  luaRegisterClass(L, 'SliderTheme', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SliderTheme_SliderTheme, exceptionalReturn).address;
  luaRegisterMethod(L, 'SliderTheme', '__call', address);

  luaRegisterClass(L, 'SliderThemeData', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SliderThemeData_SliderThemeData, exceptionalReturn).address;
  luaRegisterMethod(L, 'SliderThemeData', '__call', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_SliderComponentShape_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'SliderComponentShape', '', addressGet, addressSet);

  luaRegisterClass(L, 'Slider', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Slider_Slider, exceptionalReturn).address;
  luaRegisterMethod(L, 'Slider', '__call', address);

  luaRegisterClass(L, 'Stack', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Stack_Stack, exceptionalReturn).address;
  luaRegisterMethod(L, 'Stack', '__call', address);

  luaRegisterClass(L, 'Positioned', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Positioned_Positioned, exceptionalReturn).address;
  luaRegisterMethod(L, 'Positioned', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Positioned_directional, exceptionalReturn).address;
  luaRegisterMethod(L, 'Positioned', 'directional', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Positioned_fill, exceptionalReturn).address;
  luaRegisterMethod(L, 'Positioned', 'fill', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Positioned_fromRect, exceptionalReturn).address;
  luaRegisterMethod(L, 'Positioned', 'fromRect', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Positioned_fromRelativeRect, exceptionalReturn).address;
  luaRegisterMethod(L, 'Positioned', 'fromRelativeRect', address);

  luaRegisterClass(L, 'LongPressDraggable', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_LongPressDraggable_LongPressDraggable, exceptionalReturn).address;
  luaRegisterMethod(L, 'LongPressDraggable', '__call', address);

  luaRegisterClass(L, 'Draggable', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Draggable_Draggable, exceptionalReturn).address;
  luaRegisterMethod(L, 'Draggable', '__call', address);

  luaRegisterClass(L, 'DragTarget', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_DragTarget_DragTarget, exceptionalReturn).address;
  luaRegisterMethod(L, 'DragTarget', '__call', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_DraggableDetails_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'DraggableDetails', '', addressGet, addressSet);

  luaRegisterClass(L, 'Opacity', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Opacity_Opacity, exceptionalReturn).address;
  luaRegisterMethod(L, 'Opacity', '__call', address);

  luaRegisterClass(L, 'ColoredBox', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ColoredBox_ColoredBox, exceptionalReturn).address;
  luaRegisterMethod(L, 'ColoredBox', '__call', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_Velocity_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'Velocity', '', addressGet, addressSet);

  luaRegisterClass(L, 'Divider', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Divider_Divider, exceptionalReturn).address;
  luaRegisterMethod(L, 'Divider', '__call', address);

  luaRegisterClass(L, 'VerticalDivider', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_VerticalDivider_VerticalDivider, exceptionalReturn).address;
  luaRegisterMethod(L, 'VerticalDivider', '__call', address);

  luaRegisterClass(L, 'Wrap', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Wrap_Wrap, exceptionalReturn).address;
  luaRegisterMethod(L, 'Wrap', '__call', address);

  luaRegisterClass(L, 'GestureDetector', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_GestureDetector_GestureDetector, exceptionalReturn).address;
  luaRegisterMethod(L, 'GestureDetector', '__call', address);

  luaRegisterClass(L, 'DragDownDetails', '', 0, 0);

  luaRegisterClass(L, 'DragEndDetails', '', 0, 0);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_DragStartDetails_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'DragStartDetails', '', addressGet, addressSet);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_DragUpdateDetails_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'DragUpdateDetails', '', addressGet, addressSet);

  luaRegisterClass(L, 'LongPressDownDetails', '', 0, 0);

  luaRegisterClass(L, 'LongPressEndDetails', '', 0, 0);

  luaRegisterClass(L, 'LongPressMoveUpdateDetails', '', 0, 0);

  luaRegisterClass(L, 'LongPressStartDetails', '', 0, 0);

  luaRegisterClass(L, 'TapDownDetails', '', 0, 0);

  luaRegisterClass(L, 'TapUpDetails', '', 0, 0);

  luaRegisterClass(L, 'Key', '', 0, 0);

  luaRegisterClass(L, 'UniqueKey', 'Key', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_UniqueKey_UniqueKey, exceptionalReturn).address;
  luaRegisterMethod(L, 'UniqueKey', '__call', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_Duration_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'Duration', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Duration_Duration, exceptionalReturn).address;
  luaRegisterMethod(L, 'Duration', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Duration_compareTo, exceptionalReturn).address;
  luaRegisterMethod(L, 'Duration', 'compareTo', address);

  luaRegisterClass(L, 'Dialog', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Dialog_Dialog, exceptionalReturn).address;
  luaRegisterMethod(L, 'Dialog', '__call', address);

  luaRegisterClass(L, 'AlertDialog', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_AlertDialog_AlertDialog, exceptionalReturn).address;
  luaRegisterMethod(L, 'AlertDialog', '__call', address);

  luaRegisterClass(L, 'SimpleDialog', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SimpleDialog_SimpleDialog, exceptionalReturn).address;
  luaRegisterMethod(L, 'SimpleDialog', '__call', address);

  luaRegisterClass(L, 'CupertinoAlertDialog', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_CupertinoAlertDialog_CupertinoAlertDialog, exceptionalReturn).address;
  luaRegisterMethod(L, 'CupertinoAlertDialog', '__call', address);

  luaRegisterClass(L, 'Future', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Future_Future, exceptionalReturn).address;
  luaRegisterMethod(L, 'Future', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Future_delayed, exceptionalReturn).address;
  luaRegisterMethod(L, 'Future', 'delayed', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Future_microtask, exceptionalReturn).address;
  luaRegisterMethod(L, 'Future', 'microtask', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Future_sync, exceptionalReturn).address;
  luaRegisterMethod(L, 'Future', 'sync', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Future_then, exceptionalReturn).address;
  luaRegisterMethod(L, 'Future', 'then', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Future_catchError, exceptionalReturn).address;
  luaRegisterMethod(L, 'Future', 'catchError', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Future_whenComplete, exceptionalReturn).address;
  luaRegisterMethod(L, 'Future', 'whenComplete', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Future_timeout, exceptionalReturn).address;
  luaRegisterMethod(L, 'Future', 'timeout', address);

  luaRegisterClass(L, 'Future<dynamic>', 'Future', 0, 0);

  luaRegisterClass(L, 'FloatingActionButton', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_FloatingActionButton_FloatingActionButton, exceptionalReturn).address;
  luaRegisterMethod(L, 'FloatingActionButton', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_FloatingActionButton_extended, exceptionalReturn).address;
  luaRegisterMethod(L, 'FloatingActionButton', 'extended', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_FloatingActionButton_large, exceptionalReturn).address;
  luaRegisterMethod(L, 'FloatingActionButton', 'large', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_FloatingActionButton_small, exceptionalReturn).address;
  luaRegisterMethod(L, 'FloatingActionButton', 'small', address);

  luaRegisterClass(L, 'Scaffold', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Scaffold_Scaffold, exceptionalReturn).address;
  luaRegisterMethod(L, 'Scaffold', '__call', address);

  luaRegisterClass(L, 'AppBar', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_AppBar_AppBar, exceptionalReturn).address;
  luaRegisterMethod(L, 'AppBar', '__call', address);

  luaRegisterClass(L, 'BottomNavigationBar', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BottomNavigationBar_BottomNavigationBar, exceptionalReturn).address;
  luaRegisterMethod(L, 'BottomNavigationBar', '__call', address);

  luaRegisterClass(L, 'BottomNavigationBarItem', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_BottomNavigationBarItem_BottomNavigationBarItem, exceptionalReturn).address;
  luaRegisterMethod(L, 'BottomNavigationBarItem', '__call', address);

  luaRegisterClass(L, 'ScaffoldMessenger', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ScaffoldMessenger_of, exceptionalReturn).address;
  luaRegisterMethod(L, 'ScaffoldMessenger', 'of', address);

  luaRegisterClass(L, 'ScaffoldMessengerState', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ScaffoldMessengerState_showSnackBar, exceptionalReturn).address;
  luaRegisterMethod(L, 'ScaffoldMessengerState', 'showSnackBar', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ScaffoldMessengerState_showMaterialBanner, exceptionalReturn).address;
  luaRegisterMethod(L, 'ScaffoldMessengerState', 'showMaterialBanner', address);

  luaRegisterClass(L, 'SnackBar', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SnackBar_SnackBar, exceptionalReturn).address;
  luaRegisterMethod(L, 'SnackBar', '__call', address);

  luaRegisterClass(L, 'MaterialBanner', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MaterialBanner_MaterialBanner, exceptionalReturn).address;
  luaRegisterMethod(L, 'MaterialBanner', '__call', address);

  luaRegisterClass(L, 'PopupMenuButton', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_PopupMenuButton_PopupMenuButton, exceptionalReturn).address;
  luaRegisterMethod(L, 'PopupMenuButton', '__call', address);

  luaRegisterClass(L, 'PopupMenuEntry', '', 0, 0);

  luaRegisterClass(L, 'PopupMenuDivider', 'PopupMenuEntry', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_PopupMenuDivider_PopupMenuDivider, exceptionalReturn).address;
  luaRegisterMethod(L, 'PopupMenuDivider', '__call', address);

  luaRegisterClass(L, 'PopupMenuItem', 'PopupMenuEntry', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_PopupMenuItem_PopupMenuItem, exceptionalReturn).address;
  luaRegisterMethod(L, 'PopupMenuItem', '__call', address);

  luaRegisterClass(L, 'CheckedPopupMenuItem', 'PopupMenuItem', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_CheckedPopupMenuItem_CheckedPopupMenuItem, exceptionalReturn).address;
  luaRegisterMethod(L, 'CheckedPopupMenuItem', '__call', address);

  luaRegisterClass(L, 'SafeArea', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SafeArea_SafeArea, exceptionalReturn).address;
  luaRegisterMethod(L, 'SafeArea', '__call', address);

  luaRegisterClass(L, 'RoundedRectangleBorder', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_RoundedRectangleBorder_RoundedRectangleBorder, exceptionalReturn).address;
  luaRegisterMethod(L, 'RoundedRectangleBorder', '__call', address);

  luaRegisterClass(L, 'DropdownMenuItem', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_DropdownMenuItem_DropdownMenuItem, exceptionalReturn).address;
  luaRegisterMethod(L, 'DropdownMenuItem', '__call', address);

  luaRegisterClass(L, 'DropdownButton', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_DropdownButton_DropdownButton, exceptionalReturn).address;
  luaRegisterMethod(L, 'DropdownButton', '__call', address);

  luaRegisterClass(L, 'ButtonSegment', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ButtonSegment_ButtonSegment, exceptionalReturn).address;
  luaRegisterMethod(L, 'ButtonSegment', '__call', address);

  luaRegisterClass(L, 'SegmentedButton', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SegmentedButton_SegmentedButton, exceptionalReturn).address;
  luaRegisterMethod(L, 'SegmentedButton', '__call', address);

  luaRegisterClass(L, 'Overlay', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Overlay_of, exceptionalReturn).address;
  luaRegisterMethod(L, 'Overlay', 'of', address);

  luaRegisterClass(L, 'OverlayState', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_OverlayState_insert, exceptionalReturn).address;
  luaRegisterMethod(L, 'OverlayState', 'insert', address);

  luaRegisterClass(L, 'OverlayEntry', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_OverlayEntry_OverlayEntry, exceptionalReturn).address;
  luaRegisterMethod(L, 'OverlayEntry', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_OverlayEntry_markNeedsBuild, exceptionalReturn).address;
  luaRegisterMethod(L, 'OverlayEntry', 'markNeedsBuild', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_OverlayEntry_remove, exceptionalReturn).address;
  luaRegisterMethod(L, 'OverlayEntry', 'remove', address);

  luaRegisterClass(L, 'RotatedBox', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_RotatedBox_RotatedBox, exceptionalReturn).address;
  luaRegisterMethod(L, 'RotatedBox', '__call', address);

  luaRegisterClass(L, 'Transform', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Transform_Transform, exceptionalReturn).address;
  luaRegisterMethod(L, 'Transform', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Transform_rotate, exceptionalReturn).address;
  luaRegisterMethod(L, 'Transform', 'rotate', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Transform_scale, exceptionalReturn).address;
  luaRegisterMethod(L, 'Transform', 'scale', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Transform_translate, exceptionalReturn).address;
  luaRegisterMethod(L, 'Transform', 'translate', address);

  luaRegisterClass(L, 'CircularProgressIndicator', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_CircularProgressIndicator_CircularProgressIndicator, exceptionalReturn).address;
  luaRegisterMethod(L, 'CircularProgressIndicator', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_CircularProgressIndicator_adaptive, exceptionalReturn).address;
  luaRegisterMethod(L, 'CircularProgressIndicator', 'adaptive', address);

  luaRegisterClass(L, 'LinearProgressIndicator', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_LinearProgressIndicator_LinearProgressIndicator, exceptionalReturn).address;
  luaRegisterMethod(L, 'LinearProgressIndicator', '__call', address);

  luaRegisterClass(L, 'FittedBox', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_FittedBox_FittedBox, exceptionalReturn).address;
  luaRegisterMethod(L, 'FittedBox', '__call', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_SchedulerBinding_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'SchedulerBinding', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SchedulerBinding_scheduleFrame, exceptionalReturn).address;
  luaRegisterMethod(L, 'SchedulerBinding', 'scheduleFrame', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SchedulerBinding_scheduleForcedFrame, exceptionalReturn).address;
  luaRegisterMethod(L, 'SchedulerBinding', 'scheduleForcedFrame', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SchedulerBinding_scheduleFrameCallback, exceptionalReturn).address;
  luaRegisterMethod(L, 'SchedulerBinding', 'scheduleFrameCallback', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SchedulerBinding_addPostFrameCallback, exceptionalReturn).address;
  luaRegisterMethod(L, 'SchedulerBinding', 'addPostFrameCallback', address);

  luaRegisterClass(L, 'Card', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Card_Card, exceptionalReturn).address;
  luaRegisterMethod(L, 'Card', '__call', address);

  luaRegisterClass(L, 'MaterialStatePropertyT', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MaterialStatePropertyT_resolveColor, exceptionalReturn).address;
  luaRegisterMethod(L, 'MaterialStatePropertyT', 'resolveColor', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MaterialStatePropertyT_resolveBorderSide, exceptionalReturn).address;
  luaRegisterMethod(L, 'MaterialStatePropertyT', 'resolveBorderSide', address);

  luaRegisterClass(L, 'MaterialStateColor', 'Color', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MaterialStateColor_resolveWith, exceptionalReturn).address;
  luaRegisterMethod(L, 'MaterialStateColor', 'resolveWith', address);

  luaRegisterClass(L, 'ButtonStyle', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ButtonStyle_ButtonStyle, exceptionalReturn).address;
  luaRegisterMethod(L, 'ButtonStyle', '__call', address);

  luaRegisterClass(L, 'ToggleButtons', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_ToggleButtons_ToggleButtons, exceptionalReturn).address;
  luaRegisterMethod(L, 'ToggleButtons', '__call', address);

  luaRegisterClass(L, 'Directionality', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Directionality_Directionality, exceptionalReturn).address;
  luaRegisterMethod(L, 'Directionality', '__call', address);

  luaRegisterClass(L, 'IntrinsicHeight', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_IntrinsicHeight_IntrinsicHeight, exceptionalReturn).address;
  luaRegisterMethod(L, 'IntrinsicHeight', '__call', address);

  luaRegisterClass(L, 'IntrinsicWidth', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_IntrinsicWidth_IntrinsicWidth, exceptionalReturn).address;
  luaRegisterMethod(L, 'IntrinsicWidth', '__call', address);

  luaRegisterClass(L, 'Switch', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Switch_Switch, exceptionalReturn).address;
  luaRegisterMethod(L, 'Switch', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Switch_adaptive, exceptionalReturn).address;
  luaRegisterMethod(L, 'Switch', 'adaptive', address);

  luaRegisterClass(L, 'SwitchListTile', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SwitchListTile_SwitchListTile, exceptionalReturn).address;
  luaRegisterMethod(L, 'SwitchListTile', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_SwitchListTile_adaptive, exceptionalReturn).address;
  luaRegisterMethod(L, 'SwitchListTile', 'adaptive', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_VisualDensity_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'VisualDensity', '', addressGet, addressSet);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_VisualDensity_VisualDensity, exceptionalReturn).address;
  luaRegisterMethod(L, 'VisualDensity', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_VisualDensity_defaultDensityForPlatform, exceptionalReturn).address;
  luaRegisterMethod(L, 'VisualDensity', 'defaultDensityForPlatform', address);

  luaRegisterClass(L, 'TextSelection', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextSelection_TextSelection, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextSelection', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextSelection_collapsed, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextSelection', 'collapsed', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextSelection_fromPosition, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextSelection', 'fromPosition', address);

  luaRegisterClass(L, 'TextPosition', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextPosition_TextPosition, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextPosition', '__call', address);

  luaRegisterClass(L, 'TextEditingValue', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextEditingValue_TextEditingValue, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextEditingValue', '__call', address);

  luaRegisterClass(L, 'TextRange', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TextRange_TextRange, exceptionalReturn).address;
  luaRegisterMethod(L, 'TextRange', '__call', address);

  luaRegisterClass(L, 'Radio', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Radio_Radio, exceptionalReturn).address;
  luaRegisterMethod(L, 'Radio', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Radio_adaptive, exceptionalReturn).address;
  luaRegisterMethod(L, 'Radio', 'adaptive', address);

  luaRegisterClass(L, 'Image', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Image_Image, exceptionalReturn).address;
  luaRegisterMethod(L, 'Image', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Image_asset, exceptionalReturn).address;
  luaRegisterMethod(L, 'Image', 'asset', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Image_file, exceptionalReturn).address;
  luaRegisterMethod(L, 'Image', 'file', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Image_memory, exceptionalReturn).address;
  luaRegisterMethod(L, 'Image', 'memory', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Image_network, exceptionalReturn).address;
  luaRegisterMethod(L, 'Image', 'network', address);

  luaRegisterClass(L, 'NetworkImage', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_NetworkImage_NetworkImage, exceptionalReturn).address;
  luaRegisterMethod(L, 'NetworkImage', '__call', address);

  luaRegisterClass(L, 'FileImage', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_FileImage_FileImage, exceptionalReturn).address;
  luaRegisterMethod(L, 'FileImage', '__call', address);

  luaRegisterClass(L, 'MemoryImage', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_MemoryImage_MemoryImage, exceptionalReturn).address;
  luaRegisterMethod(L, 'MemoryImage', '__call', address);

  luaRegisterClass(L, 'File', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_File_File, exceptionalReturn).address;
  luaRegisterMethod(L, 'File', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_File_fromRawPath, exceptionalReturn).address;
  luaRegisterMethod(L, 'File', 'fromRawPath', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_File_fromUri, exceptionalReturn).address;
  luaRegisterMethod(L, 'File', 'fromUri', address);

  luaRegisterClass(L, 'Uint8List', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Uint8List_Uint8List, exceptionalReturn).address;
  luaRegisterMethod(L, 'Uint8List', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Uint8List_fromList, exceptionalReturn).address;
  luaRegisterMethod(L, 'Uint8List', 'fromList', address);

  luaRegisterClass(L, 'Uri', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Uri_Uri, exceptionalReturn).address;
  luaRegisterMethod(L, 'Uri', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Uri_dataFromBytes, exceptionalReturn).address;
  luaRegisterMethod(L, 'Uri', 'dataFromBytes', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Uri_dataFromString, exceptionalReturn).address;
  luaRegisterMethod(L, 'Uri', 'dataFromString', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Uri_directory, exceptionalReturn).address;
  luaRegisterMethod(L, 'Uri', 'directory', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Uri_file, exceptionalReturn).address;
  luaRegisterMethod(L, 'Uri', 'file', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Uri_http, exceptionalReturn).address;
  luaRegisterMethod(L, 'Uri', 'http', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Uri_https, exceptionalReturn).address;
  luaRegisterMethod(L, 'Uri', 'https', address);

  luaRegisterClass(L, 'Visibility', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Visibility_Visibility, exceptionalReturn).address;
  luaRegisterMethod(L, 'Visibility', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_Visibility_maintain, exceptionalReturn).address;
  luaRegisterMethod(L, 'Visibility', 'maintain', address);

  addressGet = 0;
  addressSet = 0;
  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_double_getProp_, exceptionalReturn).address;
  luaRegisterClass(L, 'double', '', addressGet, addressSet);

  luaRegisterClass(L, 'TabBar', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TabBar_TabBar, exceptionalReturn).address;
  luaRegisterMethod(L, 'TabBar', '__call', address);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TabBar_secondary, exceptionalReturn).address;
  luaRegisterMethod(L, 'TabBar', 'secondary', address);

  luaRegisterClass(L, 'TabBarView', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TabBarView_TabBarView, exceptionalReturn).address;
  luaRegisterMethod(L, 'TabBarView', '__call', address);

  luaRegisterClass(L, 'TabController', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_TabController_TabController, exceptionalReturn).address;
  luaRegisterMethod(L, 'TabController', '__call', address);

  luaRegisterClass(L, 'DefaultTabController', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_DefaultTabController_DefaultTabController, exceptionalReturn).address;
  luaRegisterMethod(L, 'DefaultTabController', '__call', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(_runApp, exceptionalReturn).address;
  luaRegisterFunction(L, 'runApp', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(_showDialog, exceptionalReturn).address;
  luaRegisterFunction(L, 'showDialog', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(_showGeneralDialog, exceptionalReturn).address;
  luaRegisterFunction(L, 'showGeneralDialog', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(_StringKey, exceptionalReturn).address;
  luaRegisterFunction(L, 'StringKey', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(_IntKey, exceptionalReturn).address;
  luaRegisterFunction(L, 'IntKey', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(_markNeedsBuild, exceptionalReturn).address;
  luaRegisterFunction(L, 'markNeedsBuild', address);

  assert((){var b = (luaGetValue(L, 'FontStyle') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'FontStyle.normal', FontStyle.normal);
  luaSetObject(L, 'FontStyle.italic', FontStyle.italic);

  assert((){var b = (luaGetValue(L, 'FontWeight') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'FontWeight.bold', FontWeight.bold);
  luaSetObject(L, 'FontWeight.normal', FontWeight.normal);

  assert((){var b = (luaGetValue(L, 'Icons') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'Icons.favorite', Icons.favorite);
  luaSetObject(L, 'Icons.book', Icons.book);
  luaSetObject(L, 'Icons.star', Icons.star);
  luaSetObject(L, 'Icons.search', Icons.search);
  luaSetObject(L, 'Icons.question_mark', Icons.question_mark);
  luaSetObject(L, 'Icons.call_made', Icons.call_made);
  luaSetObject(L, 'Icons.double_arrow', Icons.double_arrow);
  luaSetObject(L, 'Icons.crop_rotate', Icons.crop_rotate);
  luaSetObject(L, 'Icons.drag_indicator', Icons.drag_indicator);
  luaSetObject(L, 'Icons.download', Icons.download);
  luaSetObject(L, 'Icons.download_done', Icons.download_done);
  luaSetObject(L, 'Icons.ac_unit', Icons.ac_unit);
  luaSetObject(L, 'Icons.access_alarm', Icons.access_alarm);
  luaSetObject(L, 'Icons.add_circle', Icons.add_circle);
  luaSetObject(L, 'Icons.adjust', Icons.adjust);
  luaSetObject(L, 'Icons.airline_stops', Icons.airline_stops);
  luaSetObject(L, 'Icons.all_inclusive', Icons.all_inclusive);
  luaSetObject(L, 'Icons.all_out', Icons.all_out);
  luaSetObject(L, 'Icons.alt_route', Icons.alt_route);
  luaSetObject(L, 'Icons.alternate_email', Icons.alternate_email);
  luaSetObject(L, 'Icons.anchor', Icons.anchor);
  luaSetObject(L, 'Icons.abc', Icons.abc);
  luaSetObject(L, 'Icons.arrow_drop_up', Icons.arrow_drop_up);
  luaSetObject(L, 'Icons.arrow_drop_down', Icons.arrow_drop_down);
  luaSetObject(L, 'Icons.arrow_right', Icons.arrow_right);
  luaSetObject(L, 'Icons.arrow_left', Icons.arrow_left);
  luaSetObject(L, 'Icons.add', Icons.add);
  luaSetObject(L, 'Icons.remove', Icons.remove);
  luaSetObject(L, 'Icons.play_arrow', Icons.play_arrow);
  luaSetObject(L, 'Icons.stop', Icons.stop);
  luaSetObject(L, 'Icons.person', Icons.person);
  luaSetObject(L, 'Icons.home', Icons.home);
  luaSetObject(L, 'Icons.lock', Icons.lock);
  luaSetObject(L, 'Icons.edit', Icons.edit);
  luaSetObject(L, 'Icons.close', Icons.close);
  luaSetObject(L, 'Icons.article', Icons.article);
  luaSetObject(L, 'Icons.folder_open', Icons.folder_open);
  luaSetObject(L, 'Icons.folder', Icons.folder);
  luaSetObject(L, 'Icons.terrain', Icons.terrain);
  luaSetObject(L, 'Icons.casino', Icons.casino);
  luaSetObject(L, 'Icons.circle', Icons.circle);
  luaSetObject(L, 'Icons.square', Icons.square);
  luaSetObject(L, 'Icons.arrow_upward', Icons.arrow_upward);
  luaSetObject(L, 'Icons.more_vert', Icons.more_vert);
  luaSetObject(L, 'Icons.more_horiz', Icons.more_horiz);
  luaSetObject(L, 'Icons.change_circle', Icons.change_circle);
  luaSetObject(L, 'Icons.delete', Icons.delete);
  luaSetObject(L, 'Icons.location_searching', Icons.location_searching);

  assert((){var b = (luaGetValue(L, 'TextDirection') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'TextDirection.rtl', TextDirection.rtl);
  luaSetObject(L, 'TextDirection.ltr', TextDirection.ltr);

  assert((){var b = (luaGetValue(L, 'CrossAxisAlignment') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'CrossAxisAlignment.start', CrossAxisAlignment.start);
  luaSetObject(L, 'CrossAxisAlignment.end', CrossAxisAlignment.end);
  luaSetObject(L, 'CrossAxisAlignment.center', CrossAxisAlignment.center);
  luaSetObject(L, 'CrossAxisAlignment.stretch', CrossAxisAlignment.stretch);
  luaSetObject(L, 'CrossAxisAlignment.baseline', CrossAxisAlignment.baseline);

  assert((){var b = (luaGetValue(L, 'TextOverflow') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'TextOverflow.clip', TextOverflow.clip);
  luaSetObject(L, 'TextOverflow.fade', TextOverflow.fade);
  luaSetObject(L, 'TextOverflow.ellipsis', TextOverflow.ellipsis);
  luaSetObject(L, 'TextOverflow.visible', TextOverflow.visible);

  assert((){var b = (luaGetValue(L, 'Curves') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'Curves.linear', Curves.linear);
  luaSetObject(L, 'Curves.decelerate', Curves.decelerate);
  luaSetObject(L, 'Curves.fastLinearToSlowEaseIn', Curves.fastLinearToSlowEaseIn);
  luaSetObject(L, 'Curves.ease', Curves.ease);
  luaSetObject(L, 'Curves.easeIn', Curves.easeIn);
  luaSetObject(L, 'Curves.easeInToLinear', Curves.easeInToLinear);
  luaSetObject(L, 'Curves.easeInSine', Curves.easeInSine);
  luaSetObject(L, 'Curves.easeInQuad', Curves.easeInQuad);
  luaSetObject(L, 'Curves.easeInCubic', Curves.easeInCubic);
  luaSetObject(L, 'Curves.easeInQuart', Curves.easeInQuart);
  luaSetObject(L, 'Curves.easeInQuint', Curves.easeInQuint);
  luaSetObject(L, 'Curves.easeInExpo', Curves.easeInExpo);
  luaSetObject(L, 'Curves.easeInCirc', Curves.easeInCirc);
  luaSetObject(L, 'Curves.easeInBack', Curves.easeInBack);
  luaSetObject(L, 'Curves.easeOut', Curves.easeOut);
  luaSetObject(L, 'Curves.linearToEaseOut', Curves.linearToEaseOut);
  luaSetObject(L, 'Curves.easeOutSine', Curves.easeOutSine);
  luaSetObject(L, 'Curves.easeOutQuad', Curves.easeOutQuad);
  luaSetObject(L, 'Curves.easeOutCubic', Curves.easeOutCubic);
  luaSetObject(L, 'Curves.easeOutQuart', Curves.easeOutQuart);
  luaSetObject(L, 'Curves.easeOutQuint', Curves.easeOutQuint);
  luaSetObject(L, 'Curves.easeOutExpo', Curves.easeOutExpo);
  luaSetObject(L, 'Curves.easeOutCirc', Curves.easeOutCirc);
  luaSetObject(L, 'Curves.easeOutBack', Curves.easeOutBack);
  luaSetObject(L, 'Curves.easeInOut', Curves.easeInOut);
  luaSetObject(L, 'Curves.easeInOutSine', Curves.easeInOutSine);
  luaSetObject(L, 'Curves.easeInOutQuad', Curves.easeInOutQuad);
  luaSetObject(L, 'Curves.easeInOutCubic', Curves.easeInOutCubic);
  luaSetObject(L, 'Curves.easeInOutCubicEmphasized', Curves.easeInOutCubicEmphasized);
  luaSetObject(L, 'Curves.easeInOutQuart', Curves.easeInOutQuart);
  luaSetObject(L, 'Curves.easeInOutQuint', Curves.easeInOutQuint);
  luaSetObject(L, 'Curves.easeInOutExpo', Curves.easeInOutExpo);
  luaSetObject(L, 'Curves.easeInOutCirc', Curves.easeInOutCirc);
  luaSetObject(L, 'Curves.easeInOutBack', Curves.easeInOutBack);
  luaSetObject(L, 'Curves.fastOutSlowIn', Curves.fastOutSlowIn);
  luaSetObject(L, 'Curves.slowMiddle', Curves.slowMiddle);
  luaSetObject(L, 'Curves.bounceIn', Curves.bounceIn);
  luaSetObject(L, 'Curves.bounceOut', Curves.bounceOut);
  luaSetObject(L, 'Curves.bounceInOut', Curves.bounceInOut);
  luaSetObject(L, 'Curves.elasticIn', Curves.elasticIn);
  luaSetObject(L, 'Curves.elasticOut', Curves.elasticOut);
  luaSetObject(L, 'Curves.elasticInOut', Curves.elasticInOut);

  assert((){var b = (luaGetValue(L, 'MainAxisAlignment') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'MainAxisAlignment.start', MainAxisAlignment.start);
  luaSetObject(L, 'MainAxisAlignment.end', MainAxisAlignment.end);
  luaSetObject(L, 'MainAxisAlignment.center', MainAxisAlignment.center);
  luaSetObject(L, 'MainAxisAlignment.spaceBetween', MainAxisAlignment.spaceBetween);
  luaSetObject(L, 'MainAxisAlignment.spaceAround', MainAxisAlignment.spaceAround);
  luaSetObject(L, 'MainAxisAlignment.spaceEvenly', MainAxisAlignment.spaceEvenly);

  assert((){var b = (luaGetValue(L, 'Clip') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'Clip.none', Clip.none);
  luaSetObject(L, 'Clip.hardEdge', Clip.hardEdge);
  luaSetObject(L, 'Clip.antiAlias', Clip.antiAlias);
  luaSetObject(L, 'Clip.antiAliasWithSaveLayer', Clip.antiAliasWithSaveLayer);

  assert((){var b = (luaGetValue(L, 'TableCellVerticalAlignment') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'TableCellVerticalAlignment.top', TableCellVerticalAlignment.top);
  luaSetObject(L, 'TableCellVerticalAlignment.middle', TableCellVerticalAlignment.middle);
  luaSetObject(L, 'TableCellVerticalAlignment.bottom', TableCellVerticalAlignment.bottom);
  luaSetObject(L, 'TableCellVerticalAlignment.baseline', TableCellVerticalAlignment.baseline);
  luaSetObject(L, 'TableCellVerticalAlignment.fill', TableCellVerticalAlignment.fill);

  assert((){var b = (luaGetValue(L, 'BorderStyle') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'BorderStyle.none', BorderStyle.none);
  luaSetObject(L, 'BorderStyle.solid', BorderStyle.solid);

  assert((){var b = (luaGetValue(L, 'Brightness') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'Brightness.dark', Brightness.dark);
  luaSetObject(L, 'Brightness.light', Brightness.light);

  assert((){var b = (luaGetValue(L, 'TextAlign') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'TextAlign.left', TextAlign.left);
  luaSetObject(L, 'TextAlign.right', TextAlign.right);
  luaSetObject(L, 'TextAlign.center', TextAlign.center);
  luaSetObject(L, 'TextAlign.justify', TextAlign.justify);
  luaSetObject(L, 'TextAlign.start', TextAlign.start);
  luaSetObject(L, 'TextAlign.end', TextAlign.end);

  assert((){var b = (luaGetValue(L, 'DecorationPosition') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'DecorationPosition.background', DecorationPosition.background);
  luaSetObject(L, 'DecorationPosition.foreground', DecorationPosition.foreground);

  assert((){var b = (luaGetValue(L, 'TooltipTriggerMode') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'TooltipTriggerMode.manual', TooltipTriggerMode.manual);
  luaSetObject(L, 'TooltipTriggerMode.longPress', TooltipTriggerMode.longPress);
  luaSetObject(L, 'TooltipTriggerMode.tap', TooltipTriggerMode.tap);

  assert((){var b = (luaGetValue(L, 'TextInputAction') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'TextInputAction.none', TextInputAction.none);
  luaSetObject(L, 'TextInputAction.unspecified', TextInputAction.unspecified);
  luaSetObject(L, 'TextInputAction.done', TextInputAction.done);
  luaSetObject(L, 'TextInputAction.go', TextInputAction.go);
  luaSetObject(L, 'TextInputAction.search', TextInputAction.search);
  luaSetObject(L, 'TextInputAction.send', TextInputAction.send);
  luaSetObject(L, 'TextInputAction.next', TextInputAction.next);
  luaSetObject(L, 'TextInputAction.previous', TextInputAction.previous);
  luaSetObject(L, 'TextInputAction.continueAction', TextInputAction.continueAction);
  luaSetObject(L, 'TextInputAction.join', TextInputAction.join);
  luaSetObject(L, 'TextInputAction.route', TextInputAction.route);
  luaSetObject(L, 'TextInputAction.emergencyCall', TextInputAction.emergencyCall);
  luaSetObject(L, 'TextInputAction.newline', TextInputAction.newline);

  assert((){var b = (luaGetValue(L, 'MainAxisSize') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'MainAxisSize.min', MainAxisSize.min);
  luaSetObject(L, 'MainAxisSize.max', MainAxisSize.max);

  assert((){var b = (luaGetValue(L, 'BoxFit') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'BoxFit.fill', BoxFit.fill);
  luaSetObject(L, 'BoxFit.contain', BoxFit.contain);
  luaSetObject(L, 'BoxFit.cover', BoxFit.cover);
  luaSetObject(L, 'BoxFit.fitWidth', BoxFit.fitWidth);
  luaSetObject(L, 'BoxFit.fitHeight', BoxFit.fitHeight);
  luaSetObject(L, 'BoxFit.none', BoxFit.none);
  luaSetObject(L, 'BoxFit.scaleDown', BoxFit.scaleDown);

  assert((){var b = (luaGetValue(L, 'ThemeMode') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'ThemeMode.system', ThemeMode.system);
  luaSetObject(L, 'ThemeMode.light', ThemeMode.light);
  luaSetObject(L, 'ThemeMode.dark', ThemeMode.dark);

  assert((){var b = (luaGetValue(L, 'MaterialState') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'MaterialState.hovered', MaterialState.hovered);
  luaSetObject(L, 'MaterialState.focused', MaterialState.focused);
  luaSetObject(L, 'MaterialState.pressed', MaterialState.pressed);
  luaSetObject(L, 'MaterialState.dragged', MaterialState.dragged);
  luaSetObject(L, 'MaterialState.selected', MaterialState.selected);
  luaSetObject(L, 'MaterialState.scrolledUnder', MaterialState.scrolledUnder);
  luaSetObject(L, 'MaterialState.disabled', MaterialState.disabled);
  luaSetObject(L, 'MaterialState.error', MaterialState.error);

  assert((){var b = (luaGetValue(L, 'Axis') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'Axis.horizontal', Axis.horizontal);
  luaSetObject(L, 'Axis.vertical', Axis.vertical);

  assert((){var b = (luaGetValue(L, 'TargetPlatform') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'TargetPlatform.android', TargetPlatform.android);
  luaSetObject(L, 'TargetPlatform.fuchsia', TargetPlatform.fuchsia);
  luaSetObject(L, 'TargetPlatform.iOS', TargetPlatform.iOS);
  luaSetObject(L, 'TargetPlatform.linux', TargetPlatform.linux);
  luaSetObject(L, 'TargetPlatform.macOS', TargetPlatform.macOS);
  luaSetObject(L, 'TargetPlatform.windows', TargetPlatform.windows);

  assert((){var b = (luaGetValue(L, 'MaterialTapTargetSize') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'MaterialTapTargetSize.padded', MaterialTapTargetSize.padded);
  luaSetObject(L, 'MaterialTapTargetSize.shrinkWrap', MaterialTapTargetSize.shrinkWrap);

  assert((){var b = (luaGetValue(L, 'TextAffinity') == LUA_TNIL); lua_pop(L, 1); return b;}());
  luaSetObject(L, 'TextAffinity.upstream', TextAffinity.upstream);
  luaSetObject(L, 'TextAffinity.downstream', TextAffinity.downstream);

}
