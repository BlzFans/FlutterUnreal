
--typescript function type
callbackFunctions = 
{
    VoidCallback = {"_getVoidCallback", "() => void"},
    GestureTapCallback = {"_getVoidCallback", "() => void"},
    GestureLongPressCallback = {"_getVoidCallback", "() => void"},
    PointerEnterEventListener = {"_getVoidCallbackT<PointerEnterEvent>", "(event:PointerEnterEvent) => void"},
    PointerExitEventListener = {"_getVoidCallbackT<PointerExitEvent>", "(event:PointerExitEvent) => void"},
    RouteFactory = {"_getRouteFactory", "(name:string) => Widget"},
    WidgetBuilder = {"_getWidgetBuilder", "(context:BuildContext) => Widget"},
    StatefulWidgetBuilder = {"_getStatefulWidgetBuilder", "(context: BuildContext, setState: () => void) => Widget"},
    StateCreator = {"_getStateCreator", "() => LState"},
    StringValueChanged = {"_getVoidCallbackT<String>", "(value: string) => void"},
    BoolValueChanged = {"_getVoidCallbackT2<bool>", "(value: boolean) => void"},
    IntValueChanged = {"_getVoidCallbackT<int>", "(value: int) => void"},
    DoubleValueChanged = {"_getVoidCallbackT<double>", "(value: double) => void"},
    TextValidateFunction = {"_getValidateFunction", "(oldValue: string, newValue: string) => boolean"},
    DragEndCallback = {"_getVoidCallbackT<DraggableDetails>", "(details: DraggableDetails) => void"},
    DraggableCanceledCallback = {"_getDraggableCanceledCallback", "(velocity: Velocity, offset: Offset) => void"},
    GestureTapDownCallback = {"_getVoidCallbackT<TapDownDetails>", "(details: TapDownDetails) => void"},
    GestureTapUpCallback = {"_getVoidCallbackT<TapUpDetails>", "(details: TapUpDetails) => void"},
    GestureTapCancelCallback = {"_getVoidCallback", "() => void"},
    GestureLongPressDownCallback = {"_getVoidCallbackT<LongPressDownDetails>", "(details: LongPressDownDetails) => void"},
    GestureLongPressCancelCallback = {"_getVoidCallback", "() => void"},
    GestureDragDownCallback = {"_getVoidCallbackT<DragDownDetails>", "(details: DragDownDetails) => void"},
    GestureLongPressStartCallback = {"_getVoidCallbackT<LongPressStartDetails>", "(details: LongPressStartDetails) => void"},
    GestureLongPressMoveUpdateCallback = {"_getVoidCallbackT<LongPressMoveUpdateDetails>", "(details: LongPressMoveUpdateDetails) => void"},
    GestureLongPressUpCallback = {"_getVoidCallback", "() => void"},
    GestureLongPressEndCallback = {"_getVoidCallbackT<LongPressEndDetails>", "(details: LongPressEndDetails) => void"},
    GestureDragStartCallback = {"_getVoidCallbackT<DragStartDetails>", "(details: DragStartDetails) => void"},
    GestureDragUpdateCallback = {"_getVoidCallbackT<DragUpdateDetails>", "(details: DragUpdateDetails) => void"},
    GestureDragEndCallback = {"_getVoidCallbackT<DragEndDetails>", "(details: DragEndDetails) => void"},
    GestureDragCancelCallback = {"_getVoidCallback", "() => void"},
    ["ValueChanged<Color>"] = {"_getVoidCallbackT<Color>", "(color: Color) => void"},
    ["ValueChanged<bool>"] = {"_getVoidCallbackT<bool>", "(value: boolean) => void"},
    ["ValueChanged<double>"] = {"_getVoidCallbackT<double>", "(value: double) => void"},
    ["ValueChanged<int>"] = {"_getVoidCallbackT<int>", "(value: int) => void"},
    ["ValueChanged<int?>"] = {"_getVoidCallbackT2<int>", "(value: int) => void"},
    ["DynamicCallback"] = {"_getDynamicCallback", "(value: any) => void"},
    ["PopupMenuItemBuilder<int>"] = {"_getPopupMenuItemBuilder", "(context: BuildContext) => PopupMenuEntry[]"},
    ["PopupMenuItemSelected<int>"] = {"_getVoidCallbackT<int>", "(action: int) => void"},
    DropdownButtonBuilder = {"_getDropdownButtonBuilder", "(context: BuildContext) => Widget[]"},
    ["ValueChanged<Set<int>>"] = {"_getVoidCallbackT<Set<int>>", "(selection: int[]) => void"},
    FrameCallback = {"_getVoidCallbackT<Duration>", "(timeStamp: Duration) => void"},
    ["MaterialPropertyResolver<Color>"] = {"_getMaterialPropertyResolverT<Color>", "(states: MaterialState[]) => Color"},
    ["MaterialPropertyResolver<BorderSide>"] = {"_getMaterialPropertyResolverT<BorderSide>", "(states: MaterialState[]) => BorderSide"},
    NullableIndexedWidgetBuilder = {"_getNullableIndexedWidgetBuilder", "(context:BuildContext, index:int) => Widget"},
}

class "Object"
class "PointerEnterEvent"
class "PointerExitEvent"
class "Widget"

class "Text" {
    "Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})",
    "Text.rich(InlineSpan textSpan, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})",
}

class "RichText" {
    "RichText({Key? key, required InlineSpan text, TextAlign textAlign = TextAlign.start, TextDirection? textDirection, bool softWrap = true, TextOverflow overflow = TextOverflow.clip, double textScaleFactor = 1.0, int? maxLines, Locale? locale, StrutStyle? strutStyle, TextWidthBasis textWidthBasis = TextWidthBasis.parent, TextHeightBehavior? textHeightBehavior, SelectionRegistrar? selectionRegistrar, Color? selectionColor})",
}

class "TextSpan" {
    "TextSpan({String? text, List<InlineSpan>? children, TextStyle? style, GestureRecognizer? recognizer, MouseCursor? mouseCursor, PointerEnterEventListener? onEnter, PointerExitEventListener? onExit, String? semanticsLabel, Locale? locale, bool? spellOut})",
}

class "WidgetSpan" {
    "WidgetSpan({required Widget child, PlaceholderAlignment alignment = PlaceholderAlignment.bottom, TextBaseline? baseline, TextStyle? style})"
}

class "TextStyle" {
    "TextStyle({bool inherit = true, Color? color, Color? backgroundColor, double? fontSize, FontWeight? fontWeight, FontStyle? fontStyle, double? letterSpacing, double? wordSpacing, TextBaseline? textBaseline, double? height, TextLeadingDistribution? leadingDistribution, Locale? locale, Paint? foreground, Paint? background, List<Shadow>? shadows, List<FontFeature>? fontFeatures, List<FontVariation>? fontVariations, TextDecoration? decoration, Color? decorationColor, TextDecorationStyle? decorationStyle, double? decorationThickness, String? debugLabel, String? fontFamily, List<String>? fontFamilyFallback, String? package, TextOverflow? overflow})",
    
    "TextStyle apply({Color? color, Color? backgroundColor})"
}

class "TextField" {
    "TextField({Key? key, TextEditingController? controller, FocusNode? focusNode, InputDecoration? decoration = const InputDecoration(), TextInputType? keyboardType, TextInputAction? textInputAction, TextCapitalization textCapitalization = TextCapitalization.none, TextStyle? style, StrutStyle? strutStyle, TextAlign textAlign = TextAlign.start, TextAlignVertical? textAlignVertical, TextDirection? textDirection, bool readOnly = false, bool? showCursor, bool autofocus = false, String obscuringCharacter = '•', bool obscureText = false, bool autocorrect = true, SmartDashesType? smartDashesType, SmartQuotesType? smartQuotesType, bool enableSuggestions = true, int? maxLines = 1, int? minLines, bool expands = false, int? maxLength, MaxLengthEnforcement? maxLengthEnforcement, StringValueChanged? onChanged, VoidCallback? onEditingComplete, StringValueChanged? onSubmitted, AppPrivateCommandCallback? onAppPrivateCommand, List<TextInputFormatter>? inputFormatters, bool? enabled, double cursorWidth = 2.0, double? cursorHeight, Radius? cursorRadius, Color? cursorColor, BoxHeightStyle selectionHeightStyle = BoxHeightStyle.tight, BoxWidthStyle selectionWidthStyle = BoxWidthStyle.tight, Brightness? keyboardAppearance, EdgeInsets scrollPadding = const EdgeInsets.all(20.0), DragStartBehavior dragStartBehavior = DragStartBehavior.start, bool? enableInteractiveSelection, TextSelectionControls? selectionControls, GestureTapCallback? onTap, TapRegionCallback? onTapOutside, MouseCursor? mouseCursor, InputCounterWidgetBuilder? buildCounter, ScrollController? scrollController, ScrollPhysics? scrollPhysics, Iterable<String>? autofillHints = const <String>[], Clip clipBehavior = Clip.hardEdge, String? restorationId, bool scribbleEnabled = true, bool enableIMEPersonalizedLearning = true, SpellCheckConfiguration? spellCheckConfiguration, TextMagnifierConfiguration? magnifierConfiguration})"
}

class "TextInputType" {
    "TextInputType.numberWithOptions({bool? signed = false, bool? decimal = false})",

    'static const TextInputType text', 
    'static const TextInputType multiline', 
    'static const TextInputType number', 
    'static const TextInputType phone', 
    'static const TextInputType datetime', 
    'static const TextInputType emailAddress', 
    'static const TextInputType url', 
    'static const TextInputType visiblePassword', 
    'static const TextInputType name', 
    'static const TextInputType streetAddress',
    'static const TextInputType none',
}

class "TextEditingController" {
    "TextEditingController({String? text})",
    "text ↔ String",
    "selection ↔ TextSelection",
    "clear() → void",
}

class "TextAlignVertical" {
    "TextAlignVertical({required double y})",

    "static const TextAlignVertical top",
    "static const TextAlignVertical center",
    "static const TextAlignVertical bottom",
}

class "Flex" {
    "Flex({Key? key, required Axis direction, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, MainAxisSize mainAxisSize = MainAxisSize.max, CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, TextDirection? textDirection, VerticalDirection verticalDirection = VerticalDirection.down, TextBaseline? textBaseline, Clip clipBehavior = Clip.none, List<Widget> children = const <Widget>[]})"
}

class "Column" {
    --super = "Flex"
    "Column({Key? key, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, MainAxisSize mainAxisSize = MainAxisSize.max, CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, TextDirection? textDirection, VerticalDirection verticalDirection = VerticalDirection.down, TextBaseline? textBaseline, List<Widget> children = const <Widget>[]})",
}

class "Row" {
    --super = "Flex"
    "Row({Key? key, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, MainAxisSize mainAxisSize = MainAxisSize.max, CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, TextDirection? textDirection, VerticalDirection verticalDirection = VerticalDirection.down, TextBaseline? textBaseline, List<Widget> children = const <Widget>[]})",
}

class "Flexible" {
    "Flexible({Key? key, int flex = 1, FlexFit fit = FlexFit.loose, required Widget child})",
}

class "Expanded" {
    --super = "Flexible",
    "Expanded({Key? key, int flex = 1, required Widget child})"
}

class "IconButton" {
    super = "Widget",
    "IconButton({Key? key, double? iconSize, VisualDensity? visualDensity, EdgeInsetsGeometry? padding, AlignmentGeometry? alignment, double? splashRadius, Color? color, Color? focusColor, Color? hoverColor, Color? highlightColor, Color? splashColor, Color? disabledColor, required VoidCallback? onPressed, MouseCursor? mouseCursor, FocusNode? focusNode, bool autofocus = false, String? tooltip, bool? enableFeedback, BoxConstraints? constraints, ButtonStyle? style, bool? isSelected, Widget? selectedIcon, required Widget icon})"
}

class "TextButton" {
    "TextButton({Key? key, required VoidCallback? onPressed, VoidCallback? onLongPress, ValueChanged<bool>? onHover, ValueChanged<bool>? onFocusChange, ButtonStyle? style, FocusNode? focusNode, bool autofocus = false, Clip clipBehavior = Clip.none, MaterialStatesController? statesController, required Widget child})",
    "TextButton.icon({Key? key, required VoidCallback? onPressed, VoidCallback? onLongPress, ValueChanged<bool>? onHover, ValueChanged<bool>? onFocusChange, ButtonStyle? style, FocusNode? focusNode, bool? autofocus, Clip? clipBehavior, MaterialStatesController? statesController, required Widget icon, required Widget label})",
    "static ButtonStyle styleFrom({Color? foregroundColor, Color? backgroundColor, Color? disabledForegroundColor, Color? disabledBackgroundColor, Color? shadowColor, Color? surfaceTintColor, Color? iconColor, Color? disabledIconColor, double? elevation, TextStyle? textStyle, EdgeInsetsGeometry? padding, Size? minimumSize, Size? fixedSize, Size? maximumSize, BorderSide? side, OutlinedBorder? shape, MouseCursor? enabledMouseCursor, MouseCursor? disabledMouseCursor, VisualDensity? visualDensity, MaterialTapTargetSize? tapTargetSize, Duration? animationDuration, bool? enableFeedback, AlignmentGeometry? alignment, InteractiveInkFeatureFactory? splashFactory})",
}

