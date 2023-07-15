
namespace flutter {
    export function CounterExample(): Widget {
        let _counter = 0
        return Builder({
            builder(context: BuildContext) {
                return Scaffold({
                    backgroundColor: Colors.transparent,
                    appBar: AppBar({backgroundColor: Colors.transparent}),
                    body: Center({
                        child: Column({
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                BlockPointer({
                                    child: Text(
                                        'You have pushed the button this many times:',
                                    )
                                }),
                                BlockPointer({
                                    child: Text(
                                        `${_counter}`,
                                        {style: Theme.of(context).textTheme.headlineMedium},
                                    )
                                }),
                            ],
                        }),
                    }),
                    floatingActionButton: BlockPointer({
                        child: Column({
                            mainAxisSize: MainAxisSize.min,
                            children:[
                            FloatingActionButton({
                                onPressed() {
                                    _counter++
                                    markNeedsBuild(context)
                                },
                                tooltip: 'Increment',
                                child: Icon(Icons.add),
                            }),
                            SizedBox({height: 10}),
                            FloatingActionButton({
                                onPressed() {
                                    _counter--
                                    markNeedsBuild(context)
                                },
                                tooltip: 'Decrement',
                                child: Icon(Icons.remove),
                                })
                            ]
                        })
                    })
                })
            }
        })
    }
}
