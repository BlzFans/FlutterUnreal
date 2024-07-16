


type int = number
type double = number
type bool = boolean

interface Object {
}

interface PointerEnterEvent {
}

interface PointerExitEvent {
}

interface Widget {
}

interface Text {
}

declare function Text(data:string, {key, style, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior, selectionColor}? : {key?:Key, style?:TextStyle, strutStyle?:StrutStyle, textAlign?:TextAlign, textDirection?:TextDirection, locale?:Locale, softWrap?:bool, overflow?:TextOverflow, textScaleFactor?:double, maxLines?:int, semanticsLabel?:string, textWidthBasis?:TextWidthBasis, textHeightBehavior?:TextHeightBehavior, selectionColor?:Color}):Text

declare namespace Text {

    function rich(textSpan:InlineSpan, {key, style, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior, selectionColor}? : {key?:Key, style?:TextStyle, strutStyle?:StrutStyle, textAlign?:TextAlign, textDirection?:TextDirection, locale?:Locale, softWrap?:bool, overflow?:TextOverflow, textScaleFactor?:double, maxLines?:int, semanticsLabel?:string, textWidthBasis?:TextWidthBasis, textHeightBehavior?:TextHeightBehavior, selectionColor?:Color}):Text
}

interface RichText {
}

declare function RichText({key, text, textAlign, textDirection, softWrap, overflow, textScaleFactor, maxLines, locale, strutStyle, textWidthBasis, textHeightBehavior, selectionRegistrar, selectionColor} : {key?:Key, text:InlineSpan, textAlign?:TextAlign, textDirection?:TextDirection, softWrap?:bool, overflow?:TextOverflow, textScaleFactor?:double, maxLines?:int, locale?:Locale, strutStyle?:StrutStyle, textWidthBasis?:TextWidthBasis, textHeightBehavior?:TextHeightBehavior, selectionRegistrar?:SelectionRegistrar, selectionColor?:Color}):RichText

interface TextSpan {
}

declare function TextSpan({text, children, style, recognizer, mouseCursor, onEnter, onExit, semanticsLabel, locale, spellOut}? : {text?:string, children?:InlineSpan[], style?:TextStyle, recognizer?:GestureRecognizer, mouseCursor?:MouseCursor, onEnter?:PointerEnterEventListener, onExit?:PointerExitEventListener, semanticsLabel?:string, locale?:Locale, spellOut?:bool}):TextSpan

interface WidgetSpan {
}

declare function WidgetSpan({child, alignment, baseline, style} : {child:Widget, alignment?:PlaceholderAlignment, baseline?:TextBaseline, style?:TextStyle}):WidgetSpan

interface TextStyle {

    apply({color, backgroundColor}? : {color?:Color, backgroundColor?:Color} ):TextStyle
}

declare function TextStyle({inherit, color, backgroundColor, fontSize, fontWeight, fontStyle, letterSpacing, wordSpacing, textBaseline, height, leadingDistribution, locale, foreground, background, shadows, fontFeatures, fontVariations, decoration, decorationColor, decorationStyle, decorationThickness, debugLabel, fontFamily, fontFamilyFallback, package, overflow}? : {inherit?:bool, color?:Color, backgroundColor?:Color, fontSize?:double, fontWeight?:FontWeight, fontStyle?:FontStyle, letterSpacing?:double, wordSpacing?:double, textBaseline?:TextBaseline, height?:double, leadingDistribution?:TextLeadingDistribution, locale?:Locale, foreground?:Paint, background?:Paint, shadows?:Shadow[], fontFeatures?:FontFeature[], fontVariations?:FontVariation[], decoration?:TextDecoration, decorationColor?:Color, decorationStyle?:TextDecorationStyle, decorationThickness?:double, debugLabel?:string, fontFamily?:string, fontFamilyFallback?:string[], package?:string, overflow?:TextOverflow}):TextStyle

interface TextField {
}

declare function TextField({key, controller, focusNode, decoration, keyboardType, textInputAction, textCapitalization, style, strutStyle, textAlign, textAlignVertical, textDirection, readOnly, showCursor, autofocus, obscuringCharacter, obscureText, autocorrect, smartDashesType, smartQuotesType, enableSuggestions, maxLines, minLines, expands, maxLength, maxLengthEnforcement, onChanged, onEditingComplete, onSubmitted, onAppPrivateCommand, inputFormatters, enabled, cursorWidth, cursorHeight, cursorRadius, cursorColor, selectionHeightStyle, selectionWidthStyle, keyboardAppearance, scrollPadding, dragStartBehavior, enableInteractiveSelection, selectionControls, onTap, onTapOutside, mouseCursor, buildCounter, scrollController, scrollPhysics, autofillHints, clipBehavior, restorationId, scribbleEnabled, enableIMEPersonalizedLearning, spellCheckConfiguration, magnifierConfiguration}? : {key?:Key, controller?:TextEditingController, focusNode?:FocusNode, decoration?:InputDecoration, keyboardType?:TextInputType, textInputAction?:TextInputAction, textCapitalization?:TextCapitalization, style?:TextStyle, strutStyle?:StrutStyle, textAlign?:TextAlign, textAlignVertical?:TextAlignVertical, textDirection?:TextDirection, readOnly?:bool, showCursor?:bool, autofocus?:bool, obscuringCharacter?:string, obscureText?:bool, autocorrect?:bool, smartDashesType?:SmartDashesType, smartQuotesType?:SmartQuotesType, enableSuggestions?:bool, maxLines?:int, minLines?:int, expands?:bool, maxLength?:int, maxLengthEnforcement?:MaxLengthEnforcement, onChanged?:StringValueChanged, onEditingComplete?:VoidCallback, onSubmitted?:StringValueChanged, onAppPrivateCommand?:AppPrivateCommandCallback, inputFormatters?:TextInputFormatter[], enabled?:bool, cursorWidth?:double, cursorHeight?:double, cursorRadius?:Radius, cursorColor?:Color, selectionHeightStyle?:BoxHeightStyle, selectionWidthStyle?:BoxWidthStyle, keyboardAppearance?:Brightness, scrollPadding?:EdgeInsets, dragStartBehavior?:DragStartBehavior, enableInteractiveSelection?:bool, selectionControls?:TextSelectionControls, onTap?:GestureTapCallback, onTapOutside?:TapRegionCallback, mouseCursor?:MouseCursor, buildCounter?:InputCounterWidgetBuilder, scrollController?:ScrollController, scrollPhysics?:ScrollPhysics, autofillHints?:unknown, clipBehavior?:Clip, restorationId?:string, scribbleEnabled?:bool, enableIMEPersonalizedLearning?:bool, spellCheckConfiguration?:SpellCheckConfiguration, magnifierConfiguration?:TextMagnifierConfiguration}):TextField

interface TextInputType {
}

declare namespace TextInputType {

    function numberWithOptions({signed, decimal}? : {signed?:bool, decimal?:bool}):TextInputType

    const text: TextInputType

    const multiline: TextInputType

    const number: TextInputType

    const phone: TextInputType

    const datetime: TextInputType

    const emailAddress: TextInputType

    const url: TextInputType

    const visiblePassword: TextInputType

    const name: TextInputType

    const streetAddress: TextInputType

    const none: TextInputType
}

interface TextEditingController {

    clear( ):void

    text: string

    selection: TextSelection
}

declare function TextEditingController({text}? : {text?:string}):TextEditingController

interface TextAlignVertical {
}

declare function TextAlignVertical({y} : {y:double}):TextAlignVertical

declare namespace TextAlignVertical {

    const top: TextAlignVertical

    const center: TextAlignVertical

    const bottom: TextAlignVertical
}

interface Flex {
}

declare function Flex({key, direction, mainAxisAlignment, mainAxisSize, crossAxisAlignment, textDirection, verticalDirection, textBaseline, clipBehavior, children} : {key?:Key, direction:Axis, mainAxisAlignment?:MainAxisAlignment, mainAxisSize?:MainAxisSize, crossAxisAlignment?:CrossAxisAlignment, textDirection?:TextDirection, verticalDirection?:VerticalDirection, textBaseline?:TextBaseline, clipBehavior?:Clip, children?:Widget[]}):Flex

interface Column {
}

declare function Column({key, mainAxisAlignment, mainAxisSize, crossAxisAlignment, textDirection, verticalDirection, textBaseline, children}? : {key?:Key, mainAxisAlignment?:MainAxisAlignment, mainAxisSize?:MainAxisSize, crossAxisAlignment?:CrossAxisAlignment, textDirection?:TextDirection, verticalDirection?:VerticalDirection, textBaseline?:TextBaseline, children?:Widget[]}):Column

interface Row {
}

declare function Row({key, mainAxisAlignment, mainAxisSize, crossAxisAlignment, textDirection, verticalDirection, textBaseline, children}? : {key?:Key, mainAxisAlignment?:MainAxisAlignment, mainAxisSize?:MainAxisSize, crossAxisAlignment?:CrossAxisAlignment, textDirection?:TextDirection, verticalDirection?:VerticalDirection, textBaseline?:TextBaseline, children?:Widget[]}):Row

interface Flexible {
}

declare function Flexible({key, flex, fit, child} : {key?:Key, flex?:int, fit?:FlexFit, child:Widget}):Flexible

interface Expanded {
}

declare function Expanded({key, flex, child} : {key?:Key, flex?:int, child:Widget}):Expanded

interface IconButton extends Widget {
}

declare function IconButton({key, iconSize, visualDensity, padding, alignment, splashRadius, color, focusColor, hoverColor, highlightColor, splashColor, disabledColor, onPressed, mouseCursor, focusNode, autofocus, tooltip, enableFeedback, constraints, style, isSelected, selectedIcon, icon} : {key?:Key, iconSize?:double, visualDensity?:VisualDensity, padding?:EdgeInsetsGeometry, alignment?:AlignmentGeometry, splashRadius?:double, color?:Color, focusColor?:Color, hoverColor?:Color, highlightColor?:Color, splashColor?:Color, disabledColor?:Color, onPressed?:VoidCallback, mouseCursor?:MouseCursor, focusNode?:FocusNode, autofocus?:bool, tooltip?:string, enableFeedback?:bool, constraints?:BoxConstraints, style?:ButtonStyle, isSelected?:bool, selectedIcon?:Widget, icon:Widget}):IconButton

interface TextButton {
}

declare function TextButton({key, onPressed, onLongPress, onHover, onFocusChange, style, focusNode, autofocus, clipBehavior, statesController, child} : {key?:Key, onPressed?:VoidCallback, onLongPress?:VoidCallback, onHover?:ValueChanged_bool_, onFocusChange?:ValueChanged_bool_, style?:ButtonStyle, focusNode?:FocusNode, autofocus?:bool, clipBehavior?:Clip, statesController?:MaterialStatesController, child:Widget}):TextButton

declare namespace TextButton {

    function icon({key, onPressed, onLongPress, onHover, onFocusChange, style, focusNode, autofocus, clipBehavior, statesController, icon, label} : {key?:Key, onPressed?:VoidCallback, onLongPress?:VoidCallback, onHover?:ValueChanged_bool_, onFocusChange?:ValueChanged_bool_, style?:ButtonStyle, focusNode?:FocusNode, autofocus?:bool, clipBehavior?:Clip, statesController?:MaterialStatesController, icon:Widget, label:Widget}):TextButton

    function styleFrom({foregroundColor, backgroundColor, disabledForegroundColor, disabledBackgroundColor, shadowColor, surfaceTintColor, iconColor, disabledIconColor, elevation, textStyle, padding, minimumSize, fixedSize, maximumSize, side, shape, enabledMouseCursor, disabledMouseCursor, visualDensity, tapTargetSize, animationDuration, enableFeedback, alignment, splashFactory}? : {foregroundColor?:Color, backgroundColor?:Color, disabledForegroundColor?:Color, disabledBackgroundColor?:Color, shadowColor?:Color, surfaceTintColor?:Color, iconColor?:Color, disabledIconColor?:Color, elevation?:double, textStyle?:TextStyle, padding?:EdgeInsetsGeometry, minimumSize?:Size, fixedSize?:Size, maximumSize?:Size, side?:BorderSide, shape?:OutlinedBorder, enabledMouseCursor?:MouseCursor, disabledMouseCursor?:MouseCursor, visualDensity?:VisualDensity, tapTargetSize?:MaterialTapTargetSize, animationDuration?:Duration, enableFeedback?:bool, alignment?:AlignmentGeometry, splashFactory?:InteractiveInkFeatureFactory}):ButtonStyle
}

interface ElevatedButton {
}

declare function ElevatedButton({key, onPressed, onLongPress, onHover, onFocusChange, style, focusNode, autofocus, clipBehavior, statesController, child}? : {key?:Key, onPressed?:VoidCallback, onLongPress?:VoidCallback, onHover?:ValueChanged_bool_, onFocusChange?:ValueChanged_bool_, style?:ButtonStyle, focusNode?:FocusNode, autofocus?:bool, clipBehavior?:Clip, statesController?:MaterialStatesController, child?:Widget}):ElevatedButton

declare namespace ElevatedButton {

    function icon({key, onPressed, onLongPress, onHover, onFocusChange, style, focusNode, autofocus, clipBehavior, statesController, icon, label} : {key?:Key, onPressed?:VoidCallback, onLongPress?:VoidCallback, onHover?:ValueChanged_bool_, onFocusChange?:ValueChanged_bool_, style?:ButtonStyle, focusNode?:FocusNode, autofocus?:bool, clipBehavior?:Clip, statesController?:MaterialStatesController, icon:Widget, label:Widget}):ElevatedButton

    function styleFrom({foregroundColor, backgroundColor, disabledForegroundColor, disabledBackgroundColor, shadowColor, surfaceTintColor, elevation, textStyle, padding, minimumSize, fixedSize, maximumSize, side, shape, enabledMouseCursor, disabledMouseCursor, visualDensity, tapTargetSize, animationDuration, enableFeedback, alignment, splashFactory, primary, onPrimary, onSurface}? : {foregroundColor?:Color, backgroundColor?:Color, disabledForegroundColor?:Color, disabledBackgroundColor?:Color, shadowColor?:Color, surfaceTintColor?:Color, elevation?:double, textStyle?:TextStyle, padding?:EdgeInsetsGeometry, minimumSize?:Size, fixedSize?:Size, maximumSize?:Size, side?:BorderSide, shape?:OutlinedBorder, enabledMouseCursor?:MouseCursor, disabledMouseCursor?:MouseCursor, visualDensity?:VisualDensity, tapTargetSize?:MaterialTapTargetSize, animationDuration?:Duration, enableFeedback?:bool, alignment?:AlignmentGeometry, splashFactory?:InteractiveInkFeatureFactory, primary?:Color, onPrimary?:Color, onSurface?:Color}):ButtonStyle
}

interface OutlinedButton {
}

declare function OutlinedButton({key, onPressed, onLongPress, onHover, onFocusChange, style, focusNode, autofocus, clipBehavior, statesController, child}? : {key?:Key, onPressed?:VoidCallback, onLongPress?:VoidCallback, onHover?:ValueChanged_bool_, onFocusChange?:ValueChanged_bool_, style?:ButtonStyle, focusNode?:FocusNode, autofocus?:bool, clipBehavior?:Clip, statesController?:MaterialStatesController, child?:Widget}):OutlinedButton

declare namespace OutlinedButton {

    function icon({key, onPressed, onLongPress, style, focusNode, autofocus, clipBehavior, statesController, icon, label} : {key?:Key, onPressed?:VoidCallback, onLongPress?:VoidCallback, style?:ButtonStyle, focusNode?:FocusNode, autofocus?:bool, clipBehavior?:Clip, statesController?:MaterialStatesController, icon:Widget, label:Widget}):OutlinedButton
}

interface IconData {

    readonly codePoint: int

    readonly fontFamily: string
}

declare function IconData(codePoint:int, {fontFamily, fontPackage, matchTextDirection}? : {fontFamily?:string, fontPackage?:string, matchTextDirection?:bool}):IconData

interface Icon {
}

declare function Icon(icon?:IconData, {key, size, fill, weight, grade, opticalSize, color, shadows, semanticLabel, textDirection}? : {key?:Key, size?:double, fill?:double, weight?:double, grade?:double, opticalSize?:double, color?:Color, shadows?:Shadow[], semanticLabel?:string, textDirection?:TextDirection}):Icon

interface Color {

    withOpacity(opacity:double ):Color

    withAlpha(a:int ):Color

    withRed(r:int ):Color

    withGreen(g:int ):Color

    withBlue(b:int ):Color

    computeLuminance( ):double

    readonly value: int

    readonly alpha: int

    readonly opacity: double

    readonly red: int

    readonly green: int

    readonly blue: int
}

declare function Color(value:int):Color

declare namespace Color {

    function fromARGB(a:int, r:int, g:int, b:int):Color

    function fromRGBO(r:int, g:int, b:int, opacity:double):Color

    function lerp(a:Color, b:Color, t:double):Color

    function alphaBlend(foreground:Color, background:Color):Color

    function getAlphaFromOpacity(opacity:double):int
}

interface MaterialColor extends Color {

    readonly shade50: Color

    readonly shade100: Color

    readonly shade200: Color

    readonly shade300: Color

    readonly shade400: Color

    readonly shade500: Color

    readonly shade600: Color

    readonly shade700: Color

    readonly shade800: Color

    readonly shade900: Color
}

interface MaterialAccentColor extends Color {

    readonly shade100: Color

    readonly shade200: Color

    readonly shade400: Color

    readonly shade700: Color
}

interface Colors {
}

declare namespace Colors {

    const transparent: Color

    const black: Color

    const black87: Color

    const black54: Color

    const black45: Color

    const black38: Color

    const black26: Color

    const black12: Color

    const white: Color

    const white70: Color

    const white60: Color

    const white54: Color

    const white38: Color

    const white30: Color

    const white24: Color

    const white12: Color

    const white10: Color

