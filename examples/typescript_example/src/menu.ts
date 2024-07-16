namespace flutter {
    let position: Offset
    let alignment: FractionalOffset

    function positionToAlignment(size: Size, childSize: Size, pos: Offset): FractionalOffset {
        let dx = (pos.dx / (size.width - childSize.width))
        let dy = (pos.dy / (size.height - childSize.height))
        dx = math.clamp(dx, 0, 1)
        dy = math.clamp(dy, 0, 1)
    
        return FractionalOffset(dx, dy)
    }
    
    function aligmentToPosition(size: Size, childSize: Size, alignment: FractionalOffset): Offset {
        let dx = (size.width - childSize.width) * alignment.dx
        let dy = (size.height - childSize.height) * alignment.dy
    
        return Offset(dx, dy)
    }

    export function MenuPage(): Widget {
        return StatefulBuilder({
            builder(context, setState) {
                return LayoutBuilder({ 
                    builder(context, constraints) {
                        let theme = Theme.of(context)
                        let colorScheme = theme.colorScheme
                        let widget: Widget

                        widget = Column({
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                SizedBox({height: 16}),
                                ConstrainedBox({
                                constraints: BoxConstraints({minWidth: double.infinity}),
                                    child: TextButton({
                                        onPressed () {
                                            gotoPage("/counter_example")
                                        },
                                        child: Text("Counter Example")
                                    })
                                }),
                                ConstrainedBox({
                                    constraints: BoxConstraints({minWidth: double.infinity}),
                                    child: TextButton({
                                        onPressed() {
                                            showLoginDialog(context);
                                        },
                                        child: Text("Login Dialog")
                                    })
                                }),
                                ConstrainedBox({
                                    constraints: BoxConstraints({minWidth: double.infinity}),
                                    child: TextButton({
                                        onPressed() {
                                            gotoPage("/next_gen_ui_demo");
                                        },
                                        child: Text("Next Generation UI Demo")
                                    })
                                }),
                            ]
                        })

                        let parentSize = Size(constraints.maxWidth, constraints.maxHeight)
                        let size = Size(250, 300)
                        position ??= aligmentToPosition(parentSize, size, FractionalOffset.center)

                        widget = Container({
                            width: size.width,
                            height: size.height,
                            padding: EdgeInsets.only({left: 5, right: 5, top: 5, bottom: 5}),
                            decoration: BoxDecoration({
                                borderRadius: BorderRadius.circular(12),
                                color: colorScheme.background.withOpacity(0.3),
                            }),
                            child: widget
                        })
                
                        widget = BlockPointer({child: widget});
                
                        let useAlignment = true;
                        if (useAlignment) {
                            alignment ??= positionToAlignment(parentSize, size, position!);
                            widget = Align({
                                alignment: alignment,
                                child: GestureDetector({
                                    onPanUpdate(e: DragUpdateDetails) {
                                        let pos = aligmentToPosition(parentSize, size, alignment)
                                        pos = Offset(pos.dx + e.delta.dx, pos.dy + e.delta.dy)
                                        alignment = positionToAlignment(parentSize, size, pos)
                        
                                        setState()
                                    },
                                    child: widget
                                })
                            })
                        } else {
                        widget = Stack ({
                                children:[
                                    Positioned({
                                        left: position.dx,
                                        top: position.dy,
                                        child: GestureDetector({
                                            onPanUpdate(e: DragUpdateDetails) {
                                                position = Offset(position.dx + e.delta.dx, position.dy + e.delta.dy)
                                                setState()
                                            },
                                            child: widget
                                        })
                                    })
                                ]
                            })
                        }

                        return widget
                    }
                })
            }
        })
    }
}
