import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //BLoC listener is used to listening the state change in the cubit state section
      // body: BlocListener<CounterCubit, CounterState>(
      //   listener: (context, state) {
      //     if (state.isIncreament) {
      //       ScaffoldMessenger.of(context).hideCurrentSnackBar();
      //       //it is used to show the current snackbar message, by overwriting the previous snackbar message.
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(
      //           content: Text(
      //             "Counter Incremented",
      //           ),
      //           duration: Duration(milliseconds: 300),
      //         ),
      //       );
      //     } else {
      //       ScaffoldMessenger.of(context).hideCurrentSnackBar();
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(
      //           content: Text(
      //             "Counter Decremented",
      //           ),
      //           duration: Duration(milliseconds: 300),
      //         ),
      //       );
      //     }
      //   },
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         const Text(
      //           'You have pushed the button this many times:',
      //         ),
      //BLoC Builder is used to listening the state change in the cubit state section and rebuild the ui according to that.
      //         BlocBuilder<CounterCubit, CounterState>(
      //           builder: (context, state) {
      //             return Text(
      //               "${state.counterValue}",
      //               style: Theme.of(context).textTheme.headline4,
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            //BLoC consumer is used to combine the both BLoC builder and BLoC Listener in a single body
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.isIncreament) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  //it is used to show the current snackbar message, by overwriting the previous snackbar message.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Counter Incremented",
                      ),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Counter Decremented",
                      ),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  "${state.counterValue}",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