    const red: MaterialColor

    const redAccent: MaterialAccentColor

    const pink: MaterialColor

    const pinkAccent: MaterialAccentColor

    const purple: MaterialColor

    const purpleAccent: MaterialAccentColor

    const deepPurple: MaterialColor

    const deepPurpleAccent: MaterialAccentColor

    const indigo: MaterialColor

    const indigoAccent: MaterialAccentColor

    const blue: MaterialColor

    const blueAccent: MaterialAccentColor

    const lightBlue: MaterialColor

    const lightBlueAccent: MaterialAccentColor

    const cyan: MaterialColor

    const cyanAccent: MaterialAccentColor

    const teal: MaterialColor

    const tealAccent: MaterialAccentColor

    const green: MaterialColor

    const greenAccent: MaterialAccentColor

    const lightGreen: MaterialColor

    const lightGreenAccent: MaterialAccentColor

    const lime: MaterialColor

    const limeAccent: MaterialAccentColor

    const yellow: MaterialColor

    const yellowAccent: MaterialAccentColor

    const amber: MaterialColor

    const amberAccent: MaterialAccentColor

    const orange: MaterialColor

    const orangeAccent: MaterialAccentColor

    const deepOrange: MaterialColor

    const deepOrangeAccent: MaterialAccentColor

    const brown: MaterialColor

    const grey: MaterialColor

    const blueGrey: MaterialColor
}

interface WidgetsBinding {

    scheduleAttachRootWidget(rootWidget:Widget ):void

    scheduleWarmUpFrame( ):void

    attachRootWidget(rootWidget:Widget ):void

    scheduleFrameCallback(callback:FrameCallback, {rescheduling}? : {rescheduling?:bool} ):int

    addPostFrameCallback(callback:FrameCallback ):void

    wrapWithDefaultView(rootWidget:Widget ):Widget
}

declare namespace WidgetsBinding {

    const instance: WidgetsBinding
}

interface WidgetsFlutterBinding extends WidgetsBinding {
}

declare namespace WidgetsFlutterBinding {

    function ensureInitialized():WidgetsBinding
}

interface MaterialApp {
}

declare function MaterialApp({key, navigatorKey, scaffoldMessengerKey, home, routes, initialRoute, onGenerateRoute, onGenerateInitialRoutes, onUnknownRoute, navigatorObservers, builder, title, onGenerateTitle, color, theme, darkTheme, highContrastTheme, highContrastDarkTheme, themeMode, themeAnimationDuration, themeAnimationCurve, locale, localizationsDelegates, localeListResolutionCallback, localeResolutionCallback, supportedLocales, debugShowMaterialGrid, showPerformanceOverlay, checkerboardRasterCacheImages, checkerboardOffscreenLayers, showSemanticsDebugger, debugShowCheckedModeBanner, restorationScopeId, scrollBehavior}? : {key?:Key, navigatorKey?:unknown, scaffoldMessengerKey?:unknown, home?:Widget, routes?:{[id: string]: WidgetBuilder}, initialRoute?:string, onGenerateRoute?:RouteFactory, onGenerateInitialRoutes?:InitialRouteListFactory, onUnknownRoute?:RouteFactory, navigatorObservers?:NavigatorObserver[], builder?:TransitionBuilder, title?:string, onGenerateTitle?:GenerateAppTitle, color?:Color, theme?:ThemeData, darkTheme?:ThemeData, highContrastTheme?:ThemeData, highContrastDarkTheme?:ThemeData, themeMode?:ThemeMode, themeAnimationDuration?:Duration, themeAnimationCurve?:Curve, locale?:Locale, localizationsDelegates?:unknown, localeListResolutionCallback?:LocaleListResolutionCallback, localeResolutionCallback?:LocaleResolutionCallback, supportedLocales?:unknown, debugShowMaterialGrid?:bool, showPerformanceOverlay?:bool, checkerboardRasterCacheImages?:bool, checkerboardOffscreenLayers?:bool, showSemanticsDebugger?:bool, debugShowCheckedModeBanner?:bool, restorationScopeId?:string, scrollBehavior?:ScrollBehavior}):MaterialApp

declare namespace MaterialApp {

    function router({key, scaffoldMessengerKey, routeInformationProvider, routeInformationParser, routerDelegate, routerConfig, backButtonDispatcher, builder, title, onGenerateTitle, color, theme, darkTheme, highContrastTheme, highContrastDarkTheme, themeMode, themeAnimationDuration, themeAnimationCurve, locale, localizationsDelegates, localeListResolutionCallback, localeResolutionCallback, supportedLocales, debugShowMaterialGrid, showPerformanceOverlay, checkerboardRasterCacheImages, checkerboardOffscreenLayers, showSemanticsDebugger, debugShowCheckedModeBanner, restorationScopeId, scrollBehavior}? : {key?:Key, scaffoldMessengerKey?:unknown, routeInformationProvider?:RouteInformationProvider, routeInformationParser?:unknown, routerDelegate?:unknown, routerConfig?:unknown, backButtonDispatcher?:BackButtonDispatcher, builder?:TransitionBuilder, title?:string, onGenerateTitle?:GenerateAppTitle, color?:Color, theme?:ThemeData, darkTheme?:ThemeData, highContrastTheme?:ThemeData, highContrastDarkTheme?:ThemeData, themeMode?:ThemeMode, themeAnimationDuration?:Duration, themeAnimationCurve?:Curve, locale?:Locale, localizationsDelegates?:unknown, localeListResolutionCallback?:LocaleListResolutionCallback, localeResolutionCallback?:LocaleResolutionCallback, supportedLocales?:unknown, debugShowMaterialGrid?:bool, showPerformanceOverlay?:bool, checkerboardRasterCacheImages?:bool, checkerboardOffscreenLayers?:bool, showSemanticsDebugger?:bool, debugShowCheckedModeBanner?:bool, restorationScopeId?:string, scrollBehavior?:ScrollBehavior}):MaterialApp
}

interface ThemeData {

    copyWith({applyElevationOverlayColor, cupertinoOverrideTheme, extensions, inputDecorationTheme, materialTapTargetSize, pageTransitionsTheme, platform, scrollbarTheme, splashFactory, useMaterial3, visualDensity, brightness, canvasColor, cardColor, colorScheme, dialogBackgroundColor, disabledColor, dividerColor, focusColor, highlightColor, hintColor, hoverColor, indicatorColor, primaryColor, primaryColorDark, primaryColorLight, scaffoldBackgroundColor, secondaryHeaderColor, shadowColor, splashColor, unselectedWidgetColor, iconTheme, primaryIconTheme, primaryTextTheme, textTheme, typography, appBarTheme, badgeTheme, bannerTheme, bottomAppBarTheme, bottomNavigationBarTheme, bottomSheetTheme, buttonBarTheme, buttonTheme, cardTheme, checkboxTheme, chipTheme, dataTableTheme, dialogTheme, dividerTheme, drawerTheme, elevatedButtonTheme, expansionTileTheme, filledButtonTheme, floatingActionButtonTheme, iconButtonTheme, listTileTheme, menuBarTheme, menuButtonTheme, menuTheme, navigationBarTheme, navigationDrawerTheme, navigationRailTheme, outlinedButtonTheme, popupMenuTheme, progressIndicatorTheme, radioTheme, segmentedButtonTheme, sliderTheme, snackBarTheme, switchTheme, tabBarTheme, textButtonTheme, textSelectionTheme, timePickerTheme, toggleButtonsTheme, tooltipTheme, fixTextFieldOutlineLabel, primaryColorBrightness, androidOverscrollIndicator, toggleableActiveColor, selectedRowColor, errorColor, backgroundColor, bottomAppBarColor}? : {applyElevationOverlayColor?:bool, cupertinoOverrideTheme?:NoDefaultCupertinoThemeData, extensions?:unknown, inputDecorationTheme?:InputDecorationTheme, materialTapTargetSize?:MaterialTapTargetSize, pageTransitionsTheme?:PageTransitionsTheme, platform?:TargetPlatform, scrollbarTheme?:ScrollbarThemeData, splashFactory?:InteractiveInkFeatureFactory, useMaterial3?:bool, visualDensity?:VisualDensity, brightness?:Brightness, canvasColor?:Color, cardColor?:Color, colorScheme?:ColorScheme, dialogBackgroundColor?:Color, disabledColor?:Color, dividerColor?:Color, focusColor?:Color, highlightColor?:Color, hintColor?:Color, hoverColor?:Color, indicatorColor?:Color, primaryColor?:Color, primaryColorDark?:Color, primaryColorLight?:Color, scaffoldBackgroundColor?:Color, secondaryHeaderColor?:Color, shadowColor?:Color, splashColor?:Color, unselectedWidgetColor?:Color, iconTheme?:IconThemeData, primaryIconTheme?:IconThemeData, primaryTextTheme?:TextTheme, textTheme?:TextTheme, typography?:Typography, appBarTheme?:AppBarTheme, badgeTheme?:BadgeThemeData, bannerTheme?:MaterialBannerThemeData, bottomAppBarTheme?:BottomAppBarTheme, bottomNavigationBarTheme?:BottomNavigationBarThemeData, bottomSheetTheme?:BottomSheetThemeData, buttonBarTheme?:ButtonBarThemeData, buttonTheme?:ButtonThemeData, cardTheme?:CardTheme, checkboxTheme?:CheckboxThemeData, chipTheme?:ChipThemeData, dataTableTheme?:DataTableThemeData, dialogTheme?:DialogTheme, dividerTheme?:DividerThemeData, drawerTheme?:DrawerThemeData, elevatedButtonTheme?:ElevatedButtonThemeData, expansionTileTheme?:ExpansionTileThemeData, filledButtonTheme?:FilledButtonThemeData, floatingActionButtonTheme?:FloatingActionButtonThemeData, iconButtonTheme?:IconButtonThemeData, listTileTheme?:ListTileThemeData, menuBarTheme?:MenuBarThemeData, menuButtonTheme?:MenuButtonThemeData, menuTheme?:MenuThemeData, navigationBarTheme?:NavigationBarThemeData, navigationDrawerTheme?:NavigationDrawerThemeData, navigationRailTheme?:NavigationRailThemeData, outlinedButtonTheme?:OutlinedButtonThemeData, popupMenuTheme?:PopupMenuThemeData, progressIndicatorTheme?:ProgressIndicatorThemeData, radioTheme?:RadioThemeData, segmentedButtonTheme?:SegmentedButtonThemeData, sliderTheme?:SliderThemeData, snackBarTheme?:SnackBarThemeData, switchTheme?:SwitchThemeData, tabBarTheme?:TabBarTheme, textButtonTheme?:TextButtonThemeData, textSelectionTheme?:TextSelectionThemeData, timePickerTheme?:TimePickerThemeData, toggleButtonsTheme?:ToggleButtonsThemeData, tooltipTheme?:TooltipThemeData, fixTextFieldOutlineLabel?:bool, primaryColorBrightness?:Brightness, androidOverscrollIndicator?:AndroidOverscrollIndicator, toggleableActiveColor?:Color, selectedRowColor?:Color, errorColor?:Color, backgroundColor?:Color, bottomAppBarColor?:Color} ):ThemeData

    readonly colorScheme: ColorScheme

    readonly textTheme: TextTheme

    readonly primaryTextTheme: TextTheme

    readonly dialogBackgroundColor: Color

    readonly disabledColor: Color

    readonly dividerColor: Color

    readonly focusColor: Color

    readonly highlightColor: Color

    readonly hintColor: Color

    readonly hoverColor: Color

    readonly indicatorColor: Color

    readonly primaryColor: Color

    readonly primaryColorDark: Color

    readonly primaryColorLight: Color

    readonly scaffoldBackgroundColor: Color

    readonly secondaryHeaderColor: Color

    readonly shadowColor: Color

    readonly splashColor: Color

    readonly unselectedWidgetColor: Color
}

declare function ThemeData({useMaterial3, primarySwatch, brightness, colorSchemeSeed}? : {useMaterial3?:bool, primarySwatch?:MaterialColor, brightness?:Brightness, colorSchemeSeed?:Color}):ThemeData

interface Theme {
}

declare function Theme({key, data, child} : {key?:Key, data:ThemeData, child:Widget}):Theme

declare namespace Theme {

    function of(context:BuildContext):ThemeData
}

interface ColorScheme {

    copyWith({brightness, primary, onPrimary, primaryContainer, onPrimaryContainer, secondary, onSecondary, secondaryContainer, onSecondaryContainer, tertiary, onTertiary, tertiaryContainer, onTertiaryContainer, error, onError, errorContainer, onErrorContainer, background, onBackground, surface, onSurface, surfaceVariant, onSurfaceVariant, outline, outlineVariant, shadow, scrim, inverseSurface, onInverseSurface, inversePrimary, surfaceTint, primaryVariant, secondaryVariant}? : {brightness?:Brightness, primary?:Color, onPrimary?:Color, primaryContainer?:Color, onPrimaryContainer?:Color, secondary?:Color, onSecondary?:Color, secondaryContainer?:Color, onSecondaryContainer?:Color, tertiary?:Color, onTertiary?:Color, tertiaryContainer?:Color, onTertiaryContainer?:Color, error?:Color, onError?:Color, errorContainer?:Color, onErrorContainer?:Color, background?:Color, onBackground?:Color, surface?:Color, onSurface?:Color, surfaceVariant?:Color, onSurfaceVariant?:Color, outline?:Color, outlineVariant?:Color, shadow?:Color, scrim?:Color, inverseSurface?:Color, onInverseSurface?:Color, inversePrimary?:Color, surfaceTint?:Color, primaryVariant?:Color, secondaryVariant?:Color} ):ColorScheme

    readonly background: Color

    readonly brightness: Brightness

    readonly error: Color

    readonly errorContainer: Color

    readonly inversePrimary: Color

    readonly inverseSurface: Color

    readonly onBackground: Color

    readonly onError: Color

    readonly onErrorContainer: Color

    readonly onInverseSurface: Color

    readonly onPrimary: Color

    readonly onPrimaryContainer: Color

    readonly onSecondary: Color

    readonly onSecondaryContainer: Color

    readonly onSurface: Color

    readonly onSurfaceVariant: Color

    readonly onTertiary: Color

    readonly onTertiaryContainer: Color

    readonly outline: Color

    readonly outlineVariant: Color

    readonly primary: Color

    readonly primaryContainer: Color

    readonly scrim: Color

    readonly secondary: Color

    readonly secondaryContainer: Color

    readonly shadow: Color

    readonly surface: Color

    readonly surfaceTint: Color

    readonly surfaceVariant: Color

    readonly tertiary: Color

    readonly tertiaryContainer: Color
}

declare function ColorScheme({brightness, primary, onPrimary, primaryContainer, onPrimaryContainer, secondary, onSecondary, secondaryContainer, onSecondaryContainer, tertiary, onTertiary, tertiaryContainer, onTertiaryContainer, error, onError, errorContainer, onErrorContainer, background, onBackground, surface, onSurface, surfaceVariant, onSurfaceVariant, outline, outlineVariant, shadow, scrim, inverseSurface, onInverseSurface, inversePrimary, surfaceTint} : {brightness:Brightness, primary:Color, onPrimary:Color, primaryContainer?:Color, onPrimaryContainer?:Color, secondary:Color, onSecondary:Color, secondaryContainer?:Color, onSecondaryContainer?:Color, tertiary?:Color, onTertiary?:Color, tertiaryContainer?:Color, onTertiaryContainer?:Color, error:Color, onError:Color, errorContainer?:Color, onErrorContainer?:Color, background:Color, onBackground:Color, surface:Color, onSurface:Color, surfaceVariant?:Color, onSurfaceVariant?:Color, outline?:Color, outlineVariant?:Color, shadow?:Color, scrim?:Color, inverseSurface?:Color, onInverseSurface?:Color, inversePrimary?:Color, surfaceTint?:Color}):ColorScheme

declare namespace ColorScheme {

    function dark({brightness, primary, onPrimary, primaryContainer, onPrimaryContainer, secondary, onSecondary, secondaryContainer, onSecondaryContainer, tertiary, onTertiary, tertiaryContainer, onTertiaryContainer, error, onError, errorContainer, onErrorContainer, background, onBackground, surface, onSurface, surfaceVariant, onSurfaceVariant, outline, outlineVariant, shadow, scrim, inverseSurface, onInverseSurface, inversePrimary, surfaceTint}? : {brightness?:Brightness, primary?:Color, onPrimary?:Color, primaryContainer?:Color, onPrimaryContainer?:Color, secondary?:Color, onSecondary?:Color, secondaryContainer?:Color, onSecondaryContainer?:Color, tertiary?:Color, onTertiary?:Color, tertiaryContainer?:Color, onTertiaryContainer?:Color, error?:Color, onError?:Color, errorContainer?:Color, onErrorContainer?:Color, background?:Color, onBackground?:Color, surface?:Color, onSurface?:Color, surfaceVariant?:Color, onSurfaceVariant?:Color, outline?:Color, outlineVariant?:Color, shadow?:Color, scrim?:Color, inverseSurface?:Color, onInverseSurface?:Color, inversePrimary?:Color, surfaceTint?:Color}):ColorScheme

    function fromSeed({seedColor, brightness, primary, onPrimary, primaryContainer, onPrimaryContainer, secondary, onSecondary, secondaryContainer, onSecondaryContainer, tertiary, onTertiary, tertiaryContainer, onTertiaryContainer, error, onError, errorContainer, onErrorContainer, outline, outlineVariant, background, onBackground, surface, onSurface, surfaceVariant, onSurfaceVariant, inverseSurface, onInverseSurface, inversePrimary, shadow, scrim, surfaceTint} : {seedColor:Color, brightness?:Brightness, primary?:Color, onPrimary?:Color, primaryContainer?:Color, onPrimaryContainer?:Color, secondary?:Color, onSecondary?:Color, secondaryContainer?:Color, onSecondaryContainer?:Color, tertiary?:Color, onTertiary?:Color, tertiaryContainer?:Color, onTertiaryContainer?:Color, error?:Color, onError?:Color, errorContainer?:Color, onErrorContainer?:Color, outline?:Color, outlineVariant?:Color, background?:Color, onBackground?:Color, surface?:Color, onSurface?:Color, surfaceVariant?:Color, onSurfaceVariant?:Color, inverseSurface?:Color, onInverseSurface?:Color, inversePrimary?:Color, shadow?:Color, scrim?:Color, surfaceTint?:Color}):ColorScheme