class "ElevatedButton" {
    "ElevatedButton({Key? key, required VoidCallback? onPressed, VoidCallback? onLongPress, ValueChanged<bool>? onHover, ValueChanged<bool>? onFocusChange, ButtonStyle? style, FocusNode? focusNode, bool autofocus = false, Clip clipBehavior = Clip.none, MaterialStatesController? statesController, required Widget? child})",
    "ElevatedButton.icon({Key? key, required VoidCallback? onPressed, VoidCallback? onLongPress, ValueChanged<bool>? onHover, ValueChanged<bool>? onFocusChange, ButtonStyle? style, FocusNode? focusNode, bool? autofocus, Clip? clipBehavior, MaterialStatesController? statesController, required Widget icon, required Widget label})",
    "static ButtonStyle styleFrom({Color? foregroundColor, Color? backgroundColor, Color? disabledForegroundColor, Color? disabledBackgroundColor, Color? shadowColor, Color? surfaceTintColor, double? elevation, TextStyle? textStyle, EdgeInsetsGeometry? padding, Size? minimumSize, Size? fixedSize, Size? maximumSize, BorderSide? side, OutlinedBorder? shape, MouseCursor? enabledMouseCursor, MouseCursor? disabledMouseCursor, VisualDensity? visualDensity, MaterialTapTargetSize? tapTargetSize, Duration? animationDuration, bool? enableFeedback, AlignmentGeometry? alignment, InteractiveInkFeatureFactory? splashFactory, Color? primary, Color? onPrimary, Color? onSurface})",
}

class "OutlinedButton" {
    "OutlinedButton({Key? key, required VoidCallback? onPressed, VoidCallback? onLongPress, ValueChanged<bool>? onHover, ValueChanged<bool>? onFocusChange, ButtonStyle? style, FocusNode? focusNode, bool autofocus = false, Clip clipBehavior = Clip.none, MaterialStatesController? statesController, required Widget? child})",
    "OutlinedButton.icon({Key? key, required VoidCallback? onPressed, VoidCallback? onLongPress, ButtonStyle? style, FocusNode? focusNode, bool? autofocus, Clip? clipBehavior, MaterialStatesController? statesController, required Widget icon, required Widget label})",
}

class "IconData" {
    "IconData(int codePoint, {String? fontFamily,String? fontPackage,bool matchTextDirection = false})",
    "codePoint → int",
    "fontFamily → String?",
}

class "Icon" {
    "Icon(IconData? icon, {Key? key, double? size, double? fill, double? weight, double? grade, double? opticalSize, Color? color, List<Shadow>? shadows, String? semanticLabel, TextDirection? textDirection})"
}

class "Color" {
    "Color(int value)",
    "Color.fromARGB(int a, int r, int g, int b)",
    "Color.fromRGBO(int r, int g, int b, double opacity)",
    "Color withOpacity(double opacity)",
    "Color withAlpha(int a)",
    "Color withRed(int r)",
    "Color withGreen(int g)",
    "Color withBlue(int b)",
    "double computeLuminance()",
    "static Color lerp(Color a, Color b, double t)",
    "static Color alphaBlend(Color foreground, Color background)",
    "static int getAlphaFromOpacity(double opacity)",

    "final int value",
    "int get alpha",
    "double get opacity",
    "int get red",
    "int get green",
    "int get blue",
}

class "MaterialColor" {
    super = "Color",

    "Color get shade50",
    "Color get shade100",
    "Color get shade200",
    "Color get shade300",
    "Color get shade400",
    "Color get shade500",
    "Color get shade600",
    "Color get shade700",
    "Color get shade800",
    "Color get shade900",
}

class "MaterialAccentColor" {
    super = "Color",
    "Color get shade100",
    "Color get shade200",
    "Color get shade400",
    "Color get shade700",
}

class "Colors" {
    "static const Color transparent",
    "static const Color black",
    "static const Color black87",
    "static const Color black54",
    "static const Color black45",
    "static const Color black38",
    "static const Color black26",
    "static const Color black12",
    "static const Color white",
    "static const Color white70",
    "static const Color white60",
    "static const Color white54",
    "static const Color white38",
    "static const Color white30",
    "static const Color white24",
    "static const Color white12",
    "static const Color white10",
    "static const MaterialColor red",
    "static const MaterialAccentColor redAccent",
    "static const MaterialColor pink",
    "static const MaterialAccentColor pinkAccent",
    "static const MaterialColor purple",
    "static const MaterialAccentColor purpleAccent",
    "static const MaterialColor deepPurple",
    "static const MaterialAccentColor deepPurpleAccent",
    "static const MaterialColor indigo",
    "static const MaterialAccentColor indigoAccent",
    "static const MaterialColor blue",
    "static const MaterialAccentColor blueAccent",
    "static const MaterialColor lightBlue",
    "static const MaterialAccentColor lightBlueAccent",
    "static const MaterialColor cyan",
    "static const MaterialAccentColor cyanAccent",
    "static const MaterialColor teal",
    "static const MaterialAccentColor tealAccent",
    "static const MaterialColor green",
    "static const MaterialAccentColor greenAccent",
    "static const MaterialColor lightGreen",
    "static const MaterialAccentColor lightGreenAccent",
    "static const MaterialColor lime",
    "static const MaterialAccentColor limeAccent",
    "static const MaterialColor yellow",
    "static const MaterialAccentColor yellowAccent",
    "static const MaterialColor amber",
    "static const MaterialAccentColor amberAccent",
    "static const MaterialColor orange",
    "static const MaterialAccentColor orangeAccent",
    "static const MaterialColor deepOrange",
    "static const MaterialAccentColor deepOrangeAccent",
    "static const MaterialColor brown",
    "static const MaterialColor grey",
    "static const MaterialColor blueGrey",
}

class "WidgetsBinding" {
    "static instance → WidgetsBinding",
    "void scheduleAttachRootWidget(Widget rootWidget)",
    "void scheduleWarmUpFrame()",
    "void attachRootWidget(Widget rootWidget)",
    "scheduleFrameCallback(FrameCallback callback, {bool rescheduling = false}) → int",
    "addPostFrameCallback(FrameCallback callback) → void",
    "Widget wrapWithDefaultView(Widget rootWidget)",
}

class "WidgetsFlutterBinding" {
    super = "WidgetsBinding",
    "static WidgetsBinding ensureInitialized()",
}

fn "void runApp(Widget app)"

class "MaterialApp" {
    "MaterialApp({Key? key, GlobalKey<NavigatorState>? navigatorKey, GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey, Widget? home, Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{}, String? initialRoute, RouteFactory? onGenerateRoute, InitialRouteListFactory? onGenerateInitialRoutes, RouteFactory? onUnknownRoute, List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[], TransitionBuilder? builder, String title = '', GenerateAppTitle? onGenerateTitle, Color? color, ThemeData? theme, ThemeData? darkTheme, ThemeData? highContrastTheme, ThemeData? highContrastDarkTheme, ThemeMode? themeMode = ThemeMode.system, Duration themeAnimationDuration = kThemeAnimationDuration, Curve themeAnimationCurve = Curves.linear, Locale? locale, Iterable<LocalizationsDelegate>? localizationsDelegates, LocaleListResolutionCallback? localeListResolutionCallback, LocaleResolutionCallback? localeResolutionCallback, Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], bool debugShowMaterialGrid = false, bool showPerformanceOverlay = false, bool checkerboardRasterCacheImages = false, bool checkerboardOffscreenLayers = false, bool showSemanticsDebugger = false, bool debugShowCheckedModeBanner = true, String? restorationScopeId, ScrollBehavior? scrollBehavior})",
    "MaterialApp.router({Key? key, GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey, RouteInformationProvider? routeInformationProvider, RouteInformationParser<Object>? routeInformationParser, RouterDelegate<Object>? routerDelegate, RouterConfig<Object>? routerConfig, BackButtonDispatcher? backButtonDispatcher, TransitionBuilder? builder, String title = '', GenerateAppTitle? onGenerateTitle, Color? color, ThemeData? theme, ThemeData? darkTheme, ThemeData? highContrastTheme, ThemeData? highContrastDarkTheme, ThemeMode? themeMode = ThemeMode.system, Duration themeAnimationDuration = kThemeAnimationDuration, Curve themeAnimationCurve = Curves.linear, Locale? locale, Iterable<LocalizationsDelegate>? localizationsDelegates, LocaleListResolutionCallback? localeListResolutionCallback, LocaleResolutionCallback? localeResolutionCallback, Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], bool debugShowMaterialGrid = false, bool showPerformanceOverlay = false, bool checkerboardRasterCacheImages = false, bool checkerboardOffscreenLayers = false, bool showSemanticsDebugger = false, bool debugShowCheckedModeBanner = true, String? restorationScopeId, ScrollBehavior? scrollBehavior})",
}

--[[
class "WidgetsApp" {
    "WidgetsApp({Key? key, GlobalKey<NavigatorState>? navigatorKey, RouteFactory? onGenerateRoute, InitialRouteListFactory? onGenerateInitialRoutes, RouteFactory? onUnknownRoute, List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[], String? initialRoute, PageRouteFactory? pageRouteBuilder, Widget? home, Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{}, TransitionBuilder? builder, String title = '', GenerateAppTitle? onGenerateTitle, TextStyle? textStyle, required Color color, Locale? locale, Iterable<LocalizationsDelegate>? localizationsDelegates, LocaleListResolutionCallback? localeListResolutionCallback, LocaleResolutionCallback? localeResolutionCallback, Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], bool showPerformanceOverlay = false, bool checkerboardRasterCacheImages = false, bool checkerboardOffscreenLayers = false, bool showSemanticsDebugger = false, bool debugShowWidgetInspector = false, bool debugShowCheckedModeBanner = true, InspectorSelectButtonBuilder? inspectorSelectButtonBuilder, String? restorationScopeId, bool useInheritedMediaQuery = false})",
    "WidgetsApp.router({Key? key, RouteInformationProvider? routeInformationProvider, RouteInformationParser<Object>? routeInformationParser, RouterDelegate<Object>? routerDelegate, RouterConfig<Object>? routerConfig, BackButtonDispatcher? backButtonDispatcher, TransitionBuilder? builder, String title = '', GenerateAppTitle? onGenerateTitle, TextStyle? textStyle, required Color color, Locale? locale, Iterable<LocalizationsDelegate>? localizationsDelegates, LocaleListResolutionCallback? localeListResolutionCallback, LocaleResolutionCallback? localeResolutionCallback, Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], bool showPerformanceOverlay = false, bool checkerboardRasterCacheImages = false, bool checkerboardOffscreenLayers = false, bool showSemanticsDebugger = false, bool debugShowWidgetInspector = false, bool debugShowCheckedModeBanner = true, InspectorSelectButtonBuilder? inspectorSelectButtonBuilder, String? restorationScopeId, bool useInheritedMediaQuery = false})",
}

class "CupertinoApp" {
    "CupertinoApp({Key? key, GlobalKey<NavigatorState>? navigatorKey, Widget? home, CupertinoThemeData? theme, Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}, String? initialRoute, RouteFactory? onGenerateRoute, InitialRouteListFactory? onGenerateInitialRoutes, RouteFactory? onUnknownRoute, List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[], TransitionBuilder? builder, String title = '', GenerateAppTitle? onGenerateTitle, Color? color, Locale? locale, Iterable<LocalizationsDelegate>? localizationsDelegates, LocaleListResolutionCallback? localeListResolutionCallback, LocaleResolutionCallback? localeResolutionCallback, Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], bool showPerformanceOverlay = false, bool checkerboardRasterCacheImages = false, bool checkerboardOffscreenLayers = false, bool showSemanticsDebugger = false, bool debugShowCheckedModeBanner = true, String? restorationScopeId, ScrollBehavior? scrollBehavior, bool useInheritedMediaQuery = false})",
    "CupertinoApp.router({Key? key, RouteInformationProvider? routeInformationProvider, RouteInformationParser<Object>? routeInformationParser, RouterDelegate<Object>? routerDelegate, BackButtonDispatcher? backButtonDispatcher, RouterConfig<Object>? routerConfig, CupertinoThemeData? theme, TransitionBuilder? builder, String title = '', GenerateAppTitle? onGenerateTitle, Color? color, Locale? locale, Iterable<LocalizationsDelegate>? localizationsDelegates, LocaleListResolutionCallback? localeListResolutionCallback, LocaleResolutionCallback? localeResolutionCallback, Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], bool showPerformanceOverlay = false, bool checkerboardRasterCacheImages = false, bool checkerboardOffscreenLayers = false, bool showSemanticsDebugger = false, bool debugShowCheckedModeBanner = true, String? restorationScopeId, ScrollBehavior? scrollBehavior, bool useInheritedMediaQuery = false})",
}
]]

class "ThemeData" {
    "ThemeData({bool? useMaterial3, MaterialColor? primarySwatch, Brightness? brightness, Color? colorSchemeSeed})",
    "final ColorScheme colorScheme",
    "final TextTheme textTheme",
    "final TextTheme primaryTextTheme",

    "final Color dialogBackgroundColor",
    "final Color disabledColor",
    "final Color dividerColor",

    "final Color focusColor",  
    "final Color highlightColor",
    "final Color hintColor",
    "final Color hoverColor",
    "final Color indicatorColor",
    "final Color primaryColor",
    "final Color primaryColorDark",  
    "final Color primaryColorLight",
    "final Color scaffoldBackgroundColor",
    "final Color secondaryHeaderColor",

