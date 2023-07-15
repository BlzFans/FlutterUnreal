--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
flutter = flutter or ({})
do
    local position
    local alignment
    local function positionToAlignment(size, childSize, pos)
        local dx = pos.dx / (size.width - childSize.width)
        local dy = pos.dy / (size.height - childSize.height)
        dx = math.clamp(dx, 0, 1)
        dy = math.clamp(dy, 0, 1)
        return FractionalOffset(dx, dy)
    end
    local function aligmentToPosition(size, childSize, alignment)
        local dx = (size.width - childSize.width) * alignment.dx
        local dy = (size.height - childSize.height) * alignment.dy
        return Offset(dx, dy)
    end
    function flutter.MenuPage()
        return StatefulBuilder({builder = function(context, setState)
            local theme = Theme.of(context)
            local colorScheme = theme.colorScheme
            local widget
            widget = Column({
                mainAxisSize = MainAxisSize.min,
                children = {
                    SizedBox({height = 16}),
                    ConstrainedBox({
                        constraints = BoxConstraints({minWidth = double.infinity}),
                        child = TextButton({
                            onPressed = function()
                                gotoPage("/counter_example")
                            end,
                            child = Text("Counter Example")
                        })
                    }),
                    ConstrainedBox({
                        constraints = BoxConstraints({minWidth = double.infinity}),
                        child = TextButton({
                            onPressed = function()
                                flutter.showLoginDialog(context)
                            end,
                            child = Text("Login Dialog")
                        })
                    }),
                    ConstrainedBox({
                        constraints = BoxConstraints({minWidth = double.infinity}),
                        child = TextButton({
                            onPressed = function()
                                gotoPage("/next_gen_ui_demo")
                            end,
                            child = Text("Next Generation UI Demo")
                        })
                    })
                }
            })
            return widget
        end})
    end
end