    function fromSwatch({primarySwatch, primaryColorDark, accentColor, cardColor, backgroundColor, errorColor, brightness}? : {primarySwatch?:MaterialColor, primaryColorDark?:Color, accentColor?:Color, cardColor?:Color, backgroundColor?:Color, errorColor?:Color, brightness?:Brightness}):ColorScheme

    function highContrastDark({brightness, primary, onPrimary, primaryContainer, onPrimaryContainer, secondary, onSecondary, secondaryContainer, onSecondaryContainer, tertiary, onTertiary, tertiaryContainer, onTertiaryContainer, error, onError, errorContainer, onErrorContainer, background, onBackground, surface, onSurface, surfaceVariant, onSurfaceVariant, outline, outlineVariant, shadow, scrim, inverseSurface, onInverseSurface, inversePrimary, surfaceTint}? : {brightness?:Brightness, primary?:Color, onPrimary?:Color, primaryContainer?:Color, onPrimaryContainer?:Color, secondary?:Color, onSecondary?:Color, secondaryContainer?:Color, onSecondaryContainer?:Color, tertiary?:Color, onTertiary?:Color, tertiaryContainer?:Color, onTertiaryContainer?:Color, error?:Color, onError?:Color, errorContainer?:Color, onErrorContainer?:Color, background?:Color, onBackground?:Color, surface?:Color, onSurface?:Color, surfaceVariant?:Color, onSurfaceVariant?:Color, outline?:Color, outlineVariant?:Color, shadow?:Color, scrim?:Color, inverseSurface?:Color, onInverseSurface?:Color, inversePrimary?:Color, surfaceTint?:Color}):ColorScheme

    function highContrastLight({brightness, primary, onPrimary, primaryContainer, onPrimaryContainer, secondary, onSecondary, secondaryContainer, onSecondaryContainer, tertiary, onTertiary, tertiaryContainer, onTertiaryContainer, error, onError, errorContainer, onErrorContainer, background, onBackground, surface, onSurface, surfaceVariant, onSurfaceVariant, outline, outlineVariant, shadow, scrim, inverseSurface, onInverseSurface, inversePrimary, surfaceTint}? : {brightness?:Brightness, primary?:Color, onPrimary?:Color, primaryContainer?:Color, onPrimaryContainer?:Color, secondary?:Color, onSecondary?:Color, secondaryContainer?:Color, onSecondaryContainer?:Color, tertiary?:Color, onTertiary?:Color, tertiaryContainer?:Color, onTertiaryContainer?:Color, error?:Color, onError?:Color, errorContainer?:Color, onErrorContainer?:Color, background?:Color, onBackground?:Color, surface?:Color, onSurface?:Color, surfaceVariant?:Color, onSurfaceVariant?:Color, outline?:Color, outlineVariant?:Color, shadow?:Color, scrim?:Color, inverseSurface?:Color, onInverseSurface?:Color, inversePrimary?:Color, surfaceTint?:Color}):ColorScheme

    function light({brightness, primary, onPrimary, primaryContainer, onPrimaryContainer, secondary, onSecondary, secondaryContainer, onSecondaryContainer, tertiary, onTertiary, tertiaryContainer, onTertiaryContainer, error, onError, errorContainer, onErrorContainer, background, onBackground, surface, onSurface, surfaceVariant, onSurfaceVariant, outline, outlineVariant, shadow, scrim, inverseSurface, onInverseSurface, inversePrimary, surfaceTint}? : {brightness?:Brightness, primary?:Color, onPrimary?:Color, primaryContainer?:Color, onPrimaryContainer?:Color, secondary?:Color, onSecondary?:Color, secondaryContainer?:Color, onSecondaryContainer?:Color, tertiary?:Color, onTertiary?:Color, tertiaryContainer?:Color, onTertiaryContainer?:Color, error?:Color, onError?:Color, errorContainer?:Color, onErrorContainer?:Color, background?:Color, onBackground?:Color, surface?:Color, onSurface?:Color, surfaceVariant?:Color, onSurfaceVariant?:Color, outline?:Color, outlineVariant?:Color, shadow?:Color, scrim?:Color, inverseSurface?:Color, onInverseSurface?:Color, inversePrimary?:Color, surfaceTint?:Color}):ColorScheme

    function lerp(a:ColorScheme, b:ColorScheme, t:double):ColorScheme
}

interface TextTheme {

    readonly displayLarge: TextStyle

    readonly displayMedium: TextStyle

    readonly displaySmall: TextStyle

    readonly headlineLarge: TextStyle

    readonly headlineMedium: TextStyle

    readonly headlineSmall: TextStyle

    readonly titleLarge: TextStyle

    readonly titleMedium: TextStyle

    readonly titleSmall: TextStyle

    readonly bodyLarge: TextStyle

    readonly bodyMedium: TextStyle

    readonly bodySmall: TextStyle

    readonly labelLarge: TextStyle

    readonly labelMedium: TextStyle

    readonly labelSmall: TextStyle
}

interface NavigationService {
}

declare namespace NavigationService {

    function context():BuildContext

    let navigatorKey: unknown
}

interface Navigator {
}

declare namespace Navigator {

    function of(context:BuildContext, {rootNavigator}? : {rootNavigator?:bool}):NavigatorState
}

interface NavigatorState {

    pushReplacementNamed(routeName:string ):void

    popAndPushNamed(routeName:string ):void

    pushNamed(routeName:string ):void

    canPop( ):bool

    pop(result?:Object ):void

    push(route:Route ):void

    removeRoute(route:Route ):void
}

interface Route {
}

interface DialogRoute extends Route {
}

declare function DialogRoute({context, builder, themes, barrierColor, barrierDismissible, barrierLabel, useSafeArea, settings, anchorPoint} : {context:BuildContext, builder:WidgetBuilder, themes?:CapturedThemes, barrierColor?:Color, barrierDismissible?:bool, barrierLabel?:string, useSafeArea?:bool, settings?:RouteSettings, anchorPoint?:Offset}):DialogRoute

interface Center {
}

declare function Center({key, widthFactor, heightFactor, child}? : {key?:Key, widthFactor?:double, heightFactor?:double, child?:Widget}):Center

interface LStatelessWidget {
}

declare function LStatelessWidget({key, builder} : {key?:Key, builder:WidgetBuilder}):LStatelessWidget

interface LStatefulWidget {
}

declare function LStatefulWidget({key, stateCreator} : {key?:Key, stateCreator:StateCreator}):LStatefulWidget

interface LState {

    markNeedsBuild( ):void
}

declare function LState({builder, onInit} : {builder:WidgetBuilder, onInit?:VoidCallback}):LState

interface Builder {
}

declare function Builder({key, builder} : {key?:Key, builder:WidgetBuilder}):Builder

interface StatefulBuilder {
}

declare function StatefulBuilder({key, builder} : {key?:Key, builder:StatefulWidgetBuilder}):StatefulBuilder

interface SizedBox {
}

declare function SizedBox({key, width, height, child}? : {key?:Key, width?:double, height?:double, child?:Widget}):SizedBox

declare namespace SizedBox {

    function expand({key, child}? : {key?:Key, child?:Widget}):SizedBox

    function fromSize({key, child, size}? : {key?:Key, child?:Widget, size?:Size}):SizedBox

    function shrink({key, child}? : {key?:Key, child?:Widget}):SizedBox

    function square({key, child, dimension}? : {key?:Key, child?:Widget, dimension?:double}):SizedBox
}

interface Spacer {
}

declare function Spacer({key, flex}? : {key?:Key, flex?:int}):Spacer

interface Material {
}

declare function Material({key, type, elevation, color, shadowColor, surfaceTintColor, textStyle, borderRadius, shape, borderOnForeground, clipBehavior, animationDuration, child}? : {key?:Key, type?:MaterialType, elevation?:double, color?:Color, shadowColor?:Color, surfaceTintColor?:Color, textStyle?:TextStyle, borderRadius?:BorderRadiusGeometry, shape?:ShapeBorder, borderOnForeground?:bool, clipBehavior?:Clip, animationDuration?:Duration, child?:Widget}):Material

interface InkWell {
}

declare function InkWell({key, child, onTap, onDoubleTap, onLongPress, onTapDown, onTapUp, onTapCancel, onSecondaryTap, onSecondaryTapUp, onSecondaryTapDown, onSecondaryTapCancel, onHighlightChanged, onHover, mouseCursor, focusColor, hoverColor, highlightColor, overlayColor, splashColor, splashFactory, radius, borderRadius, customBorder, enableFeedback, excludeFromSemantics, focusNode, canRequestFocus, onFocusChange, autofocus, statesController}? : {key?:Key, child?:Widget, onTap?:GestureTapCallback, onDoubleTap?:GestureTapCallback, onLongPress?:GestureLongPressCallback, onTapDown?:GestureTapDownCallback, onTapUp?:GestureTapUpCallback, onTapCancel?:GestureTapCallback, onSecondaryTap?:GestureTapCallback, onSecondaryTapUp?:GestureTapUpCallback, onSecondaryTapDown?:GestureTapDownCallback, onSecondaryTapCancel?:GestureTapCallback, onHighlightChanged?:ValueChanged_bool_, onHover?:ValueChanged_bool_, mouseCursor?:MouseCursor, focusColor?:Color, hoverColor?:Color, highlightColor?:Color, overlayColor?:unknown, splashColor?:Color, splashFactory?:InteractiveInkFeatureFactory, radius?:double, borderRadius?:BorderRadius, customBorder?:ShapeBorder, enableFeedback?:bool, excludeFromSemantics?:bool, focusNode?:FocusNode, canRequestFocus?:bool, onFocusChange?:ValueChanged_bool_, autofocus?:bool, statesController?:MaterialStatesController}):InkWell

interface InkResponse {
}

declare function InkResponse({key, child, onTap, onTapDown, onTapUp, onTapCancel, onDoubleTap, onLongPress, onSecondaryTap, onSecondaryTapUp, onSecondaryTapDown, onSecondaryTapCancel, onHighlightChanged, onHover, mouseCursor, containedInkWell, highlightShape, radius, borderRadius, customBorder, focusColor, hoverColor, highlightColor, overlayColor, splashColor, splashFactory, enableFeedback, excludeFromSemantics, focusNode, canRequestFocus, onFocusChange, autofocus, statesController}? : {key?:Key, child?:Widget, onTap?:GestureTapCallback, onTapDown?:GestureTapDownCallback, onTapUp?:GestureTapUpCallback, onTapCancel?:GestureTapCallback, onDoubleTap?:GestureTapCallback, onLongPress?:GestureLongPressCallback, onSecondaryTap?:GestureTapCallback, onSecondaryTapUp?:GestureTapUpCallback, onSecondaryTapDown?:GestureTapDownCallback, onSecondaryTapCancel?:GestureTapCallback, onHighlightChanged?:ValueChanged_bool_, onHover?:ValueChanged_bool_, mouseCursor?:MouseCursor, containedInkWell?:bool, highlightShape?:BoxShape, radius?:double, borderRadius?:BorderRadius, customBorder?:ShapeBorder, focusColor?:Color, hoverColor?:Color, highlightColor?:Color, overlayColor?:unknown, splashColor?:Color, splashFactory?:InteractiveInkFeatureFactory, enableFeedback?:bool, excludeFromSemantics?:bool, focusNode?:FocusNode, canRequestFocus?:bool, onFocusChange?:ValueChanged_bool_, autofocus?:bool, statesController?:MaterialStatesController}):InkResponse

interface Scrollbar {
}

declare function Scrollbar({key, child, controller, thumbVisibility, trackVisibility, thickness, radius, notificationPredicate, interactive, scrollbarOrientation} : {key?:Key, child:Widget, controller?:ScrollController, thumbVisibility?:bool, trackVisibility?:bool, thickness?:double, radius?:Radius, notificationPredicate?:ScrollNotificationPredicate, interactive?:bool, scrollbarOrientation?:ScrollbarOrientation}):Scrollbar

interface ScrollController {
}

declare function ScrollController({initialScrollOffset, keepScrollOffset, debugLabel}? : {initialScrollOffset?:double, keepScrollOffset?:bool, debugLabel?:string}):ScrollController

interface ListView {
}

declare function ListView({key, scrollDirection, reverse, controller, primary, physics, shrinkWrap, padding, itemExtent, prototypeItem, addAutomaticKeepAlives, addRepaintBoundaries, addSemanticIndexes, cacheExtent, children, semanticChildCount, dragStartBehavior, keyboardDismissBehavior, restorationId, clipBehavior}? : {key?:Key, scrollDirection?:Axis, reverse?:bool, controller?:ScrollController, primary?:bool, physics?:ScrollPhysics, shrinkWrap?:bool, padding?:EdgeInsetsGeometry, itemExtent?:double, prototypeItem?:Widget, addAutomaticKeepAlives?:bool, addRepaintBoundaries?:bool, addSemanticIndexes?:bool, cacheExtent?:double, children?:Widget[], semanticChildCount?:int, dragStartBehavior?:DragStartBehavior, keyboardDismissBehavior?:ScrollViewKeyboardDismissBehavior, restorationId?:string, clipBehavior?:Clip}):ListView

declare namespace ListView {

    function builder({key, scrollDirection, reverse, controller, primary, physics, shrinkWrap, padding, itemExtent, prototypeItem, itemBuilder, findChildIndexCallback, itemCount, addAutomaticKeepAlives, addRepaintBoundaries, addSemanticIndexes, cacheExtent, semanticChildCount, dragStartBehavior, keyboardDismissBehavior, restorationId, clipBehavior} : {key?:Key, scrollDirection?:Axis, reverse?:bool, controller?:ScrollController, primary?:bool, physics?:ScrollPhysics, shrinkWrap?:bool, padding?:EdgeInsetsGeometry, itemExtent?:double, prototypeItem?:Widget, itemBuilder:NullableIndexedWidgetBuilder, findChildIndexCallback?:ChildIndexGetter, itemCount?:int, addAutomaticKeepAlives?:bool, addRepaintBoundaries?:bool, addSemanticIndexes?:bool, cacheExtent?:double, semanticChildCount?:int, dragStartBehavior?:DragStartBehavior, keyboardDismissBehavior?:ScrollViewKeyboardDismissBehavior, restorationId?:string, clipBehavior?:Clip}):ListView
}

interface SingleChildScrollView {
}

declare function SingleChildScrollView({key, scrollDirection, reverse, padding, primary, physics, controller, child, dragStartBehavior, clipBehavior, restorationId, keyboardDismissBehavior}? : {key?:Key, scrollDirection?:Axis, reverse?:bool, padding?:EdgeInsetsGeometry, primary?:bool, physics?:ScrollPhysics, controller?:ScrollController, child?:Widget, dragStartBehavior?:DragStartBehavior, clipBehavior?:Clip, restorationId?:string, keyboardDismissBehavior?:ScrollViewKeyboardDismissBehavior}):SingleChildScrollView

interface BlockPointer {
}

declare function BlockPointer({key, child}? : {key?:Key, child?:Widget}):BlockPointer

interface ListTile {
}

declare function ListTile({key, leading, title, subtitle, trailing, isThreeLine, dense, visualDensity, shape, style, selectedColor, iconColor, textColor, contentPadding, enabled, onTap, onLongPress, mouseCursor, selected, focusColor, hoverColor, splashColor, focusNode, autofocus, tileColor, selectedTileColor, enableFeedback, horizontalTitleGap, minVerticalPadding, minLeadingWidth}? : {key?:Key, leading?:Widget, title?:Widget, subtitle?:Widget, trailing?:Widget, isThreeLine?:bool, dense?:bool, visualDensity?:VisualDensity, shape?:ShapeBorder, style?:ListTileStyle, selectedColor?:Color, iconColor?:Color, textColor?:Color, contentPadding?:EdgeInsetsGeometry, enabled?:bool, onTap?:GestureTapCallback, onLongPress?:GestureLongPressCallback, mouseCursor?:MouseCursor, selected?:bool, focusColor?:Color, hoverColor?:Color, splashColor?:Color, focusNode?:FocusNode, autofocus?:bool, tileColor?:Color, selectedTileColor?:Color, enableFeedback?:bool, horizontalTitleGap?:double, minVerticalPadding?:double, minLeadingWidth?:double}):ListTile

interface Container {
}

declare function Container({key, alignment, padding, color, decoration, foregroundDecoration, width, height, constraints, margin, transform, transformAlignment, child, clipBehavior}? : {key?:Key, alignment?:AlignmentGeometry, padding?:EdgeInsetsGeometry, color?:Color, decoration?:Decoration, foregroundDecoration?:Decoration, width?:double, height?:double, constraints?:BoxConstraints, margin?:EdgeInsetsGeometry, transform?:Matrix4, transformAlignment?:AlignmentGeometry, child?:Widget, clipBehavior?:Clip}):Container

interface Decoration {
}

interface BoxDecoration extends Decoration {
}

declare function BoxDecoration({color, image, border, borderRadius, boxShadow, gradient, backgroundBlendMode, shape}? : {color?:Color, image?:DecorationImage, border?:BoxBorder, borderRadius?:BorderRadiusGeometry, boxShadow?:BoxShadow[], gradient?:Gradient, backgroundBlendMode?:BlendMode, shape?:BoxShape}):BoxDecoration

interface ShapeDecoration extends Decoration {
}