    "final Color shadowColor",
    "final Color splashColor",
    "final Color unselectedWidgetColor",

    "copyWith({bool? applyElevationOverlayColor, NoDefaultCupertinoThemeData? cupertinoOverrideTheme, Iterable<ThemeExtension>? extensions, InputDecorationTheme? inputDecorationTheme, MaterialTapTargetSize? materialTapTargetSize, PageTransitionsTheme? pageTransitionsTheme, TargetPlatform? platform, ScrollbarThemeData? scrollbarTheme, InteractiveInkFeatureFactory? splashFactory, bool? useMaterial3, VisualDensity? visualDensity, Brightness? brightness, Color? canvasColor, Color? cardColor, ColorScheme? colorScheme, Color? dialogBackgroundColor, Color? disabledColor, Color? dividerColor, Color? focusColor, Color? highlightColor, Color? hintColor, Color? hoverColor, Color? indicatorColor, Color? primaryColor, Color? primaryColorDark, Color? primaryColorLight, Color? scaffoldBackgroundColor, Color? secondaryHeaderColor, Color? shadowColor, Color? splashColor, Color? unselectedWidgetColor, IconThemeData? iconTheme, IconThemeData? primaryIconTheme, TextTheme? primaryTextTheme, TextTheme? textTheme, Typography? typography, AppBarTheme? appBarTheme, BadgeThemeData? badgeTheme, MaterialBannerThemeData? bannerTheme, BottomAppBarTheme? bottomAppBarTheme, BottomNavigationBarThemeData? bottomNavigationBarTheme, BottomSheetThemeData? bottomSheetTheme, ButtonBarThemeData? buttonBarTheme, ButtonThemeData? buttonTheme, CardTheme? cardTheme, CheckboxThemeData? checkboxTheme, ChipThemeData? chipTheme, DataTableThemeData? dataTableTheme, DialogTheme? dialogTheme, DividerThemeData? dividerTheme, DrawerThemeData? drawerTheme, ElevatedButtonThemeData? elevatedButtonTheme, ExpansionTileThemeData? expansionTileTheme, FilledButtonThemeData? filledButtonTheme, FloatingActionButtonThemeData? floatingActionButtonTheme, IconButtonThemeData? iconButtonTheme, ListTileThemeData? listTileTheme, MenuBarThemeData? menuBarTheme, MenuButtonThemeData? menuButtonTheme, MenuThemeData? menuTheme, NavigationBarThemeData? navigationBarTheme, NavigationDrawerThemeData? navigationDrawerTheme, NavigationRailThemeData? navigationRailTheme, OutlinedButtonThemeData? outlinedButtonTheme, PopupMenuThemeData? popupMenuTheme, ProgressIndicatorThemeData? progressIndicatorTheme, RadioThemeData? radioTheme, SegmentedButtonThemeData? segmentedButtonTheme, SliderThemeData? sliderTheme, SnackBarThemeData? snackBarTheme, SwitchThemeData? switchTheme, TabBarTheme? tabBarTheme, TextButtonThemeData? textButtonTheme, TextSelectionThemeData? textSelectionTheme, TimePickerThemeData? timePickerTheme, ToggleButtonsThemeData? toggleButtonsTheme, TooltipThemeData? tooltipTheme, bool? fixTextFieldOutlineLabel, Brightness? primaryColorBrightness, AndroidOverscrollIndicator? androidOverscrollIndicator, Color? toggleableActiveColor, Color? selectedRowColor, Color? errorColor, Color? backgroundColor, Color? bottomAppBarColor}) → ThemeData",
}

class "Theme" {
    "Theme({Key? key, required ThemeData data, required Widget child})",
    "static ThemeData of(BuildContext context)",
}

class "ColorScheme" {
    "ColorScheme({required Brightness brightness, required Color primary, required Color onPrimary, Color? primaryContainer, Color? onPrimaryContainer, required Color secondary, required Color onSecondary, Color? secondaryContainer, Color? onSecondaryContainer, Color? tertiary, Color? onTertiary, Color? tertiaryContainer, Color? onTertiaryContainer, required Color error, required Color onError, Color? errorContainer, Color? onErrorContainer, required Color background, required Color onBackground, required Color surface, required Color onSurface, Color? surfaceVariant, Color? onSurfaceVariant, Color? outline, Color? outlineVariant, Color? shadow, Color? scrim, Color? inverseSurface, Color? onInverseSurface, Color? inversePrimary, Color? surfaceTint})",
    "ColorScheme.dark({Brightness brightness = Brightness.dark, Color primary = const Color(0xffbb86fc), Color onPrimary = Colors.black, Color? primaryContainer, Color? onPrimaryContainer, Color secondary = const Color(0xff03dac6), Color onSecondary = Colors.black, Color? secondaryContainer, Color? onSecondaryContainer, Color? tertiary, Color? onTertiary, Color? tertiaryContainer, Color? onTertiaryContainer, Color error = const Color(0xffcf6679), Color onError = Colors.black, Color? errorContainer, Color? onErrorContainer, Color background = const Color(0xff121212), Color onBackground = Colors.white, Color surface = const Color(0xff121212), Color onSurface = Colors.white, Color? surfaceVariant, Color? onSurfaceVariant, Color? outline, Color? outlineVariant, Color? shadow, Color? scrim, Color? inverseSurface, Color? onInverseSurface, Color? inversePrimary, Color? surfaceTint})",
    "ColorScheme.fromSeed({required Color seedColor, Brightness brightness = Brightness.light, Color? primary, Color? onPrimary, Color? primaryContainer, Color? onPrimaryContainer, Color? secondary, Color? onSecondary, Color? secondaryContainer, Color? onSecondaryContainer, Color? tertiary, Color? onTertiary, Color? tertiaryContainer, Color? onTertiaryContainer, Color? error, Color? onError, Color? errorContainer, Color? onErrorContainer, Color? outline, Color? outlineVariant, Color? background, Color? onBackground, Color? surface, Color? onSurface, Color? surfaceVariant, Color? onSurfaceVariant, Color? inverseSurface, Color? onInverseSurface, Color? inversePrimary, Color? shadow, Color? scrim, Color? surfaceTint})",
    "ColorScheme.fromSwatch({MaterialColor primarySwatch = Colors.blue, Color? primaryColorDark, Color? accentColor, Color? cardColor, Color? backgroundColor, Color? errorColor, Brightness brightness = Brightness.light})",
    "ColorScheme.highContrastDark({Brightness brightness = Brightness.dark, Color primary = const Color(0xffefb7ff), Color onPrimary = Colors.black, Color? primaryContainer, Color? onPrimaryContainer, Color secondary = const Color(0xff66fff9), Color onSecondary = Colors.black, Color? secondaryContainer, Color? onSecondaryContainer, Color? tertiary, Color? onTertiary, Color? tertiaryContainer, Color? onTertiaryContainer, Color error = const Color(0xff9b374d), Color onError = Colors.black, Color? errorContainer, Color? onErrorContainer, Color background = const Color(0xff121212), Color onBackground = Colors.white, Color surface = const Color(0xff121212), Color onSurface = Colors.white, Color? surfaceVariant, Color? onSurfaceVariant, Color? outline, Color? outlineVariant, Color? shadow, Color? scrim, Color? inverseSurface, Color? onInverseSurface, Color? inversePrimary, Color? surfaceTint})",
    "ColorScheme.highContrastLight({Brightness brightness = Brightness.light, Color primary = const Color(0xff0000ba), Color onPrimary = Colors.white, Color? primaryContainer, Color? onPrimaryContainer, Color secondary = const Color(0xff66fff9), Color onSecondary = Colors.black, Color? secondaryContainer, Color? onSecondaryContainer, Color? tertiary, Color? onTertiary, Color? tertiaryContainer, Color? onTertiaryContainer, Color error = const Color(0xff790000), Color onError = Colors.white, Color? errorContainer, Color? onErrorContainer, Color background = Colors.white, Color onBackground = Colors.black, Color surface = Colors.white, Color onSurface = Colors.black, Color? surfaceVariant, Color? onSurfaceVariant, Color? outline, Color? outlineVariant, Color? shadow, Color? scrim, Color? inverseSurface, Color? onInverseSurface, Color? inversePrimary, Color? surfaceTint})",
    "ColorScheme.light({Brightness brightness = Brightness.light, Color primary = const Color(0xff6200ee), Color onPrimary = Colors.white, Color? primaryContainer, Color? onPrimaryContainer, Color secondary = const Color(0xff03dac6), Color onSecondary = Colors.black, Color? secondaryContainer, Color? onSecondaryContainer, Color? tertiary, Color? onTertiary, Color? tertiaryContainer, Color? onTertiaryContainer, Color error = const Color(0xffb00020), Color onError = Colors.white, Color? errorContainer, Color? onErrorContainer, Color background = Colors.white, Color onBackground = Colors.black, Color surface = Colors.white, Color onSurface = Colors.black, Color? surfaceVariant, Color? onSurfaceVariant, Color? outline, Color? outlineVariant, Color? shadow, Color? scrim, Color? inverseSurface, Color? onInverseSurface, Color? inversePrimary, Color? surfaceTint})",

    "background → Color",
    "brightness → Brightness",
    "error → Color",
    "errorContainer → Color",
    "inversePrimary → Color",
    "inverseSurface → Color",
    "onBackground → Color",
    "onError → Color",
    "onErrorContainer → Color",
    "onInverseSurface → Color",
    "onPrimary → Color",
    "onPrimaryContainer → Color",
    "onSecondary → Color",
    "onSecondaryContainer → Color",
    "onSurface → Color",
    "onSurfaceVariant → Color",
    "onTertiary → Color",
    "onTertiaryContainer → Color",
    "outline → Color",
    "outlineVariant → Color",
    "primary → Color",
    "primaryContainer → Color",
    "scrim → Color",
    "secondary → Color",
    "secondaryContainer → Color",
    "shadow → Color",
    "surface → Color",
    "surfaceTint → Color",
    "surfaceVariant → Color",
    "tertiary → Color",
    "tertiaryContainer → Color",

    "ColorScheme copyWith({Brightness? brightness, Color? primary, Color? onPrimary, Color? primaryContainer, Color? onPrimaryContainer, Color? secondary, Color? onSecondary, Color? secondaryContainer, Color? onSecondaryContainer, Color? tertiary, Color? onTertiary, Color? tertiaryContainer, Color? onTertiaryContainer, Color? error, Color? onError, Color? errorContainer, Color? onErrorContainer, Color? background, Color? onBackground, Color? surface, Color? onSurface, Color? surfaceVariant, Color? onSurfaceVariant, Color? outline, Color? outlineVariant, Color? shadow, Color? scrim, Color? inverseSurface, Color? onInverseSurface, Color? inversePrimary, Color? surfaceTint, Color? primaryVariant, Color? secondaryVariant})",
    "static ColorScheme lerp(ColorScheme a, ColorScheme b, double t)",
}

class "TextTheme" {
    "final TextStyle? displayLarge",
    "final TextStyle? displayMedium",
    "final TextStyle? displaySmall",
    "final TextStyle? headlineLarge",
    "final TextStyle? headlineMedium",
    "final TextStyle? headlineSmall",
    "final TextStyle? titleLarge",
    "final TextStyle? titleMedium",
    "final TextStyle? titleSmall",
    "final TextStyle? bodyLarge",
    "final TextStyle? bodyMedium",
    "final TextStyle? bodySmall",
    "final TextStyle? labelLarge",
    "final TextStyle? labelMedium",
    "final TextStyle? labelSmall",
}

class "NavigationService" {
    "static GlobalKey<NavigatorState> navigatorKey",
    "static BuildContext context()",
}

class "Navigator" {
    "static NavigatorState of(BuildContext context, {bool rootNavigator = false})"
}

class "NavigatorState" {
    "void pushReplacementNamed(String routeName)",
    "void popAndPushNamed(String routeName)",
    "void pushNamed(String routeName)",
    "canPop() → bool",
    "void pop(Object? result)",
    "void push(Route route)",
    "removeRoute(Route route) → void",
}

class "Route"

class "DialogRoute" {
    super = "Route",
    "DialogRoute({required BuildContext context, required WidgetBuilder builder, CapturedThemes? themes, Color? barrierColor = Colors.black54, bool barrierDismissible = true, String? barrierLabel, bool useSafeArea = true, RouteSettings? settings, Offset? anchorPoint})"
}

class "Center" {
    "Center({Key? key, double? widthFactor, double? heightFactor, Widget? child})"
}

class "LStatelessWidget" {
    "LStatelessWidget({Key? key, required WidgetBuilder builder})"
}

class "LStatefulWidget" {
    "LStatefulWidget({Key? key, required StateCreator stateCreator})"
}

class "LState" {
    "LState({required WidgetBuilder builder, VoidCallback? onInit})",
    "void markNeedsBuild ()"
}

class "Builder" {
    "Builder({Key? key, required WidgetBuilder builder})",
}

class "StatefulBuilder" {
    "StatefulBuilder({Key? key, required StatefulWidgetBuilder builder})"
}

