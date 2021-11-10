import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_bloc_cubit/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:counter_bloc_cubit/logic/cubit/counter_cubit.dart';
import 'package:counter_bloc_cubit/presentation/router/screen_route.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
    screenRouter: ScreenRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final ScreenRouter screenRouter;
  final Connectivity connectivity;
  const MyApp({
    Key? key,
    required this.screenRouter,
    required this.connectivity,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
            internetCubit: BlocProvider.of<InternetCubit>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: ScreenRouter().onGenerateRoute,
      ),
    );
  }
}