declare function ShapeDecoration({color, image, gradient, shadows, shape} : {color?:Color, image?:DecorationImage, gradient?:Gradient, shadows?:BoxShadow[], shape:ShapeBorder}):ShapeDecoration

declare namespace ShapeDecoration {

    function fromBoxDecoration(source:BoxDecoration):ShapeDecoration
}

interface DecoratedBox {
}

declare function DecoratedBox({key, decoration, position, child} : {key?:Key, decoration:Decoration, position?:DecorationPosition, child?:Widget}):DecoratedBox

interface BorderSide {
}

declare function BorderSide({color, width, style, strokeAlign}? : {color?:Color, width?:double, style?:BorderStyle, strokeAlign?:double}):BorderSide

declare namespace BorderSide {

    const none: BorderSide

    const strokeAlignInside: double

    const strokeAlignCenter: double

    const strokeAlignOutside: double
}

interface Border {
}

declare function Border({top, right, bottom, left}? : {top?:BorderSide, right?:BorderSide, bottom?:BorderSide, left?:BorderSide}):Border

declare namespace Border {

    function all({color, width, style, strokeAlign}? : {color?:Color, width?:double, style?:BorderStyle, strokeAlign?:double}):Border

    function fromBorderSide(side:BorderSide):Border

    function symmetric({vertical, horizontal}? : {vertical?:BorderSide, horizontal?:BorderSide}):Border
}

interface Radius {

    readonly x: double

    readonly y: double
}

declare namespace Radius {

    function circular(radius:double):Radius

    function elliptical(x:double, y:double):Radius

    const zero: Radius
}

interface BorderRadiusGeometry {
}

interface BorderRadius extends BorderRadiusGeometry {
}

declare namespace BorderRadius {

    function all(radius:Radius):BorderRadius

    function circular(radius:double):BorderRadius

    function vertical({top, bottom}? : {top?:Radius, bottom?:Radius}):BorderRadius

    function horizontal({left, right}? : {left?:Radius, right?:Radius}):BorderRadius

    function only({topLeft, topRight, bottomLeft, bottomRight}? : {topLeft?:Radius, topRight?:Radius, bottomLeft?:Radius, bottomRight?:Radius}):BorderRadius
}

interface Ink {
}

declare function Ink({key, padding, color, decoration, width, height, child}? : {key?:Key, padding?:EdgeInsetsGeometry, color?:Color, decoration?:Decoration, width?:double, height?:double, child?:Widget}):Ink

interface InputDecoration {
}

declare function InputDecoration({icon, iconColor, label, labelText, labelStyle, floatingLabelStyle, helperText, helperStyle, helperMaxLines, hintText, hintStyle, hintTextDirection, hintMaxLines, errorText, errorStyle, errorMaxLines, floatingLabelBehavior, floatingLabelAlignment, isCollapsed, isDense, contentPadding, prefixIcon, prefixIconConstraints, prefix, prefixText, prefixStyle, prefixIconColor, suffixIcon, suffix, suffixText, suffixStyle, suffixIconColor, suffixIconConstraints, counter, counterText, counterStyle, filled, fillColor, focusColor, hoverColor, errorBorder, focusedBorder, focusedErrorBorder, disabledBorder, enabledBorder, border, enabled, semanticCounterText, alignLabelWithHint, constraints}? : {icon?:Widget, iconColor?:Color, label?:Widget, labelText?:string, labelStyle?:TextStyle, floatingLabelStyle?:TextStyle, helperText?:string, helperStyle?:TextStyle, helperMaxLines?:int, hintText?:string, hintStyle?:TextStyle, hintTextDirection?:TextDirection, hintMaxLines?:int, errorText?:string, errorStyle?:TextStyle, errorMaxLines?:int, floatingLabelBehavior?:FloatingLabelBehavior, floatingLabelAlignment?:FloatingLabelAlignment, isCollapsed?:bool, isDense?:bool, contentPadding?:EdgeInsetsGeometry, prefixIcon?:Widget, prefixIconConstraints?:BoxConstraints, prefix?:Widget, prefixText?:string, prefixStyle?:TextStyle, prefixIconColor?:Color, suffixIcon?:Widget, suffix?:Widget, suffixText?:string, suffixStyle?:TextStyle, suffixIconColor?:Color, suffixIconConstraints?:BoxConstraints, counter?:Widget, counterText?:string, counterStyle?:TextStyle, filled?:bool, fillColor?:Color, focusColor?:Color, hoverColor?:Color, errorBorder?:InputBorder, focusedBorder?:InputBorder, focusedErrorBorder?:InputBorder, disabledBorder?:InputBorder, enabledBorder?:InputBorder, border?:InputBorder, enabled?:bool, semanticCounterText?:string, alignLabelWithHint?:bool, constraints?:BoxConstraints}):InputDecoration

declare namespace InputDecoration {

    function collapsed({hintText, floatingLabelBehavior, floatingLabelAlignment, hintStyle, hintTextDirection, filled, fillColor, focusColor, hoverColor, border, enabled}? : {hintText?:string, floatingLabelBehavior?:FloatingLabelBehavior, floatingLabelAlignment?:FloatingLabelAlignment, hintStyle?:TextStyle, hintTextDirection?:TextDirection, filled?:bool, fillColor?:Color, focusColor?:Color, hoverColor?:Color, border?:InputBorder, enabled?:bool}):InputDecoration
}

interface OutlineInputBorder {
}

declare function OutlineInputBorder({borderSide, borderRadius, gapPadding}? : {borderSide?:BorderSide, borderRadius?:BorderRadius, gapPadding?:double}):OutlineInputBorder

interface Padding {
}

declare function Padding({key, padding, child} : {key?:Key, padding:EdgeInsetsGeometry, child?:Widget}):Padding

interface EdgeInsetsGeometry {
}

interface EdgeInsets extends EdgeInsetsGeometry {
}

declare namespace EdgeInsets {

    function all(value:double):EdgeInsets

    function fromLTRB(left:double, top:double, right:double, bottom:double):EdgeInsets

    function fromWindowPadding(padding:WindowPadding, devicePixelRatio:double):EdgeInsets

    function only({left, top, right, bottom}? : {left?:double, top?:double, right?:double, bottom?:double}):EdgeInsets

    function symmetric({vertical, horizontal}? : {vertical?:double, horizontal?:double}):EdgeInsets

    const zero: EdgeInsets
}

interface Size {

    readonly aspectRatio: double

    readonly flipped: Size

    readonly height: double

    readonly isEmpty: bool

    readonly isFinite: bool

    readonly isInfinite: bool

    readonly longestSide: double

    readonly shortestSide: double

    readonly width: double
}

declare function Size(width:double, height:double):Size

declare namespace Size {

    function copy(source:Size):Size

    function fromHeight(height:double):Size

    function fromRadius(radius:double):Size

    function fromWidth(width:double):Size

    function square(dimension:double):Size
}

interface BoxConstraints {

    readonly biggest: Size

    readonly flipped: BoxConstraints

    readonly hasBoundedHeight: bool

    readonly hasBoundedWidth: bool

    readonly hasInfiniteHeight: bool

    readonly hasInfiniteWidth: bool

    readonly hasTightHeight: bool

    readonly hasTightWidth: bool

    readonly isNormalized: bool

    readonly isTight: bool

    readonly maxHeight: double

    readonly maxWidth: double

    readonly minHeight: double

    readonly minWidth: double

    readonly smallest: Size
}

declare function BoxConstraints({minWidth, maxWidth, minHeight, maxHeight}? : {minWidth?:double, maxWidth?:double, minHeight?:double, maxHeight?:double}):BoxConstraints

declare namespace BoxConstraints {

    function expand({width, height}? : {width?:double, height?:double}):BoxConstraints

    function loose(size:Size):BoxConstraints

    function tight(size:Size):BoxConstraints

    function tightFor({width, height}? : {width?:double, height?:double}):BoxConstraints

    function tightForFinite({width, height}? : {width?:double, height?:double}):BoxConstraints
}

interface ConstrainedBox {
}

declare function ConstrainedBox({key, constraints, child} : {key?:Key, constraints:BoxConstraints, child?:Widget}):ConstrainedBox

interface LimitedBox {
}

declare function LimitedBox({key, maxWidth, maxHeight, child}? : {key?:Key, maxWidth?:double, maxHeight?:double, child?:Widget}):LimitedBox

interface Checkbox {
}

declare function Checkbox({key, value, tristate, onChanged, mouseCursor, activeColor, fillColor, checkColor, focusColor, hoverColor, overlayColor, splashRadius, materialTapTargetSize, visualDensity, focusNode, autofocus, shape, side, isError}? : {key?:Key, value?:bool, tristate?:bool, onChanged?:BoolValueChanged, mouseCursor?:MouseCursor, activeColor?:Color, fillColor?:unknown, checkColor?:Color, focusColor?:Color, hoverColor?:Color, overlayColor?:unknown, splashRadius?:double, materialTapTargetSize?:MaterialTapTargetSize, visualDensity?:VisualDensity, focusNode?:FocusNode, autofocus?:bool, shape?:OutlinedBorder, side?:BorderSide, isError?:bool}):Checkbox

interface CheckboxListTile {
}

declare function CheckboxListTile({key, value, onChanged, activeColor, checkColor, enabled, tileColor, title, subtitle, isThreeLine, dense, secondary, selected, controlAffinity, autofocus, contentPadding, tristate, shape, checkboxShape, selectedTileColor, side, visualDensity, focusNode, enableFeedback}? : {key?:Key, value?:bool, onChanged?:BoolValueChanged, activeColor?:Color, checkColor?:Color, enabled?:bool, tileColor?:Color, title?:Widget, subtitle?:Widget, isThreeLine?:bool, dense?:bool, secondary?:Widget, selected?:bool, controlAffinity?:ListTileControlAffinity, autofocus?:bool, contentPadding?:EdgeInsetsGeometry, tristate?:bool, shape?:ShapeBorder, checkboxShape?:OutlinedBorder, selectedTileColor?:Color, side?:BorderSide, visualDensity?:VisualDensity, focusNode?:FocusNode, enableFeedback?:bool}):CheckboxListTile

interface TextInputFormatter {
}

interface LTextInputFormatter extends TextInputFormatter {
}

declare function LTextInputFormatter(validateFunction:TextValidateFunction):LTextInputFormatter

interface ClipRect {
}

declare function ClipRect({key, clipper, clipBehavior, child}? : {key?:Key, clipper?:unknown, clipBehavior?:Clip, child?:Widget}):ClipRect

interface ClipRRect {
}

declare function ClipRRect({key, borderRadius, clipper, clipBehavior, child}? : {key?:Key, borderRadius?:BorderRadiusGeometry, clipper?:unknown, clipBehavior?:Clip, child?:Widget}):ClipRRect

interface Tooltip {
}

declare function Tooltip({key, message, richMessage, height, padding, margin, verticalOffset, preferBelow, excludeFromSemantics, decoration, textStyle, textAlign, waitDuration, showDuration, triggerMode, enableFeedback, onTriggered, child}? : {key?:Key, message?:string, richMessage?:InlineSpan, height?:double, padding?:EdgeInsetsGeometry, margin?:EdgeInsetsGeometry, verticalOffset?:double, preferBelow?:bool, excludeFromSemantics?:bool, decoration?:Decoration, textStyle?:TextStyle, textAlign?:TextAlign, waitDuration?:Duration, showDuration?:Duration, triggerMode?:TooltipTriggerMode, enableFeedback?:bool, onTriggered?:TooltipTriggeredCallback, child?:Widget}):Tooltip

interface Table {
}

declare function Table({key, children, columnWidths, defaultColumnWidth, textDirection, border, defaultVerticalAlignment, textBaseline}? : {key?:Key, children?:TableRow[], columnWidths?:{[id: int]: TableColumnWidth}, defaultColumnWidth?:TableColumnWidth, textDirection?:TextDirection, border?:TableBorder, defaultVerticalAlignment?:TableCellVerticalAlignment, textBaseline?:TextBaseline}):Table

interface TableRow {
}

declare function TableRow({key, decoration, children}? : {key?:LocalKey, decoration?:Decoration, children?:Widget[]}):TableRow

interface TableColumnWidth {
}

interface FlexColumnWidth extends TableColumnWidth {
}

declare function FlexColumnWidth(value?:double):FlexColumnWidth

interface MediaQueryData {

    readonly size: Size

    readonly devicePixelRatio: double
}

declare function MediaQueryData({size, devicePixelRatio, textScaleFactor, platformBrightness, padding, viewInsets, systemGestureInsets, viewPadding, alwaysUse24HourFormat, accessibleNavigation, invertColors, highContrast, disableAnimations, boldText, navigationMode, gestureSettings, displayFeatures}? : {size?:Size, devicePixelRatio?:double, textScaleFactor?:double, platformBrightness?:Brightness, padding?:EdgeInsets, viewInsets?:EdgeInsets, systemGestureInsets?:EdgeInsets, viewPadding?:EdgeInsets, alwaysUse24HourFormat?:bool, accessibleNavigation?:bool, invertColors?:bool, highContrast?:bool, disableAnimations?:bool, boldText?:bool, navigationMode?:NavigationMode, gestureSettings?:DeviceGestureSettings, displayFeatures?:DisplayFeature[]}):MediaQueryData

interface MediaQuery {
}

declare function MediaQuery({key, data, child} : {key?:Key, data:MediaQueryData, child:Widget}):MediaQuery

declare namespace MediaQuery {

    function removePadding({key, context, removeLeft, removeTop, removeRight, removeBottom, child} : {key?:Key, context:BuildContext, removeLeft?:bool, removeTop?:bool, removeRight?:bool, removeBottom?:bool, child:Widget}):MediaQuery

    function removeViewInsets({key, context, removeLeft, removeTop, removeRight, removeBottom, child} : {key?:Key, context:BuildContext, removeLeft?:bool, removeTop?:bool, removeRight?:bool, removeBottom?:bool, child:Widget}):MediaQuery

    function removeViewPadding({key, context, removeLeft, removeTop, removeRight, removeBottom, child} : {key?:Key, context:BuildContext, removeLeft?:bool, removeTop?:bool, removeRight?:bool, removeBottom?:bool, child:Widget}):MediaQuery

    function of(context:BuildContext):MediaQueryData
}

interface Offset {

    readonly dx: double

    readonly dy: double
}

declare function Offset(dx:double, dy:double):Offset

declare namespace Offset {

    const zero: Offset

    const infinite: Offset
}

interface AlignmentGeometry {
}

interface Alignment extends AlignmentGeometry {
}

declare function Alignment(x:double, y:double):Alignment

declare namespace Alignment {

    const topLeft: Alignment

    const topCenter: Alignment

    const topRight: Alignment

    const centerLeft: Alignment

    const center: Alignment

    const centerRight: Alignment

    const bottomLeft: Alignment

    const bottomCenter: Alignment

    const bottomRight: Alignment
}

interface FractionalOffset extends Alignment {

    readonly dx: double

    readonly dy: double
}

declare function FractionalOffset(dx:double, dy:double):FractionalOffset

declare namespace FractionalOffset {

    const topLeft: FractionalOffset

    const topCenter: FractionalOffset

    const topRight: FractionalOffset

    const centerLeft: FractionalOffset

    const center: FractionalOffset

    const centerRight: FractionalOffset

    const bottomLeft: FractionalOffset

    const bottomCenter: FractionalOffset

    const bottomRight: FractionalOffset
}

interface Align {
}

declare function Align({key, alignment, widthFactor, heightFactor, child}? : {key?:Key, alignment?:AlignmentGeometry, widthFactor?:double, heightFactor?:double, child?:Widget}):Align

interface DefaultTextStyle {
}

declare function DefaultTextStyle({key, style, textAlign, softWrap, overflow, maxLines, textWidthBasis, textHeightBehavior, child} : {key?:Key, style:TextStyle, textAlign?:TextAlign, softWrap?:bool, overflow?:TextOverflow, maxLines?:int, textWidthBasis?:TextWidthBasis, textHeightBehavior?:TextHeightBehavior, child:Widget}):DefaultTextStyle

interface SliderTheme {
}

declare function SliderTheme({key, data, child} : {key?:Key, data:SliderThemeData, child:Widget}):SliderTheme

interface SliderThemeData {
}

declare function SliderThemeData({trackHeight, activeTrackColor, inactiveTrackColor, secondaryActiveTrackColor, disabledActiveTrackColor, disabledInactiveTrackColor, disabledSecondaryActiveTrackColor, activeTickMarkColor, inactiveTickMarkColor, disabledActiveTickMarkColor, disabledInactiveTickMarkColor, thumbColor, overlappingShapeStrokeColor, disabledThumbColor, overlayColor, valueIndicatorColor, overlayShape, tickMarkShape, thumbShape, trackShape, valueIndicatorShape, rangeTickMarkShape, rangeThumbShape, rangeTrackShape, rangeValueIndicatorShape, showValueIndicator, valueIndicatorTextStyle, minThumbSeparation, thumbSelector, mouseCursor}? : {trackHeight?:double, activeTrackColor?:Color, inactiveTrackColor?:Color, secondaryActiveTrackColor?:Color, disabledActiveTrackColor?:Color, disabledInactiveTrackColor?:Color, disabledSecondaryActiveTrackColor?:Color, activeTickMarkColor?:Color, inactiveTickMarkColor?:Color, disabledActiveTickMarkColor?:Color, disabledInactiveTickMarkColor?:Color, thumbColor?:Color, overlappingShapeStrokeColor?:Color, disabledThumbColor?:Color, overlayColor?:Color, valueIndicatorColor?:Color, overlayShape?:SliderComponentShape, tickMarkShape?:SliderTickMarkShape, thumbShape?:SliderComponentShape, trackShape?:SliderTrackShape, valueIndicatorShape?:SliderComponentShape, rangeTickMarkShape?:RangeSliderTickMarkShape, rangeThumbShape?:RangeSliderThumbShape, rangeTrackShape?:RangeSliderTrackShape, rangeValueIndicatorShape?:RangeSliderValueIndicatorShape, showValueIndicator?:ShowValueIndicator, valueIndicatorTextStyle?:TextStyle, minThumbSeparation?:double, thumbSelector?:RangeThumbSelector, mouseCursor?:unknown}):SliderThemeData

