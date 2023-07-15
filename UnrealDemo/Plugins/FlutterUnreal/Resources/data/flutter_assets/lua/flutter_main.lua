--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
flutter = flutter or ({})
do
    local function onGenerateRoute(name)
        print("onGenerateRoute", name)
        if name == "/" then
            return flutter.MenuPage()
        end
        if name == "/counter_example" then
            return flutter.CounterExample()
        end
        if name == "/next_gen_ui_demo" and nextGenAppMain then
            return nextGenAppMain()
        end
        return SizedBox.shrink()
    end
    function flutter.main()
        require("menu")
        require("counter_example")
        require("login")
        local widget
        widget = Builder({builder = function(context)
            return MaterialApp({
                title = "Flutter Demo",
                theme = ThemeData({colorSchemeSeed = Colors.deepPurple, useMaterial3 = true, brightness = Brightness.light}),
                darkTheme = ThemeData({colorSchemeSeed = Colors.blue, useMaterial3 = true, brightness = Brightness.dark}),
                themeMode = ThemeMode.light,
                debugShowCheckedModeBanner = false,
                navigatorKey = NavigationService.navigatorKey,
                initialRoute = "/",
                onGenerateRoute = onGenerateRoute
            })
        end})
        runApp(widget)
    end
end
function gotoPage(routeName)
    Navigator.of(NavigationService.context()):pushReplacementNamed(routeName)
end
flutter.main()
