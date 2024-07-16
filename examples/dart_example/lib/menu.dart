
// ignore_for_file: dead_code

import 'package:dart_example/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unreal/flutter_unreal.dart';

void _gotoPage(String page) {
  Navigator.of(NavigationService.context()).pushNamed(page); //popAndPushNamed
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Offset? position;
  FractionalOffset? alignment;

  @override
  Widget build(BuildContext context) {      
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final ThemeData theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        late Widget widget;
      
        widget = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: TextButton(
                onPressed: () {
                  _gotoPage("/counter_example");
                },
                child: const Text("Counter Example")
              )
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: TextButton(
                onPressed: () {
                  showLoginDialog(context);
                },
                child: const Text("Login Dialog")
              )
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: TextButton(
                onPressed: () {
                  _gotoPage("/next_gen_ui_demo");
                },
                child: const Text("Next Generation UI Demo")
              )
            ),
          ]
        );
        
        var parentSize = Size(constraints.maxWidth, constraints.maxHeight);
        var size = const Size(250, 300);
        position ??= aligmentToPosition(parentSize, size, FractionalOffset.center);

        widget = Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorScheme.background.withOpacity(0.3),
          ),
          child: widget
        );

        widget = BlockPointer(child: widget);

        var useAlignment = true;
        if (useAlignment) {
          alignment ??= positionToAlignment(parentSize, size, position!);
          widget = Align(
            alignment: alignment!,
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails e) {
                var pos = aligmentToPosition(parentSize, size, alignment!);
                pos += e.delta;
                alignment = positionToAlignment(parentSize, size, pos);

                setState(() {});
              },
              child: widget
            )
          );
        } else {
          widget = Stack (
            children:[
              Positioned(
                left: position!.dx,
                top: position!.dy,
                child: GestureDetector(
                  onPanUpdate: (DragUpdateDetails e) {
                    position = position! + e.delta;
                    setState(() {});
                  },
                  child: widget
                )
              )
            ]
          );
        }

        return widget;
      }
    );
  }

  FractionalOffset positionToAlignment(Size size, Size childSize, Offset pos) {
    double dx = (pos.dx / (size.width - childSize.width));
    double dy = (pos.dy / (size.height - childSize.height));
    dx = dx.clamp(0, 1);
    dy = dy.clamp(0, 1);

    return FractionalOffset(dx, dy);
  }

  Offset aligmentToPosition(Size size, Size childSize, FractionalOffset alignment) {
    double dx = (size.width - childSize.width) * alignment.dx;
    double dy = (size.height - childSize.height) * alignment.dy;

    return Offset(dx, dy);
  }
}
