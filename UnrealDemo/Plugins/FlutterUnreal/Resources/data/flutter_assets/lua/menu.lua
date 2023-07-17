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
            local media = MediaQuery.of(context)
            local size = Size(250, 300)
            if position == nil then
                position = aligmentToPosition(media.size, size, FractionalOffset.center)
            end
            widget = Container({
                width = size.width,
                height = size.height,
                padding = EdgeInsets.only({left = 5, right = 5, top = 5, bottom = 5}),
                decoration = BoxDecoration({
                    borderRadius = BorderRadius.circular(12),
                    color = colorScheme.background:withOpacity(0.3)
                }),
                child = widget
            })
            widget = BlockPointer({child = widget})
            local useAlignment = true
            if useAlignment then
                if alignment == nil then
                    alignment = positionToAlignment(media.size, size, position)
                end
                widget = Align({
                    alignment = alignment,
                    child = GestureDetector({
                        onPanUpdate = function(e)
                            local pos = aligmentToPosition(media.size, size, alignment)
                            pos = Offset(pos.dx + e.delta.dx, pos.dy + e.delta.dy)
                            alignment = positionToAlignment(media.size, size, pos)
                            setState()
                        end,
                        child = widget
                    })
                })
            else
                widget = Stack({children = {Positioned({
                    left = position.dx,
                    top = position.dy,
                    child = GestureDetector({
                        onPanUpdate = function(e)
                            position = Offset(position.dx + e.delta.dx, position.dy + e.delta.dy)
                            setState()
                        end,
                        child = widget
                    })
                })}})
            end
            return widget
        end})
    end
end
