import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minions/test/views/counter/bloc/counter_bloc.dart';
import 'package:minions/test/views/counter/cubit/counter2_cubit.dart';
import 'package:provider/provider.dart';

import '../../router/index.dart';
import '../model/counter.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("加减法"),),
      body: Column(
        children: <Widget>[
          BlocProvider(
            create: (context) => CounterBloc(value: int.tryParse(AppRouterHelper.currentRouterState.extra.toString())??0),
            child:BlocBuilder<CounterBloc,CounterState>(builder: (cx,state)=> Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${state.value}"),
                Row(
                  children: [
                    TextButton(onPressed: (){
                      BlocProvider.of<CounterBloc>(cx).add(CounterIncrementEvent());
                      // cx.read<CounterBloc>().add(CounterIncrementEvent());
                    },
                        child: Text('+')),
                    TextButton(onPressed: ()=>BlocProvider.of<CounterBloc>(cx).add(CounterSubductionEvent()),
                        child: Text("-")),
                  ],
                ),
              ],
            ),),
          ),
          BlocProvider(create: (cx)=>Counter2Cubit(),
            child: BlocBuilder<Counter2Cubit,Counter2State>(builder: (cx,state){
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${state.value}'),
                  Row(
                    children: [
                      TextButton(onPressed: cx.read<Counter2Cubit>().increment, child: Text("+")),
                      TextButton(onPressed: cx.read<Counter2Cubit>().subduction, child: Text("-")),
                    ],
                  )
                ],
              );
            }),
          ),

          ChangeNotifierProvider(
            create: (cx)=>Counter(),
            child: Consumer<Counter>(
              builder: (_, counter, __) => TextButton(onPressed: counter.increment, child: Text('${counter.count}'),),
            ),
          ),

    ],
      ),
    );
  }
}


class CounterProvider extends InheritedWidget {
  final int counter;
  final Function() increment;

  const CounterProvider({
    super.key,
    required this.counter,
    required this.increment,
    required super.child,
  });

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>()!;
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return oldWidget.counter != counter; // 判断是否需要刷新
  }
}

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counter: _counter,
      increment: _increment,
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: CounterText(),
          ),
          floatingActionButton: Builder(
            builder: (context) {
              return FloatingActionButton(
                onPressed: CounterProvider.of(context).increment,
                child: Icon(Icons.add),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = CounterProvider.of(context).counter;
    return Text('Counter: $counter');
  }
}

// class CounterProvider extends InheritedWidget {
//   final int counter;
//   final Function() increment;
//
//   const CounterProvider({
//     super.key,
//     required this.counter,
//     required this.increment,
//     required super.child,
//   });
//
//   static CounterProvider of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<CounterProvider>()!;
//   }
//
//   @override
//   bool updateShouldNotify(CounterProvider oldWidget) {
//     return oldWidget.counter != counter;
//   }
// }
//
// class TestPage extends StatefulWidget {
//   const TestPage({super.key});
//
//   @override
//   State<TestPage> createState() => _TestPageState();
// }
//
// class _TestPageState extends State<TestPage> {
//   int _counter = 0;
//
//   void _increment() => setState(() => _counter++);
//
//   @override
//   Widget build(BuildContext context) {
//     return CounterProvider(counter: _counter, increment: _increment, child: Scaffold(
//       body: Column(
//         children: [
//           Center(
//             child: CounterText(),
//           ),
//           TextButton(onPressed:  CounterProvider.of(context).increment, child: Text("add"))
//         ],
//       ),
//     ));
//   }
// }
//
//
// class CounterText extends StatelessWidget {
//   const CounterText({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final counter = CounterProvider.of(context).counter;
//     return Text('Counter: $counter');
//   }
// }