class "SizedBox" {
    "SizedBox({Key? key, double? width, double? height, Widget? child})",
    "SizedBox.expand({Key? key, Widget? child})",
    "SizedBox.fromSize({Key? key, Widget? child, Size? size})",
    "SizedBox.shrink({Key? key, Widget? child})",
    "SizedBox.square({Key? key, Widget? child, double? dimension})",
}

class "Spacer" {
    "Spacer({Key? key, int flex = 1})"
}

class "Material" {
    "Material({Key? key, MaterialType type = MaterialType.canvas, double elevation = 0.0, Color? color, Color? shadowColor, Color? surfaceTintColor, TextStyle? textStyle, BorderRadiusGeometry? borderRadius, ShapeBorder? shape, bool borderOnForeground = true, Clip clipBehavior = Clip.none, Duration animationDuration = kThemeChangeDuration, Widget? child})",
}

class "InkWell" {
    "InkWell({Key? key, Widget? child, GestureTapCallback? onTap, GestureTapCallback? onDoubleTap, GestureLongPressCallback? onLongPress, GestureTapDownCallback? onTapDown, GestureTapUpCallback? onTapUp, GestureTapCallback? onTapCancel, GestureTapCallback? onSecondaryTap, GestureTapUpCallback? onSecondaryTapUp, GestureTapDownCallback? onSecondaryTapDown, GestureTapCallback? onSecondaryTapCancel, ValueChanged<bool>? onHighlightChanged, ValueChanged<bool>? onHover, MouseCursor? mouseCursor, Color? focusColor, Color? hoverColor, Color? highlightColor, MaterialStateProperty<Color?>? overlayColor, Color? splashColor, InteractiveInkFeatureFactory? splashFactory, double? radius, BorderRadius? borderRadius, ShapeBorder? customBorder, bool? enableFeedback = true, bool excludeFromSemantics = false, FocusNode? focusNode, bool canRequestFocus = true, ValueChanged<bool>? onFocusChange, bool autofocus = false, MaterialStatesController? statesController})",
}

class "InkResponse" {
    "InkResponse({Key? key, Widget? child, GestureTapCallback? onTap, GestureTapDownCallback? onTapDown, GestureTapUpCallback? onTapUp, GestureTapCallback? onTapCancel, GestureTapCallback? onDoubleTap, GestureLongPressCallback? onLongPress, GestureTapCallback? onSecondaryTap, GestureTapUpCallback? onSecondaryTapUp, GestureTapDownCallback? onSecondaryTapDown, GestureTapCallback? onSecondaryTapCancel, ValueChanged<bool>? onHighlightChanged, ValueChanged<bool>? onHover, MouseCursor? mouseCursor, bool containedInkWell = false, BoxShape highlightShape = BoxShape.circle, double? radius, BorderRadius? borderRadius, ShapeBorder? customBorder, Color? focusColor, Color? hoverColor, Color? highlightColor, MaterialStateProperty<Color?>? overlayColor, Color? splashColor, InteractiveInkFeatureFactory? splashFactory, bool enableFeedback = true, bool excludeFromSemantics = false, FocusNode? focusNode, bool canRequestFocus = true, ValueChanged<bool>? onFocusChange, bool autofocus = false, MaterialStatesController? statesController})",
}

class "Scrollbar" {
    "Scrollbar({Key? key, required Widget child, ScrollController? controller, bool? thumbVisibility, bool? trackVisibility, double? thickness, Radius? radius, ScrollNotificationPredicate? notificationPredicate, bool? interactive, ScrollbarOrientation? scrollbarOrientation})"
}

class "ScrollController" {
    "ScrollController({double initialScrollOffset = 0.0, bool keepScrollOffset = true, String? debugLabel})"
}

class "ListView" {
    "ListView({Key? key, Axis scrollDirection = Axis.vertical, bool reverse = false, ScrollController? controller, bool? primary, ScrollPhysics? physics, bool shrinkWrap = false, EdgeInsetsGeometry? padding, double? itemExtent, Widget? prototypeItem, bool addAutomaticKeepAlives = true, bool addRepaintBoundaries = true, bool addSemanticIndexes = true, double? cacheExtent, List<Widget> children = const <Widget>[], int? semanticChildCount, DragStartBehavior dragStartBehavior = DragStartBehavior.start, ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, String? restorationId, Clip clipBehavior = Clip.hardEdge})",
    "ListView.builder({Key? key, Axis scrollDirection = Axis.vertical, bool reverse = false, ScrollController? controller, bool? primary, ScrollPhysics? physics, bool shrinkWrap = false, EdgeInsetsGeometry? padding, double? itemExtent, Widget? prototypeItem, required NullableIndexedWidgetBuilder itemBuilder, ChildIndexGetter? findChildIndexCallback, int? itemCount, bool addAutomaticKeepAlives = true, bool addRepaintBoundaries = true, bool addSemanticIndexes = true, double? cacheExtent, int? semanticChildCount, DragStartBehavior dragStartBehavior = DragStartBehavior.start, ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, String? restorationId, Clip clipBehavior = Clip.hardEdge})",
}

class "SingleChildScrollView" {
    "SingleChildScrollView({Key? key, Axis scrollDirection = Axis.vertical, bool reverse = false, EdgeInsetsGeometry? padding, bool? primary, ScrollPhysics? physics, ScrollController? controller, Widget? child, DragStartBehavior dragStartBehavior = DragStartBehavior.start, Clip clipBehavior = Clip.hardEdge, String? restorationId, ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual})",
}

class "BlockPointer" {
    "BlockPointer({Key? key, Widget? child})"
}

class "ListTile" {
    "ListTile({Key? key, Widget? leading, Widget? title, Widget? subtitle, Widget? trailing, bool isThreeLine = false, bool? dense, VisualDensity? visualDensity, ShapeBorder? shape, ListTileStyle? style, Color? selectedColor, Color? iconColor, Color? textColor, EdgeInsetsGeometry? contentPadding, bool enabled = true, GestureTapCallback? onTap, GestureLongPressCallback? onLongPress, MouseCursor? mouseCursor, bool selected = false, Color? focusColor, Color? hoverColor, Color? splashColor, FocusNode? focusNode, bool autofocus = false, Color? tileColor, Color? selectedTileColor, bool? enableFeedback, double? horizontalTitleGap, double? minVerticalPadding, double? minLeadingWidth})"
}

class "Container" {
    "Container({Key? key, AlignmentGeometry? alignment, EdgeInsetsGeometry? padding, Color? color, Decoration? decoration, Decoration? foregroundDecoration, double? width, double? height, BoxConstraints? constraints, EdgeInsetsGeometry? margin, Matrix4? transform, AlignmentGeometry? transformAlignment, Widget? child, Clip clipBehavior = Clip.none})"
}

class "Decoration" {
}

class "BoxDecoration" {
    super = "Decoration",
    "BoxDecoration({Color? color, DecorationImage? image, BoxBorder? border, BorderRadiusGeometry? borderRadius, List<BoxShadow>? boxShadow, Gradient? gradient, BlendMode? backgroundBlendMode, BoxShape shape = BoxShape.rectangle})"
}

class "ShapeDecoration" {
    super = "Decoration",
    "ShapeDecoration({Color? color, DecorationImage? image, Gradient? gradient, List<BoxShadow>? shadows, required ShapeBorder shape})",
    "ShapeDecoration.fromBoxDecoration(BoxDecoration source)",
}

class "DecoratedBox" {
    "DecoratedBox({Key? key, required Decoration decoration, DecorationPosition position = DecorationPosition.background, Widget? child})"
}

class "BorderSide" {
    "BorderSide({Color color = const Color(0xFF000000), double width = 1.0, BorderStyle style = BorderStyle.solid, double strokeAlign = BorderSide.strokeAlignInside})",
    "static const BorderSide none",
    "static const double strokeAlignInside",
    "static const double strokeAlignCenter",
    "static const double strokeAlignOutside",
}

class "Border" {
    "Border({BorderSide top = BorderSide.none, BorderSide right = BorderSide.none, BorderSide bottom = BorderSide.none, BorderSide left = BorderSide.none})",
    "Border.all({Color color = const Color(0xFF000000), double width = 1.0, BorderStyle style = BorderStyle.solid, double strokeAlign = BorderSide.strokeAlignInside})",
    "Border.fromBorderSide(BorderSide side)",
    "Border.symmetric({BorderSide vertical = BorderSide.none, BorderSide horizontal = BorderSide.none})",
}

class "Radius" {
    "Radius.circular(double radius)",
    "Radius.elliptical(double x, double y)",
    "final double x",
    "final double y",
    "static const Radius zero",
}

class "BorderRadiusGeometry" {
}

class "BorderRadius" {
    super = "BorderRadiusGeometry",
    "BorderRadius.all(Radius radius)",
    "BorderRadius.circular(double radius)",
    "BorderRadius.vertical({Radius top = Radius.zero, Radius bottom = Radius.zero})",
    "BorderRadius.horizontal({Radius left = Radius.zero, Radius right = Radius.zero})",
    "BorderRadius.only({Radius topLeft = Radius.zero, Radius topRight = Radius.zero, Radius bottomLeft = Radius.zero, Radius bottomRight = Radius.zero})",
}

class "Ink" {
    "Ink({Key? key, EdgeInsetsGeometry? padding, Color? color, Decoration? decoration, double? width, double? height, Widget? child})"
}

class "InputDecoration" {
    "InputDecoration({Widget? icon, Color? iconColor, Widget? label, String? labelText, TextStyle? labelStyle, TextStyle? floatingLabelStyle, String? helperText, TextStyle? helperStyle, int? helperMaxLines, String? hintText, TextStyle? hintStyle, TextDirection? hintTextDirection, int? hintMaxLines, String? errorText, TextStyle? errorStyle, int? errorMaxLines, FloatingLabelBehavior? floatingLabelBehavior, FloatingLabelAlignment? floatingLabelAlignment, bool isCollapsed = false, bool? isDense, EdgeInsetsGeometry? contentPadding, Widget? prefixIcon, BoxConstraints? prefixIconConstraints, Widget? prefix, String? prefixText, TextStyle? prefixStyle, Color? prefixIconColor, Widget? suffixIcon, Widget? suffix, String? suffixText, TextStyle? suffixStyle, Color? suffixIconColor, BoxConstraints? suffixIconConstraints, Widget? counter, String? counterText, TextStyle? counterStyle, bool? filled, Color? fillColor, Color? focusColor, Color? hoverColor, InputBorder? errorBorder, InputBorder? focusedBorder, InputBorder? focusedErrorBorder, InputBorder? disabledBorder, InputBorder? enabledBorder, InputBorder? border, bool enabled = true, String? semanticCounterText, bool? alignLabelWithHint, BoxConstraints? constraints})",
    "InputDecoration.collapsed({required String? hintText, FloatingLabelBehavior? floatingLabelBehavior, FloatingLabelAlignment? floatingLabelAlignment, TextStyle? hintStyle, TextDirection? hintTextDirection, bool? filled = false, Color? fillColor, Color? focusColor, Color? hoverColor, InputBorder? border = InputBorder.none, bool enabled = true})"
}

class "OutlineInputBorder" {
    "OutlineInputBorder({BorderSide borderSide = const BorderSide(), BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4.0)), double gapPadding = 4.0})"
}

class "Padding" {
    "Padding({Key? key, required EdgeInsetsGeometry padding, Widget? child})"
}

class "EdgeInsetsGeometry" {
}

class "EdgeInsets" {
    super = "EdgeInsetsGeometry",
    "EdgeInsets.all(double value)",
    "EdgeInsets.fromLTRB(double left, double top, double right, double bottom)",
    "EdgeInsets.fromWindowPadding(WindowPadding padding, double devicePixelRatio)",
    "EdgeInsets.only({double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0})",
    "EdgeInsets.symmetric({double vertical = 0.0, double horizontal = 0.0})",
    "static const EdgeInsets zero",
}

class "Size" {
    "Size(double width, double height)",
    "Size.copy(Size source)",
    "Size.fromHeight(double height)",
    "Size.fromRadius(double radius)",
    "Size.fromWidth(double width)",
    "Size.square(double dimension)",

    "aspectRatio → double",
    "flipped → Size",
    "height → double",
    "isEmpty → bool",
    "isFinite → bool",
    "isInfinite → bool",
    "longestSide → double",
    "shortestSide → double",
    "width → double",
}

class "BoxConstraints" {
    "BoxConstraints({double minWidth = 0.0, double maxWidth = double.infinity, double minHeight = 0.0, double maxHeight = double.infinity})",
    "BoxConstraints.expand({double? width, double? height})",
    "BoxConstraints.loose(Size size)",
    "BoxConstraints.tight(Size size)",
    "BoxConstraints.tightFor({double? width, double? height})",
    "BoxConstraints.tightForFinite({double width = double.infinity, double height = double.infinity})"
}

class "ConstrainedBox" {
    "ConstrainedBox({Key? key, required BoxConstraints constraints, Widget? child})"
}

class "LimitedBox" {
    "LimitedBox({Key? key, double maxWidth = double.infinity, double maxHeight = double.infinity, Widget? child})"
}

class "Checkbox" {
    "Checkbox({Key? key, required bool? value, bool tristate = false, required BoolValueChanged? onChanged, MouseCursor? mouseCursor, Color? activeColor, MaterialStateProperty<Color?>? fillColor, Color? checkColor, Color? focusColor, Color? hoverColor, MaterialStateProperty<Color?>? overlayColor, double? splashRadius, MaterialTapTargetSize? materialTapTargetSize, VisualDensity? visualDensity, FocusNode? focusNode, bool autofocus = false, OutlinedBorder? shape, BorderSide? side, bool isError = false})"
}

