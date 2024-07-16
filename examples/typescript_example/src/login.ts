namespace flutter {
    function loginContent(): Widget {
        let rememberMe = false
        let maxWidth = 400.0
        let buttonColor = Color(0xFF09AF79)

        return StatefulBuilder({
            builder: (context, setState): Widget => {
                let listViewChildren = [
                    Align({
                        alignment: Alignment.center,
                        child: Container({
                            constraints: BoxConstraints({maxWidth: maxWidth}),
                            child: TextField({
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration({
                                    labelText: "Username",
                                    border: OutlineInputBorder(),
                                }),
                                onChanged(value) {
                                },
                            }),
                        }),
                    }),
                    SizedBox({height: 12}),
                    Align({
                        alignment: Alignment.center,
                        child: Container({
                            constraints: BoxConstraints({maxWidth: maxWidth}),
                            child: TextField({
                                decoration: InputDecoration({
                                    labelText: "Password",
                                    border: OutlineInputBorder(),
                                }),
                                obscureText: true,
                                onChanged(value) {
                                }
                            }),
                        }),
                    }),
                    Align({
                        alignment: Alignment.center,
                        child: Container({
                            constraints: BoxConstraints({maxWidth: maxWidth}),
                            padding: EdgeInsets.symmetric({vertical: 30}),
                            child: Row({
                                children: [
                                    Checkbox({
                                        value: rememberMe, 
                                        onChanged(value) {
                                            rememberMe = value
                                            setState()
                                        },
                                        activeColor: buttonColor
                                    }),
                                    SizedBox({width: 12}),
                                    Text("Remember Me"),
                                    Expanded({child: SizedBox.shrink()}),
                                    TextButton({
                                        style: TextButton.styleFrom({
                                            foregroundColor: Colors.black,
                                            backgroundColor: buttonColor,
                                            padding: EdgeInsets.symmetric({vertical: 10, horizontal: 24}),
                                            shape: RoundedRectangleBorder({
                                                borderRadius: BorderRadius.circular(12),
                                            }),
                                        }),
                                        onPressed() {
                                        },
                                        child: Row({
                                            children: [
                                                Icon(Icons.lock),
                                                SizedBox({width: 6}),
                                                Text("Login"),
                                            ],
                                        }),
                                    })
                                ],
                            }),
                        }),
                    })
                ]

                let widget: Widget
                widget = Align({
                    alignment: Alignment.center,
                    child: ListView({
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric({horizontal: 24}),
                        children: listViewChildren,
                    })
                })

                widget = Material({
                    color: Colors.transparent,
                    child: widget,
                })

                widget = SizedBox({
                    width: 400, 
                    height: 300, 
                    child: widget
                })

                return widget
            }
        })
    }

    export function showLoginDialog(context: BuildContext) {
        showDialog({
            context: context,
            barrierDismissible: false,
            builder(context) {
                return BlockPointer({
                    child: AlertDialog({
                        title: Column({
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                                Align({
                                    alignment: Alignment.topRight,
                                    child: IconButton({
                                        icon: Icon(Icons.close, {size: 25}),
                                        onPressed() {
                                            Navigator.of(context).pop()
                                        }
                                    })
                                }),
                                Center({
                                    child: Text('Sign in')
                                })
                            ]
                        }),
                        content: loginContent()
                    })
                })
            }
        })
    }
}
