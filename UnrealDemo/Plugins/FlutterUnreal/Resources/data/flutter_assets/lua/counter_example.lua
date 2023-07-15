--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
flutter = flutter or ({})
do
    function flutter.CounterExample()
        local _counter = 0
        return Builder({builder = function(context)
            return Scaffold({
                backgroundColor = Colors.transparent,
                appBar = AppBar({backgroundColor = Colors.transparent}),
                body = Center({child = Column({
                    mainAxisAlignment = MainAxisAlignment.center,
                    children = {
                        BlockPointer({child = Text("You have pushed the button this many times:")}),
                        BlockPointer({child = Text(
                            tostring(_counter),
                            {style = Theme.of(context).textTheme.headlineMedium}
                        )})
                    }
                })}),
                floatingActionButton = BlockPointer({child = Column({
                    mainAxisSize = MainAxisSize.min,
                    children = {
                        FloatingActionButton({
                            onPressed = function()
                                _counter = _counter + 1
                                markNeedsBuild(context)
                            end,
                            tooltip = "Increment",
                            child = Icon(Icons.add)
                        }),
                        SizedBox({height = 10}),
                        FloatingActionButton({
                            onPressed = function()
                                _counter = _counter - 1
                                markNeedsBuild(context)
                            end,
                            tooltip = "Decrement",
                            child = Icon(Icons.remove)
                        })
                    }
                })})
            })
        end})
    end
end
