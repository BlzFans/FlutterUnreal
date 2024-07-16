// ignore_for_file: dead_code

import 'package:dart_example/counter_example.dart';
import 'package:dart_example/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unreal/flutter_unreal.dart';
import 'package:next_gen_ui_demo/main.dart';

void main() {
  initFlutterUnreal();
  runApp(GameView(child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  PageRouteBuilder onGenerateRoute(RouteSettings settings) {
    late Widget widget;
    if (settings.name == "/") {
      widget = const MenuPage();
    } else if (settings.name == "/counter_example") {
      widget = const CounterExample();
    } else if (settings.name == "/next_gen_ui_demo") {
      widget = nextGenAppMain();
      widget = BlockPointer(child: widget);
    } else {
      widget = const SizedBox.shrink();
    }

    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}