interface SliderComponentShape {
}

declare namespace SliderComponentShape {

    const noThumb: SliderComponentShape

    const noOverlay: SliderComponentShape
}

interface Slider {
}

declare function Slider({key, value, secondaryTrackValue, onChanged, onChangeStart, onChangeEnd, min, max, divisions, label, activeColor, inactiveColor, secondaryActiveColor, thumbColor, overlayColor, mouseCursor, semanticFormatterCallback, focusNode, autofocus} : {key?:Key, value:double, secondaryTrackValue?:double, onChanged?:DoubleValueChanged, onChangeStart?:DoubleValueChanged, onChangeEnd?:DoubleValueChanged, min?:double, max?:double, divisions?:int, label?:string, activeColor?:Color, inactiveColor?:Color, secondaryActiveColor?:Color, thumbColor?:Color, overlayColor?:unknown, mouseCursor?:MouseCursor, semanticFormatterCallback?:SemanticFormatterCallback, focusNode?:FocusNode, autofocus?:bool}):Slider

interface Stack {
}

declare function Stack({key, alignment, textDirection, fit, clipBehavior, children}? : {key?:Key, alignment?:AlignmentGeometry, textDirection?:TextDirection, fit?:StackFit, clipBehavior?:Clip, children?:Widget[]}):Stack

interface Positioned {
}

declare function Positioned({key, left, top, right, bottom, width, height, child} : {key?:Key, left?:double, top?:double, right?:double, bottom?:double, width?:double, height?:double, child:Widget}):Positioned

declare namespace Positioned {

    function directional({key, textDirection, start, top, end, bottom, width, height, child} : {key?:Key, textDirection:TextDirection, start?:double, top?:double, end?:double, bottom?:double, width?:double, height?:double, child:Widget}):Positioned

    function fill({key, left, top, right, bottom, child} : {key?:Key, left?:double, top?:double, right?:double, bottom?:double, child:Widget}):Positioned

    function fromRect({key, rect, child} : {key?:Key, rect:Rect, child:Widget}):Positioned

    function fromRelativeRect({key, rect, child} : {key?:Key, rect:RelativeRect, child:Widget}):Positioned
}

interface LongPressDraggable {
}

declare function LongPressDraggable({key, child, feedback, data, axis, childWhenDragging, feedbackOffset, dragAnchorStrategy, maxSimultaneousDrags, onDragStarted, onDragUpdate, onDraggableCanceled, onDragEnd, onDragCompleted, hapticFeedbackOnStart, ignoringFeedbackSemantics, ignoringFeedbackPointer, delay} : {key?:Key, child:Widget, feedback:Widget, data?:Object, axis?:Axis, childWhenDragging?:Widget, feedbackOffset?:Offset, dragAnchorStrategy?:DragAnchorStrategy, maxSimultaneousDrags?:int, onDragStarted?:VoidCallback, onDragUpdate?:DragUpdateCallback, onDraggableCanceled?:DraggableCanceledCallback, onDragEnd?:DragEndCallback, onDragCompleted?:VoidCallback, hapticFeedbackOnStart?:bool, ignoringFeedbackSemantics?:bool, ignoringFeedbackPointer?:bool, delay?:Duration}):LongPressDraggable

interface Draggable {
}

declare function Draggable({key, child, feedback, data, axis, childWhenDragging, feedbackOffset, dragAnchorStrategy, affinity, maxSimultaneousDrags, onDragStarted, onDragUpdate, onDraggableCanceled, onDragEnd, onDragCompleted, ignoringFeedbackSemantics, ignoringFeedbackPointer, rootOverlay, hitTestBehavior} : {key?:Key, child:Widget, feedback:Widget, data?:Object, axis?:Axis, childWhenDragging?:Widget, feedbackOffset?:Offset, dragAnchorStrategy?:DragAnchorStrategy, affinity?:Axis, maxSimultaneousDrags?:int, onDragStarted?:VoidCallback, onDragUpdate?:DragUpdateCallback, onDraggableCanceled?:DraggableCanceledCallback, onDragEnd?:DragEndCallback, onDragCompleted?:VoidCallback, ignoringFeedbackSemantics?:bool, ignoringFeedbackPointer?:bool, rootOverlay?:bool, hitTestBehavior?:HitTestBehavior}):Draggable

interface DragTarget {
}

declare function DragTarget({key, builder, onWillAccept, onAccept, onAcceptWithDetails, onLeave, onMove, hitTestBehavior} : {key?:Key, builder:unknown, onWillAccept?:unknown, onAccept?:unknown, onAcceptWithDetails?:unknown, onLeave?:unknown, onMove?:unknown, hitTestBehavior?:HitTestBehavior}):DragTarget

interface DraggableDetails {

    readonly wasAccepted: bool

    readonly velocity: Velocity

    readonly offset: Offset
}

interface Opacity {
}

declare function Opacity({key, opacity, alwaysIncludeSemantics, child} : {key?:Key, opacity:double, alwaysIncludeSemantics?:bool, child?:Widget}):Opacity

interface ColoredBox {
}

declare function ColoredBox({key, color, child} : {key?:Key, color:Color, child?:Widget}):ColoredBox

interface Velocity {

    readonly pixelsPerSecond: Offset
}

declare namespace Velocity {

    const zero: Velocity
}

interface Divider {
}

declare function Divider({key, height, thickness, indent, endIndent, color}? : {key?:Key, height?:double, thickness?:double, indent?:double, endIndent?:double, color?:Color}):Divider

interface VerticalDivider {
}

declare function VerticalDivider({key, width, thickness, indent, endIndent, color}? : {key?:Key, width?:double, thickness?:double, indent?:double, endIndent?:double, color?:Color}):VerticalDivider

interface Wrap {
}

declare function Wrap({key, direction, alignment, spacing, runAlignment, runSpacing, crossAxisAlignment, textDirection, verticalDirection, clipBehavior, children}? : {key?:Key, direction?:Axis, alignment?:WrapAlignment, spacing?:double, runAlignment?:WrapAlignment, runSpacing?:double, crossAxisAlignment?:WrapCrossAlignment, textDirection?:TextDirection, verticalDirection?:VerticalDirection, clipBehavior?:Clip, children?:Widget[]}):Wrap

interface GestureDetector {
}

declare function GestureDetector({key, child, onTapDown, onTapUp, onTap, onTapCancel, onSecondaryTap, onSecondaryTapDown, onSecondaryTapUp, onSecondaryTapCancel, onTertiaryTapDown, onTertiaryTapUp, onTertiaryTapCancel, onDoubleTapDown, onDoubleTap, onDoubleTapCancel, onLongPressDown, onLongPressCancel, onLongPress, onLongPressStart, onLongPressMoveUpdate, onLongPressUp, onLongPressEnd, onSecondaryLongPressDown, onSecondaryLongPressCancel, onSecondaryLongPress, onSecondaryLongPressStart, onSecondaryLongPressMoveUpdate, onSecondaryLongPressUp, onSecondaryLongPressEnd, onTertiaryLongPressDown, onTertiaryLongPressCancel, onTertiaryLongPress, onTertiaryLongPressStart, onTertiaryLongPressMoveUpdate, onTertiaryLongPressUp, onTertiaryLongPressEnd, onVerticalDragDown, onVerticalDragStart, onVerticalDragUpdate, onVerticalDragEnd, onVerticalDragCancel, onHorizontalDragDown, onHorizontalDragStart, onHorizontalDragUpdate, onHorizontalDragEnd, onHorizontalDragCancel, onForcePressStart, onForcePressPeak, onForcePressUpdate, onForcePressEnd, onPanDown, onPanStart, onPanUpdate, onPanEnd, onPanCancel, onScaleStart, onScaleUpdate, onScaleEnd, behavior, excludeFromSemantics, dragStartBehavior, supportedDevices}? : {key?:Key, child?:Widget, onTapDown?:GestureTapDownCallback, onTapUp?:GestureTapUpCallback, onTap?:GestureTapCallback, onTapCancel?:GestureTapCancelCallback, onSecondaryTap?:GestureTapCallback, onSecondaryTapDown?:GestureTapDownCallback, onSecondaryTapUp?:GestureTapUpCallback, onSecondaryTapCancel?:GestureTapCancelCallback, onTertiaryTapDown?:GestureTapDownCallback, onTertiaryTapUp?:GestureTapUpCallback, onTertiaryTapCancel?:GestureTapCancelCallback, onDoubleTapDown?:GestureTapDownCallback, onDoubleTap?:GestureTapCallback, onDoubleTapCancel?:GestureTapCancelCallback, onLongPressDown?:GestureLongPressDownCallback, onLongPressCancel?:GestureLongPressCancelCallback, onLongPress?:GestureLongPressCallback, onLongPressStart?:GestureLongPressStartCallback, onLongPressMoveUpdate?:GestureLongPressMoveUpdateCallback, onLongPressUp?:GestureLongPressUpCallback, onLongPressEnd?:GestureLongPressEndCallback, onSecondaryLongPressDown?:GestureLongPressDownCallback, onSecondaryLongPressCancel?:GestureLongPressCancelCallback, onSecondaryLongPress?:GestureLongPressCallback, onSecondaryLongPressStart?:GestureLongPressStartCallback, onSecondaryLongPressMoveUpdate?:GestureLongPressMoveUpdateCallback, onSecondaryLongPressUp?:GestureLongPressUpCallback, onSecondaryLongPressEnd?:GestureLongPressEndCallback, onTertiaryLongPressDown?:GestureLongPressDownCallback, onTertiaryLongPressCancel?:GestureLongPressCancelCallback, onTertiaryLongPress?:GestureLongPressCallback, onTertiaryLongPressStart?:GestureLongPressStartCallback, onTertiaryLongPressMoveUpdate?:GestureLongPressMoveUpdateCallback, onTertiaryLongPressUp?:GestureLongPressUpCallback, onTertiaryLongPressEnd?:GestureLongPressEndCallback, onVerticalDragDown?:GestureDragDownCallback, onVerticalDragStart?:GestureDragStartCallback, onVerticalDragUpdate?:GestureDragUpdateCallback, onVerticalDragEnd?:GestureDragEndCallback, onVerticalDragCancel?:GestureDragCancelCallback, onHorizontalDragDown?:GestureDragDownCallback, onHorizontalDragStart?:GestureDragStartCallback, onHorizontalDragUpdate?:GestureDragUpdateCallback, onHorizontalDragEnd?:GestureDragEndCallback, onHorizontalDragCancel?:GestureDragCancelCallback, onForcePressStart?:GestureForcePressStartCallback, onForcePressPeak?:GestureForcePressPeakCallback, onForcePressUpdate?:GestureForcePressUpdateCallback, onForcePressEnd?:GestureForcePressEndCallback, onPanDown?:GestureDragDownCallback, onPanStart?:GestureDragStartCallback, onPanUpdate?:GestureDragUpdateCallback, onPanEnd?:GestureDragEndCallback, onPanCancel?:GestureDragCancelCallback, onScaleStart?:GestureScaleStartCallback, onScaleUpdate?:GestureScaleUpdateCallback, onScaleEnd?:GestureScaleEndCallback, behavior?:HitTestBehavior, excludeFromSemantics?:bool, dragStartBehavior?:DragStartBehavior, supportedDevices?:PointerDeviceKind[]}):GestureDetector

interface DragDownDetails {
}

interface DragEndDetails {
}

interface DragStartDetails {

    readonly globalPosition: Offset

    readonly localPosition: Offset
}

interface DragUpdateDetails {

    readonly delta: Offset

    readonly globalPosition: Offset

    readonly localPosition: Offset
}

interface LongPressDownDetails {
}

interface LongPressEndDetails {
}

interface LongPressMoveUpdateDetails {
}

interface LongPressStartDetails {
}

interface TapDownDetails {
}

interface TapUpDetails {
}

interface Key {
}

interface UniqueKey extends Key {
}

declare function UniqueKey():UniqueKey

interface Duration {

    compareTo(other:Duration ):int

    readonly inDays: int

    readonly inHours: int

    readonly inMicroseconds: int

    readonly inMilliseconds: int

    readonly inMinutes: int

    readonly inSeconds: int
}

declare function Duration({days, hours, minutes, seconds, milliseconds, microseconds}? : {days?:int, hours?:int, minutes?:int, seconds?:int, milliseconds?:int, microseconds?:int}):Duration

declare namespace Duration {

    const zero: Duration
}

interface Dialog {
}

declare function Dialog({key, backgroundColor, elevation, shadowColor, surfaceTintColor, insetAnimationDuration, insetAnimationCurve, insetPadding, clipBehavior, shape, alignment, child}? : {key?:Key, backgroundColor?:Color, elevation?:double, shadowColor?:Color, surfaceTintColor?:Color, insetAnimationDuration?:Duration, insetAnimationCurve?:Curve, insetPadding?:EdgeInsets, clipBehavior?:Clip, shape?:ShapeBorder, alignment?:AlignmentGeometry, child?:Widget}):Dialog

interface AlertDialog {
}

declare function AlertDialog({key, icon, iconPadding, iconColor, title, titlePadding, titleTextStyle, content, contentPadding, contentTextStyle, actions, actionsPadding, actionsAlignment, actionsOverflowAlignment, actionsOverflowDirection, actionsOverflowButtonSpacing, buttonPadding, backgroundColor, elevation, shadowColor, surfaceTintColor, semanticLabel, insetPadding, clipBehavior, shape, alignment, scrollable}? : {key?:Key, icon?:Widget, iconPadding?:EdgeInsetsGeometry, iconColor?:Color, title?:Widget, titlePadding?:EdgeInsetsGeometry, titleTextStyle?:TextStyle, content?:Widget, contentPadding?:EdgeInsetsGeometry, contentTextStyle?:TextStyle, actions?:Widget[], actionsPadding?:EdgeInsetsGeometry, actionsAlignment?:MainAxisAlignment, actionsOverflowAlignment?:OverflowBarAlignment, actionsOverflowDirection?:VerticalDirection, actionsOverflowButtonSpacing?:double, buttonPadding?:EdgeInsetsGeometry, backgroundColor?:Color, elevation?:double, shadowColor?:Color, surfaceTintColor?:Color, semanticLabel?:string, insetPadding?:EdgeInsets, clipBehavior?:Clip, shape?:ShapeBorder, alignment?:AlignmentGeometry, scrollable?:bool}):AlertDialog

interface SimpleDialog {
}

declare function SimpleDialog({key, title, titlePadding, titleTextStyle, children, contentPadding, backgroundColor, elevation, shadowColor, surfaceTintColor, semanticLabel, insetPadding, clipBehavior, shape, alignment}? : {key?:Key, title?:Widget, titlePadding?:EdgeInsetsGeometry, titleTextStyle?:TextStyle, children?:Widget[], contentPadding?:EdgeInsetsGeometry, backgroundColor?:Color, elevation?:double, shadowColor?:Color, surfaceTintColor?:Color, semanticLabel?:string, insetPadding?:EdgeInsets, clipBehavior?:Clip, shape?:ShapeBorder, alignment?:AlignmentGeometry}):SimpleDialog

interface CupertinoAlertDialog {
}

declare function CupertinoAlertDialog({key, title, content, actions, scrollController, actionScrollController, insetAnimationDuration, insetAnimationCurve}? : {key?:Key, title?:Widget, content?:Widget, actions?:Widget[], scrollController?:ScrollController, actionScrollController?:ScrollController, insetAnimationDuration?:Duration, insetAnimationCurve?:Curve}):CupertinoAlertDialog

interface Future {

    then(onValue:DynamicCallback, {onError}? : {onError?:DynamicCallback} ):Future

    catchError(onError:DynamicCallback ):Future

    whenComplete(action:VoidCallback ):Future

    timeout(timeLimit:Duration, {onTimeout}? : {onTimeout?:VoidCallback} ):Future
}

declare function Future(computation:VoidCallback):Future

declare namespace Future {

    function delayed(duration:Duration, computation?:VoidCallback):Future

    function microtask(computation:VoidCallback):Future

    function sync(computation:VoidCallback):Future
}

interface FloatingActionButton {
}

declare function FloatingActionButton({key, child, tooltip, foregroundColor, backgroundColor, focusColor, hoverColor, splashColor, elevation, focusElevation, hoverElevation, highlightElevation, disabledElevation, onPressed, mouseCursor, mini, shape, clipBehavior, focusNode, autofocus, materialTapTargetSize, isExtended, enableFeedback}? : {key?:Key, child?:Widget, tooltip?:string, foregroundColor?:Color, backgroundColor?:Color, focusColor?:Color, hoverColor?:Color, splashColor?:Color, elevation?:double, focusElevation?:double, hoverElevation?:double, highlightElevation?:double, disabledElevation?:double, onPressed?:VoidCallback, mouseCursor?:MouseCursor, mini?:bool, shape?:ShapeBorder, clipBehavior?:Clip, focusNode?:FocusNode, autofocus?:bool, materialTapTargetSize?:MaterialTapTargetSize, isExtended?:bool, enableFeedback?:bool}):FloatingActionButton

declare namespace FloatingActionButton {

    function extended({key, tooltip, foregroundColor, backgroundColor, focusColor, hoverColor, elevation, focusElevation, hoverElevation, splashColor, highlightElevation, disabledElevation, onPressed, mouseCursor, shape, isExtended, materialTapTargetSize, clipBehavior, focusNode, autofocus, extendedIconLabelSpacing, extendedPadding, extendedTextStyle, icon, label, enableFeedback} : {key?:Key, tooltip?:string, foregroundColor?:Color, backgroundColor?:Color, focusColor?:Color, hoverColor?:Color, elevation?:double, focusElevation?:double, hoverElevation?:double, splashColor?:Color, highlightElevation?:double, disabledElevation?:double, onPressed?:VoidCallback, mouseCursor?:MouseCursor, shape?:ShapeBorder, isExtended?:bool, materialTapTargetSize?:MaterialTapTargetSize, clipBehavior?:Clip, focusNode?:FocusNode, autofocus?:bool, extendedIconLabelSpacing?:double, extendedPadding?:EdgeInsetsGeometry, extendedTextStyle?:TextStyle, icon?:Widget, label:Widget, enableFeedback?:bool}):FloatingActionButton