class "CheckboxListTile" {
    "CheckboxListTile({Key? key, required bool? value, required BoolValueChanged? onChanged, Color? activeColor, Color? checkColor, bool? enabled, Color? tileColor, Widget? title, Widget? subtitle, bool isThreeLine = false, bool? dense, Widget? secondary, bool selected = false, ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform, bool autofocus = false, EdgeInsetsGeometry? contentPadding, bool tristate = false, ShapeBorder? shape, OutlinedBorder? checkboxShape, Color? selectedTileColor, BorderSide? side, VisualDensity? visualDensity, FocusNode? focusNode, bool? enableFeedback})"
}

class "TextInputFormatter"

class "LTextInputFormatter" {
    super = "TextInputFormatter",
    "LTextInputFormatter(TextValidateFunction validateFunction)"
}

class "ClipRect" {
    "ClipRect({Key? key,CustomClipper<Rect>? clipper, Clip clipBehavior = Clip.hardEdge,Widget? child})",
}

class "ClipRRect" {
    "ClipRRect({Key? key, BorderRadiusGeometry? borderRadius = BorderRadius.zero, CustomClipper<RRect>? clipper, Clip clipBehavior = Clip.antiAlias, Widget? child})",
}

class "Tooltip" {
    "Tooltip({Key? key, String? message, InlineSpan? richMessage, double? height, EdgeInsetsGeometry? padding, EdgeInsetsGeometry? margin, double? verticalOffset, bool? preferBelow, bool? excludeFromSemantics, Decoration? decoration, TextStyle? textStyle, TextAlign? textAlign, Duration? waitDuration, Duration? showDuration, TooltipTriggerMode? triggerMode, bool? enableFeedback, TooltipTriggeredCallback? onTriggered, Widget? child})"
}

class "Table" {
    "Table({Key? key, List<TableRow> children = const <TableRow>[], Map<int, TableColumnWidth>? columnWidths, TableColumnWidth defaultColumnWidth = const FlexColumnWidth(), TextDirection? textDirection,  TableBorder? border, TableCellVerticalAlignment defaultVerticalAlignment = TableCellVerticalAlignment.top, TextBaseline? textBaseline})"
}

class "TableRow" {
    "TableRow({LocalKey? key, Decoration? decoration, List<Widget> children = const <Widget>[]})"
}

class "TableColumnWidth" {
}

class "FlexColumnWidth" {
    super = "TableColumnWidth",
    "FlexColumnWidth(double value = 1.0)"
}

class "MediaQueryData" {
    "MediaQueryData({Size size = Size.zero, double devicePixelRatio = 1.0, double textScaleFactor = 1.0, Brightness platformBrightness = Brightness.light, EdgeInsets padding = EdgeInsets.zero, EdgeInsets viewInsets = EdgeInsets.zero, EdgeInsets systemGestureInsets = EdgeInsets.zero, EdgeInsets viewPadding = EdgeInsets.zero, bool alwaysUse24HourFormat = false, bool accessibleNavigation = false, bool invertColors = false, bool highContrast = false, bool disableAnimations = false, bool boldText = false, NavigationMode navigationMode = NavigationMode.traditional, DeviceGestureSettings gestureSettings = const DeviceGestureSettings(touchSlop: kTouchSlop), List<DisplayFeature> displayFeatures = const <DisplayFeature>[]})",
    
    "final Size size",
    "final double devicePixelRatio",
}

class "MediaQuery" {
    "MediaQuery({Key? key, required MediaQueryData data, required Widget child})",
    "MediaQuery.removePadding({Key? key, required BuildContext context, bool removeLeft = false, bool removeTop = false, bool removeRight = false, bool removeBottom = false, required Widget child})",
    "MediaQuery.removeViewInsets({Key? key, required BuildContext context, bool removeLeft = false, bool removeTop = false, bool removeRight = false, bool removeBottom = false, required Widget child})",
    "MediaQuery.removeViewPadding({Key? key, required BuildContext context, bool removeLeft = false, bool removeTop = false, bool removeRight = false, bool removeBottom = false, required Widget child})",
    
    "static MediaQueryData of(BuildContext context)",
}

class "Offset" {
    "Offset(double dx, double dy)",
    "double get dx",
    "double get dy",

    "static const Offset zero",
    "static const Offset infinite",
}

class "AlignmentGeometry"

class "Alignment" {
    super = "AlignmentGeometry",

    "Alignment(double x, double y)",
    "static const Alignment topLeft",
    "static const Alignment topCenter",
    "static const Alignment topRight",
    "static const Alignment centerLeft",  
    "static const Alignment center",
    "static const Alignment centerRight",
    "static const Alignment bottomLeft",
    "static const Alignment bottomCenter",
    "static const Alignment bottomRight",
}

class "FractionalOffset" {
    super = "Alignment",
    
    "FractionalOffset(double dx, double dy)",
    "dx → double",
    "dy → double",

    "static const FractionalOffset topLeft",
    "static const FractionalOffset topCenter",
    "static const FractionalOffset topRight",
    "static const FractionalOffset centerLeft",
    "static const FractionalOffset center",
    "static const FractionalOffset centerRight",
    "static const FractionalOffset bottomLeft",
    "static const FractionalOffset bottomCenter",
    "static const FractionalOffset bottomRight",
}

class "Align" {
    "Align({Key? key, AlignmentGeometry alignment = Alignment.center, double? widthFactor, double? heightFactor, Widget? child})",
}

class "DefaultTextStyle" {
    "DefaultTextStyle({Key? key, required TextStyle style, TextAlign? textAlign, bool softWrap = true, TextOverflow overflow = TextOverflow.clip, int? maxLines, TextWidthBasis textWidthBasis = TextWidthBasis.parent, TextHeightBehavior? textHeightBehavior, required Widget child})",
}

class "SliderTheme" {
    "SliderTheme({Key? key, required SliderThemeData data, required Widget child})"
}

class "SliderThemeData" {
    "SliderThemeData({double? trackHeight, Color? activeTrackColor, Color? inactiveTrackColor, Color? secondaryActiveTrackColor, Color? disabledActiveTrackColor, Color? disabledInactiveTrackColor, Color? disabledSecondaryActiveTrackColor, Color? activeTickMarkColor, Color? inactiveTickMarkColor, Color? disabledActiveTickMarkColor, Color? disabledInactiveTickMarkColor, Color? thumbColor, Color? overlappingShapeStrokeColor, Color? disabledThumbColor, Color? overlayColor, Color? valueIndicatorColor, SliderComponentShape? overlayShape, SliderTickMarkShape? tickMarkShape, SliderComponentShape? thumbShape, SliderTrackShape? trackShape, SliderComponentShape? valueIndicatorShape, RangeSliderTickMarkShape? rangeTickMarkShape, RangeSliderThumbShape? rangeThumbShape, RangeSliderTrackShape? rangeTrackShape, RangeSliderValueIndicatorShape? rangeValueIndicatorShape, ShowValueIndicator? showValueIndicator, TextStyle? valueIndicatorTextStyle, double? minThumbSeparation, RangeThumbSelector? thumbSelector, MaterialStateProperty<MouseCursor?>? mouseCursor})"
}

class "SliderComponentShape" {
    "static final SliderComponentShape noThumb",
    "static final SliderComponentShape noOverlay",
}

class "Slider" {
    "Slider({Key? key, required double value, double? secondaryTrackValue, required DoubleValueChanged? onChanged, DoubleValueChanged? onChangeStart, DoubleValueChanged? onChangeEnd, double min = 0.0, double max = 1.0, int? divisions, String? label, Color? activeColor, Color? inactiveColor, Color? secondaryActiveColor, Color? thumbColor, MaterialStateProperty<Color?>? overlayColor, MouseCursor? mouseCursor, SemanticFormatterCallback? semanticFormatterCallback, FocusNode? focusNode, bool autofocus = false})",
}

class "Stack" {
    "Stack({Key? key, AlignmentGeometry alignment = AlignmentDirectional.topStart, TextDirection? textDirection, StackFit fit = StackFit.loose, Clip clipBehavior = Clip.hardEdge, List<Widget> children = const <Widget>[]})"
}

class "Positioned" {
    "Positioned({Key? key, double? left, double? top, double? right, double? bottom, double? width, double? height, required Widget child})",
    "Positioned.directional({Key? key, required TextDirection textDirection, double? start, double? top, double? end, double? bottom, double? width, double? height, required Widget child})",
    "Positioned.fill({Key? key, double? left = 0.0, double? top = 0.0, double? right = 0.0, double? bottom = 0.0, required Widget child})",
    "Positioned.fromRect({Key? key, required Rect rect, required Widget child})",
    "Positioned.fromRelativeRect({Key? key, required RelativeRect rect, required Widget child})",
}

class "LongPressDraggable" {
    "LongPressDraggable({Key? key, required Widget child, required Widget feedback, Object? data, Axis? axis, Widget? childWhenDragging, Offset feedbackOffset = Offset.zero, DragAnchorStrategy dragAnchorStrategy = childDragAnchorStrategy, int? maxSimultaneousDrags, VoidCallback? onDragStarted, DragUpdateCallback? onDragUpdate, DraggableCanceledCallback? onDraggableCanceled, DragEndCallback? onDragEnd, VoidCallback? onDragCompleted, bool hapticFeedbackOnStart = true, bool ignoringFeedbackSemantics = true, bool ignoringFeedbackPointer = true, Duration delay = kLongPressTimeout})"
}

class "Draggable" {
    "Draggable({Key? key, required Widget child, required Widget feedback, Object? data, Axis? axis, Widget? childWhenDragging, Offset feedbackOffset = Offset.zero, DragAnchorStrategy dragAnchorStrategy = childDragAnchorStrategy, Axis? affinity, int? maxSimultaneousDrags, VoidCallback? onDragStarted, DragUpdateCallback? onDragUpdate, DraggableCanceledCallback? onDraggableCanceled, DragEndCallback? onDragEnd, VoidCallback? onDragCompleted, bool ignoringFeedbackSemantics = true, bool ignoringFeedbackPointer = true, bool rootOverlay = false, HitTestBehavior hitTestBehavior = HitTestBehavior.deferToChild})",
}

class "DragTarget" {
    "DragTarget({Key? key, required DragTargetBuilder<Object> builder, DragTargetWillAccept<Object>? onWillAccept, DragTargetAccept<Object>? onAccept, DragTargetAcceptWithDetails<Object>? onAcceptWithDetails, DragTargetLeave<Object>? onLeave, DragTargetMove<Object>? onMove, HitTestBehavior hitTestBehavior = HitTestBehavior.translucent})"
}

class "DraggableDetails" {
    "final bool wasAccepted",
    "final Velocity velocity",
    "final Offset offset",
}

class "Opacity" {
    "Opacity({Key? key, required double opacity, bool alwaysIncludeSemantics = false, Widget? child})",
}

class "ColoredBox" {
    "ColoredBox({Key? key, required Color color, Widget? child})",
}

class "Velocity" {
    "static const Velocity zero",
    "final Offset pixelsPerSecond",
}

class "Divider" {
    "Divider({Key? key, double? height, double? thickness, double? indent, double? endIndent, Color? color})"
}

class "VerticalDivider" {
    "VerticalDivider({Key? key, double? width, double? thickness, double? indent, double? endIndent, Color? color})"
}

class "Wrap" {
    "Wrap({Key? key,Axis direction = Axis.horizontal,WrapAlignment alignment = WrapAlignment.start,double spacing = 0.0,WrapAlignment runAlignment = WrapAlignment.start,double runSpacing = 0.0,WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,TextDirection? textDirection,VerticalDirection verticalDirection = VerticalDirection.down,Clip clipBehavior = Clip.none,List<Widget> children = const <Widget>[]})",
}

