
declare function nextGenAppMain(): Widget

namespace flutter {

    function onGenerateRoute(name: string): Widget {
        print("onGenerateRoute", name)
        if (name == '/')
            return MenuPage();

        if (name == '/counter_example')
            return CounterExample();

        if (name == '/next_gen_ui_demo' && nextGenAppMain)
            return nextGenAppMain() 

        return SizedBox.shrink()
    }

    export function main() {
        require("menu")
        require("counter_example")
        require("login")

        let widget: Widget
        widget = Builder({
            builder(context) {
                return MaterialApp({
                    title: "Flutter Demo",
                    theme: ThemeData({
                        colorSchemeSeed: Colors.deepPurple, 
                        useMaterial3: true,
                        brightness: Brightness.light
                    }),
                    darkTheme: ThemeData({
                      colorSchemeSeed: Colors.blue,
                      useMaterial3: true,
                      brightness: Brightness.dark,
                    }),
                    themeMode: ThemeMode.light,
                    debugShowCheckedModeBanner: false,
                    navigatorKey: NavigationService.navigatorKey,
                    initialRoute: '/',
                    onGenerateRoute: onGenerateRoute,
                })
            }
        })
        
        runApp(widget)
    }
}

function gotoPage(routeName:string) : void {
    Navigator.of(NavigationService.context()).pushNamed(routeName) /**pushReplacementNamed popAndPushNamed*/
}

flutter.main()