    function large({key, child, tooltip, foregroundColor, backgroundColor, focusColor, hoverColor, splashColor, elevation, focusElevation, hoverElevation, highlightElevation, disabledElevation, onPressed, mouseCursor, shape, clipBehavior, focusNode, autofocus, materialTapTargetSize, enableFeedback}? : {key?:Key, child?:Widget, tooltip?:string, foregroundColor?:Color, backgroundColor?:Color, focusColor?:Color, hoverColor?:Color, splashColor?:Color, elevation?:double, focusElevation?:double, hoverElevation?:double, highlightElevation?:double, disabledElevation?:double, onPressed?:VoidCallback, mouseCursor?:MouseCursor, shape?:ShapeBorder, clipBehavior?:Clip, focusNode?:FocusNode, autofocus?:bool, materialTapTargetSize?:MaterialTapTargetSize, enableFeedback?:bool}):FloatingActionButton

    function small({key, child, tooltip, foregroundColor, backgroundColor, focusColor, hoverColor, splashColor, elevation, focusElevation, hoverElevation, highlightElevation, disabledElevation, onPressed, mouseCursor, shape, clipBehavior, focusNode, autofocus, materialTapTargetSize, enableFeedback}? : {key?:Key, child?:Widget, tooltip?:string, foregroundColor?:Color, backgroundColor?:Color, focusColor?:Color, hoverColor?:Color, splashColor?:Color, elevation?:double, focusElevation?:double, hoverElevation?:double, highlightElevation?:double, disabledElevation?:double, onPressed?:VoidCallback, mouseCursor?:MouseCursor, shape?:ShapeBorder, clipBehavior?:Clip, focusNode?:FocusNode, autofocus?:bool, materialTapTargetSize?:MaterialTapTargetSize, enableFeedback?:bool}):FloatingActionButton
}

interface Scaffold {
}

declare function Scaffold({key, appBar, body, floatingActionButton, floatingActionButtonLocation, floatingActionButtonAnimator, persistentFooterButtons, persistentFooterAlignment, drawer, onDrawerChanged, endDrawer, onEndDrawerChanged, bottomNavigationBar, bottomSheet, backgroundColor, resizeToAvoidBottomInset, primary, drawerDragStartBehavior, extendBody, extendBodyBehindAppBar, drawerScrimColor, drawerEdgeDragWidth, drawerEnableOpenDragGesture, endDrawerEnableOpenDragGesture, restorationId}? : {key?:Key, appBar?:AppBar, body?:Widget, floatingActionButton?:Widget, floatingActionButtonLocation?:FloatingActionButtonLocation, floatingActionButtonAnimator?:FloatingActionButtonAnimator, persistentFooterButtons?:Widget[], persistentFooterAlignment?:AlignmentDirectional, drawer?:Widget, onDrawerChanged?:DrawerCallback, endDrawer?:Widget, onEndDrawerChanged?:DrawerCallback, bottomNavigationBar?:Widget, bottomSheet?:Widget, backgroundColor?:Color, resizeToAvoidBottomInset?:bool, primary?:bool, drawerDragStartBehavior?:DragStartBehavior, extendBody?:bool, extendBodyBehindAppBar?:bool, drawerScrimColor?:Color, drawerEdgeDragWidth?:double, drawerEnableOpenDragGesture?:bool, endDrawerEnableOpenDragGesture?:bool, restorationId?:string}):Scaffold

interface AppBar {
}

declare function AppBar({key, leading, automaticallyImplyLeading, title, actions, flexibleSpace, bottom, elevation, scrolledUnderElevation, notificationPredicate, shadowColor, surfaceTintColor, shape, backgroundColor, foregroundColor, iconTheme, actionsIconTheme, primary, centerTitle, excludeHeaderSemantics, titleSpacing, toolbarOpacity, bottomOpacity, toolbarHeight, leadingWidth, toolbarTextStyle, titleTextStyle, systemOverlayStyle}? : {key?:Key, leading?:Widget, automaticallyImplyLeading?:bool, title?:Widget, actions?:Widget[], flexibleSpace?:Widget, bottom?:PreferredSizeWidget, elevation?:double, scrolledUnderElevation?:double, notificationPredicate?:ScrollNotificationPredicate, shadowColor?:Color, surfaceTintColor?:Color, shape?:ShapeBorder, backgroundColor?:Color, foregroundColor?:Color, iconTheme?:IconThemeData, actionsIconTheme?:IconThemeData, primary?:bool, centerTitle?:bool, excludeHeaderSemantics?:bool, titleSpacing?:double, toolbarOpacity?:double, bottomOpacity?:double, toolbarHeight?:double, leadingWidth?:double, toolbarTextStyle?:TextStyle, titleTextStyle?:TextStyle, systemOverlayStyle?:SystemUiOverlayStyle}):AppBar

interface BottomNavigationBar {
}

declare function BottomNavigationBar({key, items, onTap, currentIndex, elevation, type, fixedColor, backgroundColor, iconSize, selectedItemColor, unselectedItemColor, selectedIconTheme, unselectedIconTheme, selectedFontSize, unselectedFontSize, selectedLabelStyle, unselectedLabelStyle, showSelectedLabels, showUnselectedLabels, mouseCursor, enableFeedback, landscapeLayout, useLegacyColorScheme} : {key?:Key, items:BottomNavigationBarItem[], onTap?:ValueChanged_int_, currentIndex?:int, elevation?:double, type?:BottomNavigationBarType, fixedColor?:Color, backgroundColor?:Color, iconSize?:double, selectedItemColor?:Color, unselectedItemColor?:Color, selectedIconTheme?:IconThemeData, unselectedIconTheme?:IconThemeData, selectedFontSize?:double, unselectedFontSize?:double, selectedLabelStyle?:TextStyle, unselectedLabelStyle?:TextStyle, showSelectedLabels?:bool, showUnselectedLabels?:bool, mouseCursor?:MouseCursor, enableFeedback?:bool, landscapeLayout?:BottomNavigationBarLandscapeLayout, useLegacyColorScheme?:bool}):BottomNavigationBar

interface BottomNavigationBarItem {
}

declare function BottomNavigationBarItem({icon, label, activeIcon, backgroundColor, tooltip} : {icon:Widget, label?:string, activeIcon?:Widget, backgroundColor?:Color, tooltip?:string}):BottomNavigationBarItem

interface ScaffoldMessenger {
}

declare namespace ScaffoldMessenger {

    function of(context:BuildContext):ScaffoldMessengerState
}

interface ScaffoldMessengerState {

    showSnackBar(snackBar:SnackBar ):void

    showMaterialBanner(materialBanner:MaterialBanner ):void
}

interface SnackBar {
}

declare function SnackBar({key, content, backgroundColor, elevation, margin, padding, width, shape, behavior, action, duration, animation, onVisible, dismissDirection, clipBehavior} : {key?:Key, content:Widget, backgroundColor?:Color, elevation?:double, margin?:EdgeInsetsGeometry, padding?:EdgeInsetsGeometry, width?:double, shape?:ShapeBorder, behavior?:SnackBarBehavior, action?:SnackBarAction, duration?:Duration, animation?:unknown, onVisible?:VoidCallback, dismissDirection?:DismissDirection, clipBehavior?:Clip}):SnackBar

interface MaterialBanner {
}

declare function MaterialBanner({key, content, contentTextStyle, actions, elevation, leading, backgroundColor, surfaceTintColor, shadowColor, dividerColor, padding, leadingPadding, forceActionsBelow, overflowAlignment, animation, onVisible} : {key?:Key, content:Widget, contentTextStyle?:TextStyle, actions:Widget[], elevation?:double, leading?:Widget, backgroundColor?:Color, surfaceTintColor?:Color, shadowColor?:Color, dividerColor?:Color, padding?:EdgeInsetsGeometry, leadingPadding?:EdgeInsetsGeometry, forceActionsBelow?:bool, overflowAlignment?:OverflowBarAlignment, animation?:unknown, onVisible?:VoidCallback}):MaterialBanner

interface PopupMenuButton {
}

declare function PopupMenuButton({key, itemBuilder, initialValue, onOpened, onSelected, onCanceled, tooltip, elevation, shadowColor, surfaceTintColor, padding, child, splashRadius, icon, iconSize, offset, enabled, shape, color, enableFeedback, constraints, position, clipBehavior} : {key?:Key, itemBuilder:PopupMenuItemBuilder_int_, initialValue?:int, onOpened?:VoidCallback, onSelected?:PopupMenuItemSelected_int_, onCanceled?:PopupMenuCanceled, tooltip?:string, elevation?:double, shadowColor?:Color, surfaceTintColor?:Color, padding?:EdgeInsetsGeometry, child?:Widget, splashRadius?:double, icon?:Widget, iconSize?:double, offset?:Offset, enabled?:bool, shape?:ShapeBorder, color?:Color, enableFeedback?:bool, constraints?:BoxConstraints, position?:PopupMenuPosition, clipBehavior?:Clip}):PopupMenuButton

interface PopupMenuEntry {
}

interface PopupMenuDivider extends PopupMenuEntry {
}

declare function PopupMenuDivider({key, height}? : {key?:Key, height?:double}):PopupMenuDivider

interface PopupMenuItem extends PopupMenuEntry {
}

declare function PopupMenuItem({key, value, onTap, enabled, height, padding, textStyle, labelTextStyle, mouseCursor, child}? : {key?:Key, value?:int, onTap?:VoidCallback, enabled?:bool, height?:double, padding?:EdgeInsets, textStyle?:TextStyle, labelTextStyle?:unknown, mouseCursor?:MouseCursor, child?:Widget}):PopupMenuItem

interface CheckedPopupMenuItem extends PopupMenuItem {
}

declare function CheckedPopupMenuItem({key, value, checked, enabled, padding, height, mouseCursor, child}? : {key?:Key, value?:int, checked?:bool, enabled?:bool, padding?:EdgeInsets, height?:double, mouseCursor?:MouseCursor, child?:Widget}):CheckedPopupMenuItem

interface SafeArea {
}

declare function SafeArea({key, left, top, right, bottom, minimum, maintainBottomViewPadding, child} : {key?:Key, left?:bool, top?:bool, right?:bool, bottom?:bool, minimum?:EdgeInsets, maintainBottomViewPadding?:bool, child:Widget}):SafeArea

interface RoundedRectangleBorder {
}

declare function RoundedRectangleBorder({side, borderRadius}? : {side?:BorderSide, borderRadius?:BorderRadiusGeometry}):RoundedRectangleBorder

interface DropdownMenuItem {
}

declare function DropdownMenuItem({key, onTap, value, enabled, alignment, child} : {key?:Key, onTap?:VoidCallback, value?:int, enabled?:bool, alignment?:AlignmentGeometry, child:Widget}):DropdownMenuItem

interface DropdownButton {
}

declare function DropdownButton({key, items, selectedItemBuilder, value, hint, disabledHint, onChanged, onTap, elevation, style, underline, icon, iconDisabledColor, iconEnabledColor, iconSize, isDense, isExpanded, itemHeight, focusColor, focusNode, autofocus, dropdownColor, menuMaxHeight, enableFeedback, alignment, borderRadius}? : {key?:Key, items?:unknown[], selectedItemBuilder?:DropdownButtonBuilder, value?:int, hint?:Widget, disabledHint?:Widget, onChanged?:ValueChanged_int__, onTap?:VoidCallback, elevation?:int, style?:TextStyle, underline?:Widget, icon?:Widget, iconDisabledColor?:Color, iconEnabledColor?:Color, iconSize?:double, isDense?:bool, isExpanded?:bool, itemHeight?:double, focusColor?:Color, focusNode?:FocusNode, autofocus?:bool, dropdownColor?:Color, menuMaxHeight?:double, enableFeedback?:bool, alignment?:AlignmentGeometry, borderRadius?:BorderRadius}):DropdownButton

interface ButtonSegment {
}

declare function ButtonSegment({value, icon, label, enabled} : {value:int, icon?:Widget, label?:Widget, enabled?:bool}):ButtonSegment

interface SegmentedButton {
}

declare function SegmentedButton({key, segments, selected, onSelectionChanged, multiSelectionEnabled, emptySelectionAllowed, style, showSelectedIcon, selectedIcon} : {key?:Key, segments:unknown[], selected:int[], onSelectionChanged?:ValueChanged_Set_int__, multiSelectionEnabled?:bool, emptySelectionAllowed?:bool, style?:ButtonStyle, showSelectedIcon?:bool, selectedIcon?:Widget}):SegmentedButton

interface Overlay {
}

declare namespace Overlay {

    function of(context:BuildContext, {rootOverlay, debugRequiredFor}? : {rootOverlay?:bool, debugRequiredFor?:Widget}):OverlayState
}

interface OverlayState {

    insert(entry:OverlayEntry, {below, above}? : {below?:OverlayEntry, above?:OverlayEntry} ):void
}

interface OverlayEntry {

    markNeedsBuild( ):void

    remove( ):void
}

declare function OverlayEntry({builder, opaque, maintainState} : {builder:WidgetBuilder, opaque?:bool, maintainState?:bool}):OverlayEntry

interface RotatedBox {
}

declare function RotatedBox({key, quarterTurns, child} : {key?:Key, quarterTurns:int, child?:Widget}):RotatedBox

interface Transform {
}

declare function Transform({key, transform, origin, alignment, transformHitTests, filterQuality, child} : {key?:Key, transform:Matrix4, origin?:Offset, alignment?:AlignmentGeometry, transformHitTests?:bool, filterQuality?:FilterQuality, child?:Widget}):Transform

declare namespace Transform {

    function rotate({key, angle, origin, alignment, transformHitTests, filterQuality, child} : {key?:Key, angle:double, origin?:Offset, alignment?:AlignmentGeometry, transformHitTests?:bool, filterQuality?:FilterQuality, child?:Widget}):Transform

    function scale({key, scale, scaleX, scaleY, origin, alignment, transformHitTests, filterQuality, child}? : {key?:Key, scale?:double, scaleX?:double, scaleY?:double, origin?:Offset, alignment?:AlignmentGeometry, transformHitTests?:bool, filterQuality?:FilterQuality, child?:Widget}):Transform

    function translate({key, offset, transformHitTests, filterQuality, child} : {key?:Key, offset:Offset, transformHitTests?:bool, filterQuality?:FilterQuality, child?:Widget}):Transform
}

interface CircularProgressIndicator {
}

declare function CircularProgressIndicator({key, value, backgroundColor, color, valueColor, strokeWidth, semanticsLabel, semanticsValue}? : {key?:Key, value?:double, backgroundColor?:Color, color?:Color, valueColor?:unknown, strokeWidth?:double, semanticsLabel?:string, semanticsValue?:string}):CircularProgressIndicator

declare namespace CircularProgressIndicator {

    function adaptive({key, value, backgroundColor, valueColor, strokeWidth, semanticsLabel, semanticsValue}? : {key?:Key, value?:double, backgroundColor?:Color, valueColor?:unknown, strokeWidth?:double, semanticsLabel?:string, semanticsValue?:string}):CircularProgressIndicator
}

interface LinearProgressIndicator {
}

declare function LinearProgressIndicator({key, value, backgroundColor, color, valueColor, minHeight, semanticsLabel, semanticsValue}? : {key?:Key, value?:double, backgroundColor?:Color, color?:Color, valueColor?:unknown, minHeight?:double, semanticsLabel?:string, semanticsValue?:string}):LinearProgressIndicator

interface FittedBox {
}

declare function FittedBox({key, fit, alignment, clipBehavior, child}? : {key?:Key, fit?:BoxFit, alignment?:AlignmentGeometry, clipBehavior?:Clip, child?:Widget}):FittedBox

interface SchedulerBinding {

    scheduleFrame( ):void

    scheduleForcedFrame( ):void

    scheduleFrameCallback(callback:FrameCallback, {rescheduling}? : {rescheduling?:bool} ):int

    addPostFrameCallback(callback:FrameCallback ):void
}

declare namespace SchedulerBinding {

    const instance: SchedulerBinding
}

interface Card {
}

declare function Card({key, color, shadowColor, surfaceTintColor, elevation, shape, borderOnForeground, margin, clipBehavior, child, semanticContainer}? : {key?:Key, color?:Color, shadowColor?:Color, surfaceTintColor?:Color, elevation?:double, shape?:ShapeBorder, borderOnForeground?:bool, margin?:EdgeInsetsGeometry, clipBehavior?:Clip, child?:Widget, semanticContainer?:bool}):Card

interface MaterialStatePropertyT {
}

declare namespace MaterialStatePropertyT {

    function resolveColor(callback:MaterialPropertyResolver_Color_):unknown

    function resolveBorderSide(callback:MaterialPropertyResolver_BorderSide_):unknown
}

interface MaterialStateColor extends Color {
}

declare namespace MaterialStateColor {

    function resolveWith(callback:MaterialPropertyResolver_Color_):MaterialStateColor
}

interface ButtonStyle {
}

