// import 'package:counter_bloc_cubit/constants/enums.dart';
// import 'package:counter_bloc_cubit/logic/cubit/counter_cubit.dart';
// import 'package:counter_bloc_cubit/logic/cubit/internet_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ThirdScreen extends StatefulWidget {
//   static const routeName = '/third_screen';
//   final color = Colors.green;
//   @override
//   State<ThirdScreen> createState() => _ThirdScreenState();
// }

// class _ThirdScreenState extends State<ThirdScreen> {
//   Text internetConnectionState(String _connectionType) {
//     return Text(
//       _connectionType,
//       style: const TextStyle(fontSize: 25),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: widget.color,
//         title: const Text(
//           "Third Screen",
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             BlocBuilder<InternetCubit, InternetState>(
//                 builder: (context, state) {
//               if (state is InternetConnected &&
//                   state.connectionType == ConnectionType.wifi) {
//                 return internetConnectionState("Wifi");
//               } else if (state is InternetConnected &&
//                   state.connectionType == ConnectionType.mobile) {
//                 return internetConnectionState("Mobile");
//               } else if (state is InternetDisconnected) {
//                 return internetConnectionState("Disconnected");
//               } else {
//                 return const CircularProgressIndicator();
//               }
//             }),
//             const SizedBox(height: 15),
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             const SizedBox(height: 30),

//             //BLoC consumer is used to combine the both BLoC builder and BLoC Listener in a single body
//             BlocConsumer<CounterCubit, CounterState>(
//               listener: (context, state) {
//                 if (state.isIncreament) {
//                   ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                   //it is used to show the current snackbar message, by overwriting the previous snackbar message.
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text(
//                         "Counter Incremented",
//                       ),
//                       duration: Duration(milliseconds: 300),
//                     ),
//                   );
//                 } else {
//                   ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text(
//                         "Counter Decremented",
//                       ),
//                       duration: Duration(milliseconds: 300),
//                     ),
//                   );
//                 }
//               },
//               builder: (context, state) {
//                 return Text(
//                   "${state.counterValue}",
//                   style: Theme.of(context).textTheme.headline4,
//                 );
//               },
//             ),
//             const SizedBox(height: 40),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 FloatingActionButton(
//                   backgroundColor: widget.color,
//                   heroTag: null,
//                   onPressed: () {
//                     BlocProvider.of<CounterCubit>(context).increment();
//                   },
//                   tooltip: 'Increment',
//                   child: const Icon(Icons.add),
//                 ),
//                 const SizedBox(width: 15),
//                 FloatingActionButton(
//                   backgroundColor: widget.color,
//                   heroTag: null,
//                   onPressed: () {
//                     BlocProvider.of<CounterCubit>(context).decrement();
//                   },
//                   tooltip: 'Decrement',
//                   child: const Icon(Icons.remove),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 50),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(primary: widget.color),
//                 child: const Text("First Button"),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
