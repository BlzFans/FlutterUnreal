--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
flutter = flutter or ({})
do
    local function loginContent()
        local rememberMe = false
        local maxWidth = 400
        local buttonColor = Color(4278824825)
        return StatefulBuilder({builder = function(context, setState)
            local listViewChildren = {
                Align({
                    alignment = Alignment.center,
                    child = Container({
                        constraints = BoxConstraints({maxWidth = maxWidth}),
                        child = TextField({
                            textInputAction = TextInputAction.next,
                            decoration = InputDecoration({
                                labelText = "Username",
                                border = OutlineInputBorder()
                            }),
                            onChanged = function(value)
                            end
                        })
                    })
                }),
                SizedBox({height = 12}),
                Align({
                    alignment = Alignment.center,
                    child = Container({
                        constraints = BoxConstraints({maxWidth = maxWidth}),
                        child = TextField({
                            decoration = InputDecoration({
                                labelText = "Password",
                                border = OutlineInputBorder()
                            }),
                            obscureText = true,
                            onChanged = function(value)
                            end
                        })
                    })
                }),
                Align({
                    alignment = Alignment.center,
                    child = Container({
                        constraints = BoxConstraints({maxWidth = maxWidth}),
                        padding = EdgeInsets.symmetric({vertical = 30}),
                        child = Row({children = {
                            Checkbox({
                                value = rememberMe,
                                onChanged = function(value)
                                    rememberMe = value
                                end,
                                activeColor = buttonColor
                            }),
                            SizedBox({width = 12}),
                            Text("Remember Me"),
                            Expanded({child = SizedBox.shrink()}),
                            TextButton({
                                style = TextButton.styleFrom({
                                    foregroundColor = Colors.black,
                                    backgroundColor = buttonColor,
                                    padding = EdgeInsets.symmetric({vertical = 10, horizontal = 24}),
                                    shape = RoundedRectangleBorder({borderRadius = BorderRadius.circular(12)})
                                }),
                                onPressed = function()
                                end,
                                child = Row({children = {
                                    Icon(Icons.lock),
                                    SizedBox({width = 6}),
                                    Text("Login")
                                }})
                            })
                        }})
                    })
                })
            }
            local widget
            widget = Align({
                alignment = Alignment.center,
                child = ListView({
                    shrinkWrap = true,
                    padding = EdgeInsets.symmetric({horizontal = 24}),
                    children = listViewChildren
                })
            })
            widget = Material({color = Colors.transparent, child = widget})
            widget = SizedBox({width = 400, height = 300, child = widget})
            return widget
        end})
    end
    function flutter.showLoginDialog(context)
        showDialog({
            context = context,
            barrierDismissible = false,
            builder = function(context)
                return AlertDialog({
                    title = Column({
                        crossAxisAlignment = CrossAxisAlignment.stretch,
                        children = {
                            Align({
                                alignment = Alignment.topRight,
                                child = IconButton({
                                    icon = Icon(Icons.close, {size = 25}),
                                    onPressed = function()
                                        Navigator.of(context):pop()
                                    end
                                })
                            }),
                            Center({child = Text("Sign in")})
                        }
                    }),
                    content = loginContent()
                })
            end
        })
    end
end