class "GestureDetector" {
    "GestureDetector({Key? key, Widget? child, GestureTapDownCallback? onTapDown, GestureTapUpCallback? onTapUp, GestureTapCallback? onTap, GestureTapCancelCallback? onTapCancel, GestureTapCallback? onSecondaryTap, GestureTapDownCallback? onSecondaryTapDown, GestureTapUpCallback? onSecondaryTapUp, GestureTapCancelCallback? onSecondaryTapCancel, GestureTapDownCallback? onTertiaryTapDown, GestureTapUpCallback? onTertiaryTapUp, GestureTapCancelCallback? onTertiaryTapCancel, GestureTapDownCallback? onDoubleTapDown, GestureTapCallback? onDoubleTap, GestureTapCancelCallback? onDoubleTapCancel, GestureLongPressDownCallback? onLongPressDown, GestureLongPressCancelCallback? onLongPressCancel, GestureLongPressCallback? onLongPress, GestureLongPressStartCallback? onLongPressStart, GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate, GestureLongPressUpCallback? onLongPressUp, GestureLongPressEndCallback? onLongPressEnd, GestureLongPressDownCallback? onSecondaryLongPressDown, GestureLongPressCancelCallback? onSecondaryLongPressCancel, GestureLongPressCallback? onSecondaryLongPress, GestureLongPressStartCallback? onSecondaryLongPressStart, GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate, GestureLongPressUpCallback? onSecondaryLongPressUp, GestureLongPressEndCallback? onSecondaryLongPressEnd, GestureLongPressDownCallback? onTertiaryLongPressDown, GestureLongPressCancelCallback? onTertiaryLongPressCancel, GestureLongPressCallback? onTertiaryLongPress, GestureLongPressStartCallback? onTertiaryLongPressStart, GestureLongPressMoveUpdateCallback? onTertiaryLongPressMoveUpdate, GestureLongPressUpCallback? onTertiaryLongPressUp, GestureLongPressEndCallback? onTertiaryLongPressEnd, GestureDragDownCallback? onVerticalDragDown, GestureDragStartCallback? onVerticalDragStart, GestureDragUpdateCallback? onVerticalDragUpdate, GestureDragEndCallback? onVerticalDragEnd, GestureDragCancelCallback? onVerticalDragCancel, GestureDragDownCallback? onHorizontalDragDown, GestureDragStartCallback? onHorizontalDragStart, GestureDragUpdateCallback? onHorizontalDragUpdate, GestureDragEndCallback? onHorizontalDragEnd, GestureDragCancelCallback? onHorizontalDragCancel, GestureForcePressStartCallback? onForcePressStart, GestureForcePressPeakCallback? onForcePressPeak, GestureForcePressUpdateCallback? onForcePressUpdate, GestureForcePressEndCallback? onForcePressEnd, GestureDragDownCallback? onPanDown, GestureDragStartCallback? onPanStart, GestureDragUpdateCallback? onPanUpdate, GestureDragEndCallback? onPanEnd, GestureDragCancelCallback? onPanCancel, GestureScaleStartCallback? onScaleStart, GestureScaleUpdateCallback? onScaleUpdate, GestureScaleEndCallback? onScaleEnd, HitTestBehavior? behavior, bool excludeFromSemantics = false, DragStartBehavior dragStartBehavior = DragStartBehavior.start, Set<PointerDeviceKind>? supportedDevices})",
}

--[[
class "Listener" {
    "Listener({Key? key, PointerDownEventListener? onPointerDown, PointerMoveEventListener? onPointerMove, PointerUpEventListener? onPointerUp, PointerHoverEventListener? onPointerHover, PointerCancelEventListener? onPointerCancel, PointerPanZoomStartEventListener? onPointerPanZoomStart, PointerPanZoomUpdateEventListener? onPointerPanZoomUpdate, PointerPanZoomEndEventListener? onPointerPanZoomEnd, PointerSignalEventListener? onPointerSignal, HitTestBehavior behavior = HitTestBehavior.deferToChild, Widget? child})"
}
]]

class "DragDownDetails" {

}

class "DragEndDetails" {

}

class "DragStartDetails" {
    "final Offset globalPosition",
    "final Offset localPosition",
}

class "DragUpdateDetails" {
    "final Offset delta",
    "final Offset globalPosition",
    "final Offset localPosition",
}

class "LongPressDownDetails" {

}

class "LongPressEndDetails" {

}

class "LongPressMoveUpdateDetails" {

}

class "LongPressStartDetails" {

}

class "TapDownDetails" {

}

class "TapUpDetails" {

}

class "Key" {

}

class "UniqueKey" {
    super = "Key",
    "UniqueKey()"
}

class "Duration" {
    "Duration({int days = 0, int hours = 0, int minutes = 0, int seconds = 0, int milliseconds = 0, int microseconds = 0})",
    "static const Duration zero",
    "inDays → int",
    "inHours → int",
    "inMicroseconds → int",
    "inMilliseconds → int",
    "inMinutes → int",
    "inSeconds → int",
    "compareTo(Duration other) → int",

}

class "Dialog" {
    "Dialog({Key? key, Color? backgroundColor, double? elevation, Color? shadowColor, Color? surfaceTintColor, Duration insetAnimationDuration = const Duration(milliseconds: 100), Curve insetAnimationCurve = Curves.decelerate, EdgeInsets? insetPadding = _defaultInsetPadding, Clip clipBehavior = Clip.none, ShapeBorder? shape, AlignmentGeometry? alignment, Widget? child})",
}

class "AlertDialog" {
    "AlertDialog({Key? key, Widget? icon, EdgeInsetsGeometry? iconPadding, Color? iconColor, Widget? title, EdgeInsetsGeometry? titlePadding, TextStyle? titleTextStyle, Widget? content, EdgeInsetsGeometry? contentPadding, TextStyle? contentTextStyle, List<Widget>? actions, EdgeInsetsGeometry? actionsPadding, MainAxisAlignment? actionsAlignment, OverflowBarAlignment? actionsOverflowAlignment, VerticalDirection? actionsOverflowDirection, double? actionsOverflowButtonSpacing, EdgeInsetsGeometry? buttonPadding, Color? backgroundColor, double? elevation, Color? shadowColor, Color? surfaceTintColor, String? semanticLabel, EdgeInsets insetPadding = _defaultInsetPadding, Clip clipBehavior = Clip.none, ShapeBorder? shape, AlignmentGeometry? alignment, bool scrollable = false})",
}

class "SimpleDialog" {
    "SimpleDialog({Key? key, Widget? title, EdgeInsetsGeometry titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0), TextStyle? titleTextStyle, List<Widget>? children, EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0), Color? backgroundColor, double? elevation, Color? shadowColor, Color? surfaceTintColor, String? semanticLabel, EdgeInsets insetPadding = _defaultInsetPadding, Clip clipBehavior = Clip.none, ShapeBorder? shape, AlignmentGeometry? alignment})",
}

class "CupertinoAlertDialog" {
    "CupertinoAlertDialog({Key? key, Widget? title, Widget? content, List<Widget> actions = const <Widget>[], ScrollController? scrollController, ScrollController? actionScrollController, Duration insetAnimationDuration = const Duration(milliseconds: 100), Curve insetAnimationCurve = Curves.decelerate})",
}

class "Future" {
    "Future(VoidCallback computation)",
    "Future.delayed(Duration duration, VoidCallback? computation)",
    "Future.microtask(VoidCallback computation)",
    "Future.sync(VoidCallback computation)",

    "then(DynamicCallback onValue, {DynamicCallback? onError}) → Future",
    "catchError(DynamicCallback onError) → Future",
    "whenComplete(VoidCallback action) → Future",

    "timeout(Duration timeLimit, {VoidCallback? onTimeout}) → Future",
}

class "Future<dynamic>" {
    super = "Future"
}

fn "Future showDialog({required BuildContext context, required WidgetBuilder builder, bool barrierDismissible = true, Color? barrierColor = Colors.black54, String? barrierLabel,  bool useSafeArea = true, bool useRootNavigator = true, RouteSettings? routeSettings, Offset? anchorPoint})"

fn "Future showGeneralDialog({required BuildContext context,required RoutePageBuilder pageBuilder,bool barrierDismissible = false,String? barrierLabel,Color barrierColor = const Color(0x80000000),Duration transitionDuration = const Duration(milliseconds: 200),RouteTransitionsBuilder? transitionBuilder,bool useRootNavigator = true,RouteSettings? routeSettings,Offset? anchorPoint})"

fn "Key StringKey(String key)"
fn "Key IntKey(int key)"

class "FloatingActionButton" {
    "FloatingActionButton({Key? key, Widget? child, String? tooltip, Color? foregroundColor, Color? backgroundColor, Color? focusColor, Color? hoverColor, Color? splashColor, double? elevation, double? focusElevation, double? hoverElevation, double? highlightElevation, double? disabledElevation, required VoidCallback? onPressed, MouseCursor? mouseCursor, bool mini = false, ShapeBorder? shape, Clip clipBehavior = Clip.none, FocusNode? focusNode, bool autofocus = false, MaterialTapTargetSize? materialTapTargetSize, bool isExtended = false, bool? enableFeedback})",
    "FloatingActionButton.extended({Key? key, String? tooltip, Color? foregroundColor, Color? backgroundColor, Color? focusColor, Color? hoverColor, double? elevation, double? focusElevation, double? hoverElevation, Color? splashColor, double? highlightElevation, double? disabledElevation, required VoidCallback? onPressed, MouseCursor? mouseCursor = SystemMouseCursors.click, ShapeBorder? shape, bool isExtended = true, MaterialTapTargetSize? materialTapTargetSize, Clip clipBehavior = Clip.none, FocusNode? focusNode, bool autofocus = false, double? extendedIconLabelSpacing, EdgeInsetsGeometry? extendedPadding, TextStyle? extendedTextStyle, Widget? icon, required Widget label, bool? enableFeedback})",
    "FloatingActionButton.large({Key? key, Widget? child, String? tooltip, Color? foregroundColor, Color? backgroundColor, Color? focusColor, Color? hoverColor, Color? splashColor, double? elevation, double? focusElevation, double? hoverElevation, double? highlightElevation, double? disabledElevation, required VoidCallback? onPressed, MouseCursor? mouseCursor, ShapeBorder? shape, Clip clipBehavior = Clip.none, FocusNode? focusNode, bool autofocus = false, MaterialTapTargetSize? materialTapTargetSize, bool? enableFeedback})",
    "FloatingActionButton.small({Key? key, Widget? child, String? tooltip, Color? foregroundColor, Color? backgroundColor, Color? focusColor, Color? hoverColor, Color? splashColor, double? elevation, double? focusElevation, double? hoverElevation, double? highlightElevation, double? disabledElevation, required VoidCallback? onPressed, MouseCursor? mouseCursor, ShapeBorder? shape, Clip clipBehavior = Clip.none, FocusNode? focusNode, bool autofocus = false, MaterialTapTargetSize? materialTapTargetSize, bool? enableFeedback})",
}

class "Scaffold" {
    "Scaffold({Key? key, AppBar? appBar, Widget? body, Widget? floatingActionButton, FloatingActionButtonLocation? floatingActionButtonLocation, FloatingActionButtonAnimator? floatingActionButtonAnimator, List<Widget>? persistentFooterButtons, AlignmentDirectional persistentFooterAlignment = AlignmentDirectional.centerEnd, Widget? drawer, DrawerCallback? onDrawerChanged, Widget? endDrawer, DrawerCallback? onEndDrawerChanged, Widget? bottomNavigationBar, Widget? bottomSheet, Color? backgroundColor, bool? resizeToAvoidBottomInset, bool primary = true, DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start, bool extendBody = false, bool extendBodyBehindAppBar = false, Color? drawerScrimColor, double? drawerEdgeDragWidth, bool drawerEnableOpenDragGesture = true, bool endDrawerEnableOpenDragGesture = true, String? restorationId})"
}

class "AppBar" {
    "AppBar({Key? key, Widget? leading, bool automaticallyImplyLeading = true, Widget? title, List<Widget>? actions, Widget? flexibleSpace, PreferredSizeWidget? bottom, double? elevation, double? scrolledUnderElevation, ScrollNotificationPredicate notificationPredicate = defaultScrollNotificationPredicate, Color? shadowColor, Color? surfaceTintColor, ShapeBorder? shape, Color? backgroundColor, Color? foregroundColor, IconThemeData? iconTheme, IconThemeData? actionsIconTheme, bool primary = true, bool? centerTitle, bool excludeHeaderSemantics = false, double? titleSpacing, double toolbarOpacity = 1.0, double bottomOpacity = 1.0, double? toolbarHeight, double? leadingWidth, TextStyle? toolbarTextStyle, TextStyle? titleTextStyle, SystemUiOverlayStyle? systemOverlayStyle})",
}

class "BottomNavigationBar" {
    "BottomNavigationBar({Key? key, required List<BottomNavigationBarItem> items, ValueChanged<int>? onTap, int currentIndex = 0, double? elevation, BottomNavigationBarType? type, Color? fixedColor, Color? backgroundColor, double iconSize = 24.0, Color? selectedItemColor, Color? unselectedItemColor, IconThemeData? selectedIconTheme, IconThemeData? unselectedIconTheme, double selectedFontSize = 14.0, double unselectedFontSize = 12.0, TextStyle? selectedLabelStyle, TextStyle? unselectedLabelStyle, bool? showSelectedLabels, bool? showUnselectedLabels, MouseCursor? mouseCursor, bool? enableFeedback, BottomNavigationBarLandscapeLayout? landscapeLayout, bool useLegacyColorScheme = true})",
}

class "BottomNavigationBarItem" {
    "BottomNavigationBarItem({required Widget icon,String? label,Widget? activeIcon,Color? backgroundColor,String? tooltip})",
}

class "ScaffoldMessenger" {
    "static ScaffoldMessengerState of(BuildContext context)"
}

class "ScaffoldMessengerState" {
    "void showSnackBar(SnackBar snackBar)",
    "void showMaterialBanner(MaterialBanner materialBanner)",
}

class "SnackBar" {
    "SnackBar({Key? key, required Widget content, Color? backgroundColor, double? elevation, EdgeInsetsGeometry? margin, EdgeInsetsGeometry? padding, double? width, ShapeBorder? shape, SnackBarBehavior? behavior, SnackBarAction? action, Duration duration = _snackBarDisplayDuration, Animation<double>? animation, VoidCallback? onVisible, DismissDirection dismissDirection = DismissDirection.down, Clip clipBehavior = Clip.hardEdge})",
}