declare function ButtonStyle({textStyle, backgroundColor, foregroundColor, overlayColor, shadowColor, surfaceTintColor, elevation, padding, minimumSize, fixedSize, maximumSize, iconColor, iconSize, side, shape, mouseCursor, visualDensity, tapTargetSize, animationDuration, enableFeedback, alignment, splashFactory}? : {textStyle?:unknown, backgroundColor?:unknown, foregroundColor?:unknown, overlayColor?:unknown, shadowColor?:unknown, surfaceTintColor?:unknown, elevation?:unknown, padding?:unknown, minimumSize?:unknown, fixedSize?:unknown, maximumSize?:unknown, iconColor?:unknown, iconSize?:unknown, side?:unknown, shape?:unknown, mouseCursor?:unknown, visualDensity?:VisualDensity, tapTargetSize?:MaterialTapTargetSize, animationDuration?:Duration, enableFeedback?:bool, alignment?:AlignmentGeometry, splashFactory?:InteractiveInkFeatureFactory}):ButtonStyle

interface ToggleButtons {
}

declare function ToggleButtons({key, children, isSelected, onPressed, mouseCursor, tapTargetSize, textStyle, constraints, color, selectedColor, disabledColor, fillColor, focusColor, highlightColor, hoverColor, splashColor, focusNodes, renderBorder, borderColor, selectedBorderColor, disabledBorderColor, borderRadius, borderWidth, direction, verticalDirection} : {key?:Key, children:Widget[], isSelected:bool[], onPressed?:IntValueChanged, mouseCursor?:MouseCursor, tapTargetSize?:MaterialTapTargetSize, textStyle?:TextStyle, constraints?:BoxConstraints, color?:Color, selectedColor?:Color, disabledColor?:Color, fillColor?:Color, focusColor?:Color, highlightColor?:Color, hoverColor?:Color, splashColor?:Color, focusNodes?:FocusNode[], renderBorder?:bool, borderColor?:Color, selectedBorderColor?:Color, disabledBorderColor?:Color, borderRadius?:BorderRadius, borderWidth?:double, direction?:Axis, verticalDirection?:VerticalDirection}):ToggleButtons

interface Directionality {
}

declare function Directionality({key, textDirection, child} : {key?:Key, textDirection:TextDirection, child:Widget}):Directionality

interface IntrinsicHeight {
}

declare function IntrinsicHeight({key, child}? : {key?:Key, child?:Widget}):IntrinsicHeight

interface IntrinsicWidth {
}

declare function IntrinsicWidth({key, stepWidth, stepHeight, child}? : {key?:Key, stepWidth?:double, stepHeight?:double, child?:Widget}):IntrinsicWidth

interface Switch {
}

declare function Switch({key, value, onChanged, activeColor, activeTrackColor, inactiveThumbColor, inactiveTrackColor, activeThumbImage, onActiveThumbImageError, inactiveThumbImage, onInactiveThumbImageError, thumbColor, trackColor, thumbIcon, materialTapTargetSize, dragStartBehavior, mouseCursor, focusColor, hoverColor, overlayColor, splashRadius, focusNode, autofocus} : {key?:Key, value:bool, onChanged?:ValueChanged_bool_, activeColor?:Color, activeTrackColor?:Color, inactiveThumbColor?:Color, inactiveTrackColor?:Color, activeThumbImage?:unknown, onActiveThumbImageError?:ImageErrorListener, inactiveThumbImage?:unknown, onInactiveThumbImageError?:ImageErrorListener, thumbColor?:unknown, trackColor?:unknown, thumbIcon?:unknown, materialTapTargetSize?:MaterialTapTargetSize, dragStartBehavior?:DragStartBehavior, mouseCursor?:MouseCursor, focusColor?:Color, hoverColor?:Color, overlayColor?:unknown, splashRadius?:double, focusNode?:FocusNode, autofocus?:bool}):Switch

declare namespace Switch {

    function adaptive({key, value, onChanged, activeColor, activeTrackColor, inactiveThumbColor, inactiveTrackColor, activeThumbImage, onActiveThumbImageError, inactiveThumbImage, onInactiveThumbImageError, materialTapTargetSize, thumbColor, trackColor, thumbIcon, dragStartBehavior, mouseCursor, focusColor, hoverColor, overlayColor, splashRadius, focusNode, autofocus} : {key?:Key, value:bool, onChanged?:ValueChanged_bool_, activeColor?:Color, activeTrackColor?:Color, inactiveThumbColor?:Color, inactiveTrackColor?:Color, activeThumbImage?:unknown, onActiveThumbImageError?:ImageErrorListener, inactiveThumbImage?:unknown, onInactiveThumbImageError?:ImageErrorListener, materialTapTargetSize?:MaterialTapTargetSize, thumbColor?:unknown, trackColor?:unknown, thumbIcon?:unknown, dragStartBehavior?:DragStartBehavior, mouseCursor?:MouseCursor, focusColor?:Color, hoverColor?:Color, overlayColor?:unknown, splashRadius?:double, focusNode?:FocusNode, autofocus?:bool}):Switch
}

interface SwitchListTile {
}

declare function SwitchListTile({key, value, onChanged, activeColor, activeTrackColor, inactiveThumbColor, inactiveTrackColor, activeThumbImage, inactiveThumbImage, focusNode, autofocus, tileColor, title, subtitle, isThreeLine, dense, contentPadding, secondary, selected, controlAffinity, shape, selectedTileColor, visualDensity, enableFeedback, hoverColor} : {key?:Key, value:bool, onChanged?:ValueChanged_bool_, activeColor?:Color, activeTrackColor?:Color, inactiveThumbColor?:Color, inactiveTrackColor?:Color, activeThumbImage?:unknown, inactiveThumbImage?:unknown, focusNode?:FocusNode, autofocus?:bool, tileColor?:Color, title?:Widget, subtitle?:Widget, isThreeLine?:bool, dense?:bool, contentPadding?:EdgeInsetsGeometry, secondary?:Widget, selected?:bool, controlAffinity?:ListTileControlAffinity, shape?:ShapeBorder, selectedTileColor?:Color, visualDensity?:VisualDensity, enableFeedback?:bool, hoverColor?:Color}):SwitchListTile

declare namespace SwitchListTile {

    function adaptive({key, value, onChanged, activeColor, activeTrackColor, inactiveThumbColor, inactiveTrackColor, activeThumbImage, inactiveThumbImage, focusNode, autofocus, tileColor, title, subtitle, isThreeLine, dense, contentPadding, secondary, selected, controlAffinity, shape, selectedTileColor, visualDensity, enableFeedback, hoverColor} : {key?:Key, value:bool, onChanged?:ValueChanged_bool_, activeColor?:Color, activeTrackColor?:Color, inactiveThumbColor?:Color, inactiveTrackColor?:Color, activeThumbImage?:unknown, inactiveThumbImage?:unknown, focusNode?:FocusNode, autofocus?:bool, tileColor?:Color, title?:Widget, subtitle?:Widget, isThreeLine?:bool, dense?:bool, contentPadding?:EdgeInsetsGeometry, secondary?:Widget, selected?:bool, controlAffinity?:ListTileControlAffinity, shape?:ShapeBorder, selectedTileColor?:Color, visualDensity?:VisualDensity, enableFeedback?:bool, hoverColor?:Color}):SwitchListTile
}

interface VisualDensity {
}

declare function VisualDensity({horizontal, vertical}? : {horizontal?:double, vertical?:double}):VisualDensity

declare namespace VisualDensity {

    function defaultDensityForPlatform(platform:TargetPlatform):VisualDensity

    const standard: VisualDensity

    const comfortable: VisualDensity

    const compact: VisualDensity
}

interface TextSelection {
}

declare function TextSelection({baseOffset, extentOffset, affinity, isDirectional} : {baseOffset:int, extentOffset:int, affinity?:TextAffinity, isDirectional?:bool}):TextSelection

declare namespace TextSelection {

    function collapsed({offset, affinity} : {offset:int, affinity?:TextAffinity}):TextSelection

    function fromPosition(position:TextPosition):TextSelection
}

interface TextPosition {
}

declare function TextPosition({offset, affinity} : {offset:int, affinity?:TextAffinity}):TextPosition

interface TextEditingValue {
}

declare function TextEditingValue({text, selection, composing}? : {text?:string, selection?:TextSelection, composing?:TextRange}):TextEditingValue

interface TextRange {
}

declare function TextRange({start, end} : {start:int, end:int}):TextRange

interface Radio {
}

declare function Radio({key, value, groupValue, onChanged, mouseCursor, toggleable, activeColor, fillColor, focusColor, hoverColor, overlayColor, splashRadius, materialTapTargetSize, visualDensity, focusNode, autofocus} : {key?:Key, value:int, groupValue?:int, onChanged?:ValueChanged_int__, mouseCursor?:MouseCursor, toggleable?:bool, activeColor?:Color, fillColor?:unknown, focusColor?:Color, hoverColor?:Color, overlayColor?:unknown, splashRadius?:double, materialTapTargetSize?:MaterialTapTargetSize, visualDensity?:VisualDensity, focusNode?:FocusNode, autofocus?:bool}):Radio

declare namespace Radio {

    function adaptive({key, value, groupValue, onChanged, mouseCursor, toggleable, activeColor, fillColor, focusColor, hoverColor, overlayColor, splashRadius, materialTapTargetSize, visualDensity, focusNode, autofocus} : {key?:Key, value:int, groupValue?:int, onChanged?:ValueChanged_int__, mouseCursor?:MouseCursor, toggleable?:bool, activeColor?:Color, fillColor?:unknown, focusColor?:Color, hoverColor?:Color, overlayColor?:unknown, splashRadius?:double, materialTapTargetSize?:MaterialTapTargetSize, visualDensity?:VisualDensity, focusNode?:FocusNode, autofocus?:bool}):Radio
}

interface Image {
}

declare function Image({key, image, frameBuilder, loadingBuilder, errorBuilder, semanticLabel, excludeFromSemantics, width, height, color, opacity, colorBlendMode, fit, alignment, repeat, centerSlice, matchTextDirection, gaplessPlayback, isAntiAlias, filterQuality} : {key?:Key, image:unknown, frameBuilder?:ImageFrameBuilder, loadingBuilder?:ImageLoadingBuilder, errorBuilder?:ImageErrorWidgetBuilder, semanticLabel?:string, excludeFromSemantics?:bool, width?:double, height?:double, color?:Color, opacity?:unknown, colorBlendMode?:BlendMode, fit?:BoxFit, alignment?:AlignmentGeometry, repeat?:ImageRepeat, centerSlice?:Rect, matchTextDirection?:bool, gaplessPlayback?:bool, isAntiAlias?:bool, filterQuality?:FilterQuality}):Image

declare namespace Image {

    function asset(name:string, {key, bundle, frameBuilder, errorBuilder, semanticLabel, excludeFromSemantics, scale, width, height, color, opacity, colorBlendMode, fit, alignment, repeat, centerSlice, matchTextDirection, gaplessPlayback, isAntiAlias, package, filterQuality, cacheWidth, cacheHeight}? : {key?:Key, bundle?:AssetBundle, frameBuilder?:ImageFrameBuilder, errorBuilder?:ImageErrorWidgetBuilder, semanticLabel?:string, excludeFromSemantics?:bool, scale?:double, width?:double, height?:double, color?:Color, opacity?:unknown, colorBlendMode?:BlendMode, fit?:BoxFit, alignment?:AlignmentGeometry, repeat?:ImageRepeat, centerSlice?:Rect, matchTextDirection?:bool, gaplessPlayback?:bool, isAntiAlias?:bool, package?:string, filterQuality?:FilterQuality, cacheWidth?:int, cacheHeight?:int}):Image

    function file(file:File, {key, scale, frameBuilder, errorBuilder, semanticLabel, excludeFromSemantics, width, height, color, opacity, colorBlendMode, fit, alignment, repeat, centerSlice, matchTextDirection, gaplessPlayback, isAntiAlias, filterQuality, cacheWidth, cacheHeight}? : {key?:Key, scale?:double, frameBuilder?:ImageFrameBuilder, errorBuilder?:ImageErrorWidgetBuilder, semanticLabel?:string, excludeFromSemantics?:bool, width?:double, height?:double, color?:Color, opacity?:unknown, colorBlendMode?:BlendMode, fit?:BoxFit, alignment?:AlignmentGeometry, repeat?:ImageRepeat, centerSlice?:Rect, matchTextDirection?:bool, gaplessPlayback?:bool, isAntiAlias?:bool, filterQuality?:FilterQuality, cacheWidth?:int, cacheHeight?:int}):Image

    function memory(bytes:Uint8List, {key, scale, frameBuilder, errorBuilder, semanticLabel, excludeFromSemantics, width, height, color, opacity, colorBlendMode, fit, alignment, repeat, centerSlice, matchTextDirection, gaplessPlayback, isAntiAlias, filterQuality, cacheWidth, cacheHeight}? : {key?:Key, scale?:double, frameBuilder?:ImageFrameBuilder, errorBuilder?:ImageErrorWidgetBuilder, semanticLabel?:string, excludeFromSemantics?:bool, width?:double, height?:double, color?:Color, opacity?:unknown, colorBlendMode?:BlendMode, fit?:BoxFit, alignment?:AlignmentGeometry, repeat?:ImageRepeat, centerSlice?:Rect, matchTextDirection?:bool, gaplessPlayback?:bool, isAntiAlias?:bool, filterQuality?:FilterQuality, cacheWidth?:int, cacheHeight?:int}):Image

    function network(src:string, {key, scale, frameBuilder, loadingBuilder, errorBuilder, semanticLabel, excludeFromSemantics, width, height, color, opacity, colorBlendMode, fit, alignment, repeat, centerSlice, matchTextDirection, gaplessPlayback, filterQuality, isAntiAlias, headers, cacheWidth, cacheHeight}? : {key?:Key, scale?:double, frameBuilder?:ImageFrameBuilder, loadingBuilder?:ImageLoadingBuilder, errorBuilder?:ImageErrorWidgetBuilder, semanticLabel?:string, excludeFromSemantics?:bool, width?:double, height?:double, color?:Color, opacity?:unknown, colorBlendMode?:BlendMode, fit?:BoxFit, alignment?:AlignmentGeometry, repeat?:ImageRepeat, centerSlice?:Rect, matchTextDirection?:bool, gaplessPlayback?:bool, filterQuality?:FilterQuality, isAntiAlias?:bool, headers?:{[id: string]: string}, cacheWidth?:int, cacheHeight?:int}):Image
}

interface NetworkImage {
}

declare function NetworkImage(url:string, {scale, headers} : {scale:double, headers?:{[id: string]: string}}):NetworkImage

interface FileImage {
}

declare function FileImage(file:File, {scale}? : {scale?:double}):FileImage

interface MemoryImage {
}

declare function MemoryImage(bytes:Uint8List, {scale}? : {scale?:double}):MemoryImage

interface File {
}

declare function File(path:string):File

declare namespace File {

    function fromRawPath(rawPath:Uint8List):File

    function fromUri(uri:Uri):File
}

interface Uint8List {
}

declare function Uint8List(length:int):Uint8List

declare namespace Uint8List {

    function fromList(elements:int[]):Uint8List
}

interface Uri {
}

declare function Uri({scheme, userInfo, host, port, path, pathSegments, query, queryParameters, fragment}? : {scheme?:string, userInfo?:string, host?:string, port?:int, path?:string, pathSegments?:unknown, query?:string, queryParameters?:{[id: string]: dynamic}, fragment?:string}):Uri

declare namespace Uri {

    function dataFromBytes(bytes:int[], {mimeType, parameters, percentEncoded}? : {mimeType?:string, parameters?:{[id: string]: string}, percentEncoded?:bool}):Uri

    function dataFromString(content:string, {mimeType, encoding, parameters, base64}? : {mimeType?:string, encoding?:Encoding, parameters?:{[id: string]: string}, base64?:bool}):Uri

    function directory(path:string, {windows}? : {windows?:bool}):Uri

    function file(path:string, {windows}? : {windows?:bool}):Uri

    function http(authority:string):Uri

    function https(authority:string):Uri
}

interface Visibility {
}

declare function Visibility({key, child, replacement, visible, maintainState, maintainAnimation, maintainSize, maintainSemantics, maintainInteractivity} : {key?:Key, child:Widget, replacement?:Widget, visible?:bool, maintainState?:bool, maintainAnimation?:bool, maintainSize?:bool, maintainSemantics?:bool, maintainInteractivity?:bool}):Visibility

declare namespace Visibility {

    function maintain({key, child, visible} : {key?:Key, child:Widget, visible?:bool}):Visibility
}

interface TabBar {
}

declare function TabBar({key, tabs, controller, isScrollable, padding, indicatorColor, automaticIndicatorColorAdjustment, indicatorWeight, indicatorPadding, indicator, indicatorSize, dividerColor, labelColor, labelStyle, labelPadding, unselectedLabelColor, unselectedLabelStyle, dragStartBehavior, overlayColor, mouseCursor, enableFeedback, onTap, physics, splashFactory, splashBorderRadius} : {key?:Key, tabs:Widget[], controller?:TabController, isScrollable?:bool, padding?:EdgeInsetsGeometry, indicatorColor?:Color, automaticIndicatorColorAdjustment?:bool, indicatorWeight?:double, indicatorPadding?:EdgeInsetsGeometry, indicator?:Decoration, indicatorSize?:TabBarIndicatorSize, dividerColor?:Color, labelColor?:Color, labelStyle?:TextStyle, labelPadding?:EdgeInsetsGeometry, unselectedLabelColor?:Color, unselectedLabelStyle?:TextStyle, dragStartBehavior?:DragStartBehavior, overlayColor?:unknown, mouseCursor?:MouseCursor, enableFeedback?:bool, onTap?:ValueChanged_int_, physics?:ScrollPhysics, splashFactory?:InteractiveInkFeatureFactory, splashBorderRadius?:BorderRadius}):TabBar

declare namespace TabBar {

