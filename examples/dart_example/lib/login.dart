
import 'package:flutter/material.dart';
import 'package:flutter_unreal/flutter_unreal.dart';

Widget loginContent() {
  bool rememberMe = false;
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) { 
      const maxWidth = 400.0;
      const buttonColor = Color(0xFF09AF79);
      var listViewChildren = [
        Align(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(maxWidth: maxWidth),
            child: TextField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(maxWidth: maxWidth),
            child: TextField(
              decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: (value) {
              }
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(maxWidth: maxWidth),
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                Checkbox(
                  value: rememberMe, 
                  onChanged: (value) {
                    rememberMe = value!;
                    setState((){});
                  },
                  activeColor: buttonColor
                ),
                const SizedBox(width: 12),
                const Text("Remember Me"),
                const Expanded(child: SizedBox.shrink()),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: buttonColor,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Row(
                    children: [
                        Icon(Icons.lock),
                        SizedBox(width: 6),
                        Text("Login"),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ];

      late Widget widget;
      widget = Align(
          alignment: Alignment.center,
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: listViewChildren,
          )
      );

      widget = BlockPointer(child: widget);

      widget = Material(
          color: Colors.transparent,
          child: widget,
      );

      widget = SizedBox(
          width: 400, 
          height: 300, 
          child: widget
      );

      return widget;
    }
  );
}

void showLoginDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    icon: const Icon(Icons.close, size: 25),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }
                )
            ),
            const Center(
                child: Text('Sign in')
            )
          ]
        ),
        content: loginContent()
      );
    }
  );
}