class "MaterialBanner" {
    "MaterialBanner({Key? key, required Widget content, TextStyle? contentTextStyle, required List<Widget> actions, double? elevation, Widget? leading, Color? backgroundColor, Color? surfaceTintColor, Color? shadowColor, Color? dividerColor, EdgeInsetsGeometry? padding, EdgeInsetsGeometry? leadingPadding, bool forceActionsBelow = false, OverflowBarAlignment overflowAlignment = OverflowBarAlignment.end, Animation<double>? animation, VoidCallback? onVisible})"
}

class "PopupMenuButton" {
    "PopupMenuButton({Key? key, required PopupMenuItemBuilder<int> itemBuilder, int? initialValue, VoidCallback? onOpened, PopupMenuItemSelected<int>? onSelected, PopupMenuCanceled? onCanceled, String? tooltip, double? elevation, Color? shadowColor, Color? surfaceTintColor, EdgeInsetsGeometry padding = const EdgeInsets.all(8.0), Widget? child, double? splashRadius, Widget? icon, double? iconSize, Offset offset = Offset.zero, bool enabled = true, ShapeBorder? shape, Color? color, bool? enableFeedback, BoxConstraints? constraints, PopupMenuPosition? position, Clip clipBehavior = Clip.none})",
}

class "PopupMenuEntry"

class "PopupMenuDivider" {
    super = "PopupMenuEntry",
    "PopupMenuDivider({Key? key, double height = _kMenuDividerHeight})"
}

class "PopupMenuItem" {
    super = "PopupMenuEntry",
    "PopupMenuItem({Key? key, int? value, VoidCallback? onTap, bool enabled = true, double height = kMinInteractiveDimension, EdgeInsets? padding, TextStyle? textStyle, MaterialStateProperty<TextStyle?>? labelTextStyle, MouseCursor? mouseCursor, required Widget? child})"
}

class "CheckedPopupMenuItem" {
    super = "PopupMenuItem",
    "CheckedPopupMenuItem({Key? key, int? value, bool checked = false, bool enabled = true, EdgeInsets? padding, double height = kMinInteractiveDimension, MouseCursor? mouseCursor, Widget? child})",
}

class "SafeArea" {
    "SafeArea({Key? key, bool left = true, bool top = true, bool right = true, bool bottom = true, EdgeInsets minimum = EdgeInsets.zero, bool maintainBottomViewPadding = false, required Widget child})",
}

class "RoundedRectangleBorder" {
    "RoundedRectangleBorder({BorderSide side = BorderSide.none, BorderRadiusGeometry borderRadius = BorderRadius.zero})"
}

class "DropdownMenuItem" {
    "DropdownMenuItem({Key? key, VoidCallback? onTap, int? value, bool enabled = true, AlignmentGeometry alignment = AlignmentDirectional.centerStart, required Widget child})",
}

class "DropdownButton" {
    "DropdownButton({Key? key, required List<DropdownMenuItem<int>>? items, DropdownButtonBuilder? selectedItemBuilder, int? value, Widget? hint, Widget? disabledHint, required ValueChanged<int?>? onChanged, VoidCallback? onTap, int elevation = 8, TextStyle? style, Widget? underline, Widget? icon, Color? iconDisabledColor, Color? iconEnabledColor, double iconSize = 24.0, bool isDense = false, bool isExpanded = false, double? itemHeight = kMinInteractiveDimension, Color? focusColor, FocusNode? focusNode, bool autofocus = false, Color? dropdownColor, double? menuMaxHeight, bool? enableFeedback, AlignmentGeometry alignment = AlignmentDirectional.centerStart, BorderRadius? borderRadius})",
}

class "ButtonSegment" {
    "ButtonSegment({required int value, Widget? icon, Widget? label, bool enabled = true})",
}

class "SegmentedButton" {
    "SegmentedButton({Key? key, required List<ButtonSegment<int>> segments, required Set<int> selected, ValueChanged<Set<int>>? onSelectionChanged, bool multiSelectionEnabled = false, bool emptySelectionAllowed = false, ButtonStyle? style, bool showSelectedIcon = true, Widget? selectedIcon})",
}

fn "void markNeedsBuild(BuildContext context)"

class "Overlay" {
    "static of(BuildContext context, {bool rootOverlay = false, Widget? debugRequiredFor}) → OverlayState",
}

class "OverlayState" {
    "insert(OverlayEntry entry, {OverlayEntry? below, OverlayEntry? above}) → void",
}

class "OverlayEntry" {
    "OverlayEntry({required WidgetBuilder builder, bool opaque = false, bool maintainState = false})",
    "markNeedsBuild() → void",
    "remove() → void",
}

class "RotatedBox" {
    "RotatedBox({Key? key, required int quarterTurns, Widget? child})",
}

class "Transform" {
    "Transform({Key? key, required Matrix4 transform, Offset? origin, AlignmentGeometry? alignment, bool transformHitTests = true, FilterQuality? filterQuality, Widget? child})",
    "Transform.rotate({Key? key, required double angle, Offset? origin, AlignmentGeometry? alignment = Alignment.center, bool transformHitTests = true, FilterQuality? filterQuality, Widget? child})",
    "Transform.scale({Key? key, double? scale, double? scaleX, double? scaleY, Offset? origin, AlignmentGeometry? alignment = Alignment.center, bool transformHitTests = true, FilterQuality? filterQuality, Widget? child})",
    "Transform.translate({Key? key, required Offset offset, bool transformHitTests = true, FilterQuality? filterQuality, Widget? child})",
}

class "CircularProgressIndicator" {
    "CircularProgressIndicator({Key? key, double? value, Color? backgroundColor, Color? color, Animation<Color?>? valueColor, double strokeWidth = 4.0, String? semanticsLabel, String? semanticsValue})",
    "CircularProgressIndicator.adaptive({Key? key, double? value, Color? backgroundColor, Animation<Color?>? valueColor, double strokeWidth = 4.0, String? semanticsLabel, String? semanticsValue})",
}

class "LinearProgressIndicator" {
    "LinearProgressIndicator({Key? key, double? value, Color? backgroundColor, Color? color, Animation<Color?>? valueColor, double? minHeight, String? semanticsLabel, String? semanticsValue})"
}

class "FittedBox" {
    "FittedBox({Key? key, BoxFit fit = BoxFit.contain, AlignmentGeometry alignment = Alignment.center, Clip clipBehavior = Clip.none, Widget? child})"
}

class "SchedulerBinding" {
    "static instance → SchedulerBinding",
    "scheduleFrame() → void",
    "scheduleForcedFrame() → void",
    "scheduleFrameCallback(FrameCallback callback, {bool rescheduling = false}) → int",
    "addPostFrameCallback(FrameCallback callback) → void",
}

class "Card" {
    "Card({Key? key, Color? color, Color? shadowColor, Color? surfaceTintColor, double? elevation, ShapeBorder? shape, bool borderOnForeground = true, EdgeInsetsGeometry? margin, Clip? clipBehavior, Widget? child, bool semanticContainer = true})",
}

class "MaterialStatePropertyT" {
    "static MaterialStateProperty<Color> resolveColor(MaterialPropertyResolver<Color> callback)",
    "static MaterialStateProperty<BorderSide> resolveBorderSide(MaterialPropertyResolver<BorderSide> callback)",
}

class "MaterialStateColor" {
    super = "Color",
    "static MaterialStateColor resolveWith(MaterialPropertyResolver<Color> callback)",
}

class "ButtonStyle" {
    "ButtonStyle({MaterialStateProperty<TextStyle?>? textStyle, MaterialStateProperty<Color?>? backgroundColor, MaterialStateProperty<Color?>? foregroundColor, MaterialStateProperty<Color?>? overlayColor, MaterialStateProperty<Color?>? shadowColor, MaterialStateProperty<Color?>? surfaceTintColor, MaterialStateProperty<double?>? elevation, MaterialStateProperty<EdgeInsetsGeometry?>? padding, MaterialStateProperty<Size?>? minimumSize, MaterialStateProperty<Size?>? fixedSize, MaterialStateProperty<Size?>? maximumSize, MaterialStateProperty<Color?>? iconColor, MaterialStateProperty<double?>? iconSize, MaterialStateProperty<BorderSide?>? side, MaterialStateProperty<OutlinedBorder?>? shape, MaterialStateProperty<MouseCursor?>? mouseCursor, VisualDensity? visualDensity, MaterialTapTargetSize? tapTargetSize, Duration? animationDuration, bool? enableFeedback, AlignmentGeometry? alignment, InteractiveInkFeatureFactory? splashFactory})"
}

class "ToggleButtons" {
    "ToggleButtons({Key? key, required List<Widget> children, required List<bool> isSelected, IntValueChanged? onPressed, MouseCursor? mouseCursor, MaterialTapTargetSize? tapTargetSize, TextStyle? textStyle, BoxConstraints? constraints, Color? color, Color? selectedColor, Color? disabledColor, Color? fillColor, Color? focusColor, Color? highlightColor, Color? hoverColor, Color? splashColor, List<FocusNode>? focusNodes, bool renderBorder = true, Color? borderColor, Color? selectedBorderColor, Color? disabledBorderColor, BorderRadius? borderRadius, double? borderWidth, Axis direction = Axis.horizontal, VerticalDirection verticalDirection = VerticalDirection.down})",
}

class "Directionality" {
    "Directionality({Key? key, required TextDirection textDirection, required Widget child})",
}

class "IntrinsicHeight" {
    "IntrinsicHeight({Key? key, Widget? child})"
}

class "IntrinsicWidth" {
    "IntrinsicWidth({Key? key, double? stepWidth, double? stepHeight, Widget? child})"
}

class "Switch" {
    "Switch({Key? key, required bool value, required ValueChanged<bool>? onChanged, Color? activeColor, Color? activeTrackColor, Color? inactiveThumbColor, Color? inactiveTrackColor, ImageProvider<Object>? activeThumbImage, ImageErrorListener? onActiveThumbImageError, ImageProvider<Object>? inactiveThumbImage, ImageErrorListener? onInactiveThumbImageError, MaterialStateProperty<Color?>? thumbColor, MaterialStateProperty<Color?>? trackColor, MaterialStateProperty<Icon?>? thumbIcon, MaterialTapTargetSize? materialTapTargetSize, DragStartBehavior dragStartBehavior = DragStartBehavior.start, MouseCursor? mouseCursor, Color? focusColor, Color? hoverColor, MaterialStateProperty<Color?>? overlayColor, double? splashRadius, FocusNode? focusNode, bool autofocus = false})",
    "Switch.adaptive({Key? key, required bool value, required ValueChanged<bool>? onChanged, Color? activeColor, Color? activeTrackColor, Color? inactiveThumbColor, Color? inactiveTrackColor, ImageProvider<Object>? activeThumbImage, ImageErrorListener? onActiveThumbImageError, ImageProvider<Object>? inactiveThumbImage, ImageErrorListener? onInactiveThumbImageError, MaterialTapTargetSize? materialTapTargetSize, MaterialStateProperty<Color?>? thumbColor, MaterialStateProperty<Color?>? trackColor, MaterialStateProperty<Icon?>? thumbIcon, DragStartBehavior dragStartBehavior = DragStartBehavior.start, MouseCursor? mouseCursor, Color? focusColor, Color? hoverColor, MaterialStateProperty<Color?>? overlayColor, double? splashRadius, FocusNode? focusNode, bool autofocus = false})",
}

class "SwitchListTile" {
    "SwitchListTile({Key? key, required bool value, required ValueChanged<bool>? onChanged, Color? activeColor, Color? activeTrackColor, Color? inactiveThumbColor, Color? inactiveTrackColor, ImageProvider<Object>? activeThumbImage, ImageProvider<Object>? inactiveThumbImage, FocusNode? focusNode, bool autofocus = false, Color? tileColor, Widget? title, Widget? subtitle, bool isThreeLine = false, bool? dense, EdgeInsetsGeometry? contentPadding, Widget? secondary, bool selected = false, ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform, ShapeBorder? shape, Color? selectedTileColor, VisualDensity? visualDensity, bool? enableFeedback, Color? hoverColor})",
    "SwitchListTile.adaptive({Key? key, required bool value, required ValueChanged<bool>? onChanged, Color? activeColor, Color? activeTrackColor, Color? inactiveThumbColor, Color? inactiveTrackColor, ImageProvider<Object>? activeThumbImage, ImageProvider<Object>? inactiveThumbImage, FocusNode? focusNode, bool autofocus = false, Color? tileColor, Widget? title, Widget? subtitle, bool isThreeLine = false, bool? dense, EdgeInsetsGeometry? contentPadding, Widget? secondary, bool selected = false, ListTileControlAffinity controlAffinity = ListTileControlAffinity.platform, ShapeBorder? shape, Color? selectedTileColor, VisualDensity? visualDensity, bool? enableFeedback, Color? hoverColor})",
}

class "VisualDensity" {
    "VisualDensity({double horizontal = 0.0, double vertical = 0.0})",
    "static const VisualDensity standard",
    "static const VisualDensity comfortable",
    "static const VisualDensity compact",
    "static VisualDensity defaultDensityForPlatform(TargetPlatform platform)",
}

class "TextSelection" {
    "TextSelection({required int baseOffset, required int extentOffset, TextAffinity affinity = TextAffinity.downstream, bool isDirectional = false})",
    "TextSelection.collapsed({required int offset, TextAffinity affinity = TextAffinity.downstream})",
    "TextSelection.fromPosition(TextPosition position)",
}