    function secondary({key, tabs, controller, isScrollable, padding, indicatorColor, automaticIndicatorColorAdjustment, indicatorWeight, indicatorPadding, indicator, indicatorSize, dividerColor, labelColor, labelStyle, labelPadding, unselectedLabelColor, unselectedLabelStyle, dragStartBehavior, overlayColor, mouseCursor, enableFeedback, onTap, physics, splashFactory, splashBorderRadius} : {key?:Key, tabs:Widget[], controller?:TabController, isScrollable?:bool, padding?:EdgeInsetsGeometry, indicatorColor?:Color, automaticIndicatorColorAdjustment?:bool, indicatorWeight?:double, indicatorPadding?:EdgeInsetsGeometry, indicator?:Decoration, indicatorSize?:TabBarIndicatorSize, dividerColor?:Color, labelColor?:Color, labelStyle?:TextStyle, labelPadding?:EdgeInsetsGeometry, unselectedLabelColor?:Color, unselectedLabelStyle?:TextStyle, dragStartBehavior?:DragStartBehavior, overlayColor?:unknown, mouseCursor?:MouseCursor, enableFeedback?:bool, onTap?:ValueChanged_int_, physics?:ScrollPhysics, splashFactory?:InteractiveInkFeatureFactory, splashBorderRadius?:BorderRadius}):TabBar
}

interface TabBarView {
}

declare function TabBarView({key, children, controller, physics, dragStartBehavior, viewportFraction, clipBehavior} : {key?:Key, children:Widget[], controller?:TabController, physics?:ScrollPhysics, dragStartBehavior?:DragStartBehavior, viewportFraction?:double, clipBehavior?:Clip}):TabBarView

interface TabController {
}

declare function TabController({initialIndex, animationDuration, length, vsync} : {initialIndex?:int, animationDuration?:Duration, length:int, vsync:TickerProvider}):TabController

interface DefaultTabController {
}

declare function DefaultTabController({key, length, initialIndex, child, animationDuration} : {key?:Key, length:int, initialIndex?:int, child:Widget, animationDuration?:Duration}):DefaultTabController

interface LayoutBuilder {
}

declare function LayoutBuilder({key, builder} : {key?:Key, builder:LayoutWidgetBuilder}):LayoutBuilder

interface GameView {
}

declare function GameView({key, child} : {key?:Key, child:Widget}):GameView

declare function runApp(app:Widget ):void

declare function showDialog({context, builder, barrierDismissible, barrierColor, barrierLabel, useSafeArea, useRootNavigator, routeSettings, anchorPoint} : {context:BuildContext, builder:WidgetBuilder, barrierDismissible?:bool, barrierColor?:Color, barrierLabel?:string, useSafeArea?:bool, useRootNavigator?:bool, routeSettings?:RouteSettings, anchorPoint?:Offset} ):Future

declare function showGeneralDialog({context, pageBuilder, barrierDismissible, barrierLabel, barrierColor, transitionDuration, transitionBuilder, useRootNavigator, routeSettings, anchorPoint} : {context:BuildContext, pageBuilder:RoutePageBuilder, barrierDismissible?:bool, barrierLabel?:string, barrierColor?:Color, transitionDuration?:Duration, transitionBuilder?:RouteTransitionsBuilder, useRootNavigator?:bool, routeSettings?:RouteSettings, anchorPoint?:Offset} ):Future

declare function StringKey(key:string ):Key

declare function IntKey(key:int ):Key

declare function markNeedsBuild(context:BuildContext ):void

interface AlignmentDirectional {}

interface AndroidOverscrollIndicator {}

interface AppBarTheme {}

interface AppPrivateCommandCallback {}

interface AssetBundle {}

interface BackButtonDispatcher {}

interface BadgeThemeData {}

interface BlendMode {}

interface BottomAppBarTheme {}

interface BottomNavigationBarLandscapeLayout {}

interface BottomNavigationBarThemeData {}

interface BottomNavigationBarType {}

interface BottomSheetThemeData {}

interface BoxBorder {}

interface BoxHeightStyle {}

interface BoxShadow {}

interface BoxShape {}

interface BoxWidthStyle {}

interface BuildContext {}

interface ButtonBarThemeData {}

interface ButtonThemeData {}

interface CapturedThemes {}

interface CardTheme {}

interface CheckboxThemeData {}

interface ChildIndexGetter {}

interface ChipThemeData {}

interface Curve {}

interface DataTableThemeData {}

interface DecorationImage {}

interface DeviceGestureSettings {}

interface DialogTheme {}

interface DismissDirection {}

interface DisplayFeature {}

interface DividerThemeData {}

interface DragAnchorStrategy {}

interface DragStartBehavior {}

interface DragUpdateCallback {}

interface DrawerCallback {}

interface DrawerThemeData {}

interface ElevatedButtonThemeData {}

interface Encoding {}

interface ExpansionTileThemeData {}

interface FilledButtonThemeData {}

interface FilterQuality {}

interface FlexFit {}

interface FloatingActionButtonAnimator {}

interface FloatingActionButtonLocation {}

interface FloatingActionButtonThemeData {}

interface FloatingLabelAlignment {}

interface FloatingLabelBehavior {}

interface FocusNode {}

interface FontFeature {}

interface FontVariation {}

interface GenerateAppTitle {}

interface GestureForcePressEndCallback {}

interface GestureForcePressPeakCallback {}

interface GestureForcePressStartCallback {}

interface GestureForcePressUpdateCallback {}

interface GestureRecognizer {}

interface GestureScaleEndCallback {}

interface GestureScaleStartCallback {}

interface GestureScaleUpdateCallback {}

interface Gradient {}

interface HitTestBehavior {}

interface IconButtonThemeData {}

interface IconThemeData {}

interface ImageErrorListener {}

interface ImageErrorWidgetBuilder {}

interface ImageFrameBuilder {}

interface ImageLoadingBuilder {}

interface ImageRepeat {}

interface InitialRouteListFactory {}

interface InlineSpan {}

interface InputBorder {}

interface InputCounterWidgetBuilder {}

interface InputDecorationTheme {}

interface InteractiveInkFeatureFactory {}

interface ListTileControlAffinity {}

interface ListTileStyle {}

interface ListTileThemeData {}

interface LocalKey {}

interface Locale {}

interface LocaleListResolutionCallback {}

interface LocaleResolutionCallback {}

interface MaterialBannerThemeData {}

interface MaterialStatesController {}

interface MaterialType {}

interface Matrix4 {}

interface MaxLengthEnforcement {}

interface MenuBarThemeData {}

interface MenuButtonThemeData {}

interface MenuThemeData {}

interface MouseCursor {}

interface NavigationBarThemeData {}

interface NavigationDrawerThemeData {}

interface NavigationMode {}

interface NavigationRailThemeData {}

interface NavigatorObserver {}

interface NoDefaultCupertinoThemeData {}

interface OutlinedBorder {}

interface OutlinedButtonThemeData {}

interface OverflowBarAlignment {}

interface PageTransitionsTheme {}

interface Paint {}

interface PlaceholderAlignment {}

interface PointerDeviceKind {}

interface PopupMenuCanceled {}

interface PopupMenuPosition {}

interface PopupMenuThemeData {}

interface PreferredSizeWidget {}

interface ProgressIndicatorThemeData {}

interface RadioThemeData {}

interface RangeSliderThumbShape {}

interface RangeSliderTickMarkShape {}

interface RangeSliderTrackShape {}

interface RangeSliderValueIndicatorShape {}

interface RangeThumbSelector {}

interface Rect {}

interface RelativeRect {}

interface RouteInformationProvider {}

interface RoutePageBuilder {}

interface RouteSettings {}

interface RouteTransitionsBuilder {}

interface ScrollBehavior {}

interface ScrollNotificationPredicate {}

interface ScrollPhysics {}

interface ScrollViewKeyboardDismissBehavior {}

interface ScrollbarOrientation {}

interface ScrollbarThemeData {}

interface SegmentedButtonThemeData {}

interface SelectionRegistrar {}

interface SemanticFormatterCallback {}

interface Shadow {}

interface ShapeBorder {}

interface ShowValueIndicator {}

interface SliderTickMarkShape {}

interface SliderTrackShape {}

interface SmartDashesType {}

interface SmartQuotesType {}

interface SnackBarAction {}

interface SnackBarBehavior {}

interface SnackBarThemeData {}

interface SpellCheckConfiguration {}

interface StackFit {}

interface StrutStyle {}

interface SwitchThemeData {}

interface SystemUiOverlayStyle {}

interface TabBarIndicatorSize {}

interface TabBarTheme {}

interface TableBorder {}

interface TapRegionCallback {}

interface TextBaseline {}

interface TextButtonThemeData {}

interface TextCapitalization {}

interface TextDecoration {}

interface TextDecorationStyle {}

interface TextHeightBehavior {}

interface TextLeadingDistribution {}

interface TextMagnifierConfiguration {}

interface TextSelectionControls {}

interface TextSelectionThemeData {}

interface TextWidthBasis {}

interface TickerProvider {}

interface TimePickerThemeData {}

interface ToggleButtonsThemeData {}

interface TooltipThemeData {}

interface TooltipTriggeredCallback {}

interface TransitionBuilder {}

interface Typography {}

interface VerticalDirection {}

interface WindowPadding {}

interface WrapAlignment {}

interface WrapCrossAlignment {}

interface dynamic {}

declare class FontStyle {
    static normal:FontStyle
    static italic:FontStyle
}

declare class FontWeight {
    static bold:FontWeight
    static normal:FontWeight
}

declare class Icons {
    static favorite:IconData
    static book:IconData
    static star:IconData
    static search:IconData
    static question_mark:IconData
    static call_made:IconData
    static double_arrow:IconData
    static crop_rotate:IconData
    static drag_indicator:IconData
    static download:IconData
    static download_done:IconData
    static ac_unit:IconData
    static access_alarm:IconData
    static add_circle:IconData
    static adjust:IconData
    static airline_stops:IconData
    static all_inclusive:IconData
    static all_out:IconData
    static alt_route:IconData
    static alternate_email:IconData
    static anchor:IconData
    static abc:IconData
    static arrow_drop_up:IconData
    static arrow_drop_down:IconData
    static arrow_right:IconData
    static arrow_left:IconData
    static add:IconData
    static remove:IconData
    static play_arrow:IconData
    static stop:IconData
    static person:IconData
    static home:IconData
    static lock:IconData
    static edit:IconData
    static close:IconData
    static article:IconData
    static folder_open:IconData
    static folder:IconData
    static terrain:IconData
    static casino:IconData
    static circle:IconData
    static square:IconData
    static arrow_upward:IconData
    static more_vert:IconData
    static more_horiz:IconData
    static change_circle:IconData
    static delete:IconData
    static location_searching:IconData
}

declare class TextDirection {
    static rtl:TextDirection
    static ltr:TextDirection
}

declare class CrossAxisAlignment {
    static start:CrossAxisAlignment
    static end:CrossAxisAlignment
    static center:CrossAxisAlignment
    static stretch:CrossAxisAlignment
    static baseline:CrossAxisAlignment
}

declare class TextOverflow {
    static clip:TextOverflow
    static fade:TextOverflow
    static ellipsis:TextOverflow
    static visible:TextOverflow
}

declare class Curves {
    static linear:Curves
    static decelerate:Curves
    static fastLinearToSlowEaseIn:Curves
    static ease:Curves
    static easeIn:Curves
    static easeInToLinear:Curves
    static easeInSine:Curves
    static easeInQuad:Curves
    static easeInCubic:Curves
    static easeInQuart:Curves
    static easeInQuint:Curves
    static easeInExpo:Curves
    static easeInCirc:Curves
    static easeInBack:Curves
    static easeOut:Curves
    static linearToEaseOut:Curves
    static easeOutSine:Curves
    static easeOutQuad:Curves
    static easeOutCubic:Curves
    static easeOutQuart:Curves
    static easeOutQuint:Curves
    static easeOutExpo:Curves
    static easeOutCirc:Curves
    static easeOutBack:Curves
    static easeInOut:Curves
    static easeInOutSine:Curves
    static easeInOutQuad:Curves
    static easeInOutCubic:Curves
    static easeInOutCubicEmphasized:Curves
    static easeInOutQuart:Curves
    static easeInOutQuint:Curves
    static easeInOutExpo:Curves
    static easeInOutCirc:Curves
    static easeInOutBack:Curves
    static fastOutSlowIn:Curves
    static slowMiddle:Curves
    static bounceIn:Curves
    static bounceOut:Curves
    static bounceInOut:Curves
    static elasticIn:Curves
    static elasticOut:Curves
    static elasticInOut:Curves
}

declare class MainAxisAlignment {
    static start:MainAxisAlignment
    static end:MainAxisAlignment
    static center:MainAxisAlignment
    static spaceBetween:MainAxisAlignment
    static spaceAround:MainAxisAlignment
    static spaceEvenly:MainAxisAlignment
}

declare class Clip {
    static none:Clip
    static hardEdge:Clip
    static antiAlias:Clip
    static antiAliasWithSaveLayer:Clip
}

declare class TableCellVerticalAlignment {
    static top:TableCellVerticalAlignment
    static middle:TableCellVerticalAlignment
    static bottom:TableCellVerticalAlignment
    static baseline:TableCellVerticalAlignment
    static fill:TableCellVerticalAlignment
}

declare class BorderStyle {
    static none:BorderStyle
    static solid:BorderStyle
}

declare class Brightness {
    static dark:Brightness
    static light:Brightness
}

declare class TextAlign {
    static left:TextAlign
    static right:TextAlign
    static center:TextAlign
    static justify:TextAlign
    static start:TextAlign
    static end:TextAlign
}

declare class DecorationPosition {
    static background:DecorationPosition
    static foreground:DecorationPosition
}

declare class TooltipTriggerMode {
    static manual:TooltipTriggerMode
    static longPress:TooltipTriggerMode
    static tap:TooltipTriggerMode
}

declare class TextInputAction {
    static none:TextInputAction
    static unspecified:TextInputAction
    static done:TextInputAction
    static go:TextInputAction
    static search:TextInputAction
    static send:TextInputAction
    static next:TextInputAction
    static previous:TextInputAction
    static continueAction:TextInputAction
    static join:TextInputAction
    static route:TextInputAction
    static emergencyCall:TextInputAction
    static newline:TextInputAction
}

declare class MainAxisSize {
    static min:MainAxisSize
    static max:MainAxisSize
}

declare class BoxFit {
    static fill:BoxFit
    static contain:BoxFit
    static cover:BoxFit
    static fitWidth:BoxFit
    static fitHeight:BoxFit
    static none:BoxFit
    static scaleDown:BoxFit
}

declare class ThemeMode {
    static system:ThemeMode
    static light:ThemeMode
    static dark:ThemeMode
}

declare class MaterialState {
    static hovered:MaterialState
    static focused:MaterialState
    static pressed:MaterialState
    static dragged:MaterialState
    static selected:MaterialState
    static scrolledUnder:MaterialState
    static disabled:MaterialState
    static error:MaterialState
}

declare class Axis {
    static horizontal:Axis
    static vertical:Axis
}

declare class TargetPlatform {
    static android:TargetPlatform
    static fuchsia:TargetPlatform
    static iOS:TargetPlatform
    static linux:TargetPlatform
    static macOS:TargetPlatform
    static windows:TargetPlatform
}

declare class MaterialTapTargetSize {
    static padded:MaterialTapTargetSize
    static shrinkWrap:MaterialTapTargetSize
}

declare class TextAffinity {
    static upstream:TextAffinity
    static downstream:TextAffinity
}

type BoolValueChanged = (value: boolean) => void

type DoubleValueChanged = (value: double) => void

type DragEndCallback = (details: DraggableDetails) => void

type DraggableCanceledCallback = (velocity: Velocity, offset: Offset) => void

type DropdownButtonBuilder = (context: BuildContext) => Widget[]

type DynamicCallback = (value: any) => void

type FrameCallback = (timeStamp: Duration) => void

type GestureDragCancelCallback = () => void

type GestureDragDownCallback = (details: DragDownDetails) => void

type GestureDragEndCallback = (details: DragEndDetails) => void

type GestureDragStartCallback = (details: DragStartDetails) => void

type GestureDragUpdateCallback = (details: DragUpdateDetails) => void

type GestureLongPressCallback = () => void

type GestureLongPressCancelCallback = () => void

type GestureLongPressDownCallback = (details: LongPressDownDetails) => void

type GestureLongPressEndCallback = (details: LongPressEndDetails) => void

type GestureLongPressMoveUpdateCallback = (details: LongPressMoveUpdateDetails) => void

type GestureLongPressStartCallback = (details: LongPressStartDetails) => void

type GestureLongPressUpCallback = () => void

type GestureTapCallback = () => void

type GestureTapCancelCallback = () => void

type GestureTapDownCallback = (details: TapDownDetails) => void

type GestureTapUpCallback = (details: TapUpDetails) => void

type IntValueChanged = (value: int) => void

type LayoutWidgetBuilder = (context:BuildContext, constraints:BoxConstraints) => Widget

type MaterialPropertyResolver_BorderSide_ = (states: MaterialState[]) => BorderSide

type MaterialPropertyResolver_Color_ = (states: MaterialState[]) => Color

type NullableIndexedWidgetBuilder = (context:BuildContext, index:int) => Widget

type PointerEnterEventListener = (event:PointerEnterEvent) => void

type PointerExitEventListener = (event:PointerExitEvent) => void

type PopupMenuItemBuilder_int_ = (context: BuildContext) => PopupMenuEntry[]

type PopupMenuItemSelected_int_ = (action: int) => void

type RouteFactory = (name:string) => Widget

type StateCreator = () => LState

type StatefulWidgetBuilder = (context: BuildContext, setState: () => void) => Widget

type StringValueChanged = (value: string) => void

type TextValidateFunction = (oldValue: string, newValue: string) => boolean

type ValueChanged_Color_ = (color: Color) => void

type ValueChanged_Set_int__ = (selection: int[]) => void

type ValueChanged_bool_ = (value: boolean) => void

type ValueChanged_double_ = (value: double) => void

type ValueChanged_int_ = (value: int) => void

type ValueChanged_int__ = (value: int) => void

type VoidCallback = () => void

type WidgetBuilder = (context:BuildContext) => Widget