class "TextPosition" {
    "TextPosition({required int offset, TextAffinity affinity = TextAffinity.downstream})"
}

class "TextEditingValue" {
    "TextEditingValue({String text = '', TextSelection selection = const TextSelection.collapsed(offset: -1), TextRange composing = TextRange.empty})"
}

class "TextRange" {
    "TextRange({required int start, required int end})"
}

class "Radio" {
    "Radio({Key? key, required int value, required int? groupValue, required ValueChanged<int?>? onChanged, MouseCursor? mouseCursor, bool toggleable = false, Color? activeColor, MaterialStateProperty<Color?>? fillColor, Color? focusColor, Color? hoverColor, MaterialStateProperty<Color?>? overlayColor, double? splashRadius, MaterialTapTargetSize? materialTapTargetSize, VisualDensity? visualDensity, FocusNode? focusNode, bool autofocus = false})",
    "Radio.adaptive({Key? key, required int value, required int? groupValue, required ValueChanged<int?>? onChanged, MouseCursor? mouseCursor, bool toggleable = false, Color? activeColor, MaterialStateProperty<Color?>? fillColor, Color? focusColor, Color? hoverColor, MaterialStateProperty<Color?>? overlayColor, double? splashRadius, MaterialTapTargetSize? materialTapTargetSize, VisualDensity? visualDensity, FocusNode? focusNode, bool autofocus = false})",
}

class "Image" {
    "Image({Key? key, required ImageProvider<Object> image, ImageFrameBuilder? frameBuilder, ImageLoadingBuilder? loadingBuilder, ImageErrorWidgetBuilder? errorBuilder, String? semanticLabel, bool excludeFromSemantics = false, double? width, double? height, Color? color, Animation<double>? opacity, BlendMode? colorBlendMode, BoxFit? fit, AlignmentGeometry alignment = Alignment.center, ImageRepeat repeat = ImageRepeat.noRepeat, Rect? centerSlice, bool matchTextDirection = false, bool gaplessPlayback = false, bool isAntiAlias = false, FilterQuality filterQuality = FilterQuality.low})",
    "Image.asset(String name, {Key? key, AssetBundle? bundle, ImageFrameBuilder? frameBuilder, ImageErrorWidgetBuilder? errorBuilder, String? semanticLabel, bool excludeFromSemantics = false, double? scale, double? width, double? height, Color? color, Animation<double>? opacity, BlendMode? colorBlendMode, BoxFit? fit, AlignmentGeometry alignment = Alignment.center, ImageRepeat repeat = ImageRepeat.noRepeat, Rect? centerSlice, bool matchTextDirection = false, bool gaplessPlayback = false, bool isAntiAlias = false, String? package, FilterQuality filterQuality = FilterQuality.low, int? cacheWidth, int? cacheHeight})",
    "Image.file(File file, {Key? key, double scale = 1.0, ImageFrameBuilder? frameBuilder, ImageErrorWidgetBuilder? errorBuilder, String? semanticLabel, bool excludeFromSemantics = false, double? width, double? height, Color? color, Animation<double>? opacity, BlendMode? colorBlendMode, BoxFit? fit, AlignmentGeometry alignment = Alignment.center, ImageRepeat repeat = ImageRepeat.noRepeat, Rect? centerSlice, bool matchTextDirection = false, bool gaplessPlayback = false, bool isAntiAlias = false, FilterQuality filterQuality = FilterQuality.low, int? cacheWidth, int? cacheHeight})",
    "Image.memory(Uint8List bytes, {Key? key, double scale = 1.0, ImageFrameBuilder? frameBuilder, ImageErrorWidgetBuilder? errorBuilder, String? semanticLabel, bool excludeFromSemantics = false, double? width, double? height, Color? color, Animation<double>? opacity, BlendMode? colorBlendMode, BoxFit? fit, AlignmentGeometry alignment = Alignment.center, ImageRepeat repeat = ImageRepeat.noRepeat, Rect? centerSlice, bool matchTextDirection = false, bool gaplessPlayback = false, bool isAntiAlias = false, FilterQuality filterQuality = FilterQuality.low, int? cacheWidth, int? cacheHeight})",
    "Image.network(String src, {Key? key, double scale = 1.0, ImageFrameBuilder? frameBuilder, ImageLoadingBuilder? loadingBuilder, ImageErrorWidgetBuilder? errorBuilder, String? semanticLabel, bool excludeFromSemantics = false, double? width, double? height, Color? color, Animation<double>? opacity, BlendMode? colorBlendMode, BoxFit? fit, AlignmentGeometry alignment = Alignment.center, ImageRepeat repeat = ImageRepeat.noRepeat, Rect? centerSlice, bool matchTextDirection = false, bool gaplessPlayback = false, FilterQuality filterQuality = FilterQuality.low, bool isAntiAlias = false, Map<String, String>? headers, int? cacheWidth, int? cacheHeight})",
}

class "NetworkImage" {
    "NetworkImage(String url, {double scale, Map<String, String>? headers})",
}

class "FileImage" {
    "FileImage(File file, {double scale = 1.0})",
}

class "MemoryImage" {
    "MemoryImage(Uint8List bytes, {double scale = 1.0})",
}

class "File" {
    "File(String path)",
    "File.fromRawPath(Uint8List rawPath)",
    "File.fromUri(Uri uri)",
}

class "Uint8List" {
    "Uint8List(int length)",
    "Uint8List.fromList(List<int> elements)",
}

class "Uri" {
    "Uri({String? scheme, String? userInfo, String? host, int? port, String? path, Iterable<String>? pathSegments, String? query, Map<String, dynamic>? queryParameters, String? fragment})",
    "Uri.dataFromBytes(List<int> bytes, {String mimeType = 'application/octet-stream', Map<String, String>? parameters, bool percentEncoded = false})",
    "Uri.dataFromString(String content, {String? mimeType, Encoding? encoding, Map<String, String>? parameters, bool base64 = false})",
    "Uri.directory(String path, {bool? windows})",
    "Uri.file(String path, {bool? windows})",
    "Uri.http(String authority)",
    "Uri.https(String authority)",
}

class "Visibility" {
    "Visibility({Key? key, required Widget child, Widget replacement = const SizedBox.shrink(), bool visible = true, bool maintainState = false, bool maintainAnimation = false, bool maintainSize = false, bool maintainSemantics = false, bool maintainInteractivity = false})",
    "Visibility.maintain({Key? key, required Widget child, bool visible = true})",
}

class "double" {
    "static const double nan",
    "static const double infinity",
    "static const double negativeInfinity",
    "static const double minPositive",
    "static const double maxFinite",
}

class "TabBar" {
    "TabBar({Key? key, required List<Widget> tabs, TabController? controller, bool isScrollable = false, EdgeInsetsGeometry? padding, Color? indicatorColor, bool automaticIndicatorColorAdjustment = true, double indicatorWeight = 2.0, EdgeInsetsGeometry indicatorPadding = EdgeInsets.zero, Decoration? indicator, TabBarIndicatorSize? indicatorSize, Color? dividerColor, Color? labelColor, TextStyle? labelStyle, EdgeInsetsGeometry? labelPadding, Color? unselectedLabelColor, TextStyle? unselectedLabelStyle, DragStartBehavior dragStartBehavior = DragStartBehavior.start, MaterialStateProperty<Color?>? overlayColor, MouseCursor? mouseCursor, bool? enableFeedback, ValueChanged<int>? onTap, ScrollPhysics? physics, InteractiveInkFeatureFactory? splashFactory, BorderRadius? splashBorderRadius})",
    "TabBar.secondary({Key? key, required List<Widget> tabs, TabController? controller, bool isScrollable = false, EdgeInsetsGeometry? padding, Color? indicatorColor, bool automaticIndicatorColorAdjustment = true, double indicatorWeight = 2.0, EdgeInsetsGeometry indicatorPadding = EdgeInsets.zero, Decoration? indicator, TabBarIndicatorSize? indicatorSize, Color? dividerColor, Color? labelColor, TextStyle? labelStyle, EdgeInsetsGeometry? labelPadding, Color? unselectedLabelColor, TextStyle? unselectedLabelStyle, DragStartBehavior dragStartBehavior = DragStartBehavior.start, MaterialStateProperty<Color?>? overlayColor, MouseCursor? mouseCursor, bool? enableFeedback, ValueChanged<int>? onTap, ScrollPhysics? physics, InteractiveInkFeatureFactory? splashFactory, BorderRadius? splashBorderRadius})",
}

class "TabBarView" {
    "TabBarView({Key? key, required List<Widget> children, TabController? controller, ScrollPhysics? physics, DragStartBehavior dragStartBehavior = DragStartBehavior.start, double viewportFraction = 1.0, Clip clipBehavior = Clip.hardEdge})",
}

class "TabController" {
    "TabController({int initialIndex = 0, Duration? animationDuration, required int length, required TickerProvider vsync})",
}

class "DefaultTabController" {
    "DefaultTabController({Key? key, required int length, int initialIndex = 0, required Widget child, Duration? animationDuration})",
}

enum "FontStyle" {
    "normal",
    "italic",
}

enum "FontWeight" {
    "bold",
    "normal",
}

enum "Icons" {
    type = "IconData",
    "favorite",
    "book",
    "star",
    "search",
    "question_mark",
    "call_made",
    "double_arrow",
    "crop_rotate",
    "drag_indicator",
    "download",
    "download_done",
    "ac_unit",
    "access_alarm",
    "add_circle",
    "adjust",
    "airline_stops",
    "all_inclusive",
    "all_out",
    "alt_route",
    "alternate_email",
    "anchor",
    "abc",
    "arrow_drop_up",
    "arrow_drop_down",
    "arrow_right",
    "arrow_left",
    "add",
    "remove",
    "play_arrow",
    "stop",
    "person",
    "home",
    "lock",
    "edit",
    "close",
    "article",
    "folder_open",
    "folder",
    "terrain",
    "casino",
    "circle",
    "square",
    "arrow_upward",
    "more_vert",
    "more_horiz",
    "change_circle",
    "delete",
    "location_searching",
}

enum "TextDirection" {
    "rtl",
    "ltr",
}

enum "CrossAxisAlignment" {
    "start",
    "end",
    "center",
    "stretch",
    "baseline",
}

enum "TextOverflow" {
    "clip",
    "fade",
    "ellipsis",
    "visible",
}

enum "Curves" {
    "linear",
    "decelerate",
    "fastLinearToSlowEaseIn",
    "ease",
    "easeIn",
    "easeInToLinear",
    "easeInSine",
    "easeInQuad",
    "easeInCubic",
    "easeInQuart",
    "easeInQuint",
    "easeInExpo",
    "easeInCirc",
    "easeInBack",
    "easeOut",
    "linearToEaseOut",
    "easeOutSine",
    "easeOutQuad",
    "easeOutCubic",
    "easeOutQuart",
    "easeOutQuint",
    "easeOutExpo",
    "easeOutCirc",
    "easeOutBack",
    "easeInOut",
    "easeInOutSine",
    "easeInOutQuad",
    "easeInOutCubic",
    "easeInOutCubicEmphasized",
    "easeInOutQuart",
    "easeInOutQuint",
    "easeInOutExpo",
    "easeInOutCirc",
    "easeInOutBack",
    "fastOutSlowIn",
    "slowMiddle",
    "bounceIn",
    "bounceOut",
    "bounceInOut",
    "elasticIn",
    "elasticOut",
    "elasticInOut",
}

enum "MainAxisAlignment" {
    "start",
    "end",
    "center",
    "spaceBetween",
    "spaceAround",
    "spaceEvenly",
}

enum "Clip" {
    "none",
    "hardEdge",
    "antiAlias",
    "antiAliasWithSaveLayer",
}

enum "TableCellVerticalAlignment" {
    "top",
    "middle",
    "bottom",
    "baseline",
    "fill"
}

enum "BorderStyle" {
    "none",
    "solid",
}

enum "Brightness" {
    "dark",
    "light",
}

enum "TextAlign" {
    "left",
    "right",
    "center",
    "justify",
    "start",
    "end",
}

enum "DecorationPosition" {
    "background",
    "foreground",
}

enum "TooltipTriggerMode" {
    "manual",
    "longPress",
    "tap",
}

enum "TextInputAction" {
    "none",
    "unspecified",
    "done",
    "go",
    "search",
    "send",
    "next",
    "previous",
    "continueAction",
    "join",
    "route",
    "emergencyCall",
    "newline",
}

enum "MainAxisSize" {
    "min",
    "max",
}

enum "BoxFit" {
    "fill",
    "contain",
    "cover",
    "fitWidth",
    "fitHeight",
    "none",
    "scaleDown",
}

enum "ThemeMode" {
    "system",
    "light",
    "dark",
}

enum "MaterialState" {
    "hovered",
    "focused",
    "pressed",
    "dragged",
    "selected",
    "scrolledUnder",
    "disabled",
    "error",
}

enum "Axis" {
    "horizontal",
    "vertical",
}

enum "TargetPlatform" {
    "android",
    "fuchsia",
    "iOS",
    "linux",
    "macOS",
    "windows",
}

enum "MaterialTapTargetSize" {
    "padded",
    "shrinkWrap",
}

enum "TextAffinity" {
    "upstream",
    "downstream",
}
