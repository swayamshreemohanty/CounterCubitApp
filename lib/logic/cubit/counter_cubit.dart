import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_bloc_cubit/constants/enums.dart';

import 'package:counter_bloc_cubit/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0, isIncreament: false)) {
    print("Counter Cubit Started");
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription =
        internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.wifi) {
        increment();
      } else {
        if (internetState is InternetConnected &&
            internetState.connectionType == ConnectionType.mobile) {
          decrement();
        }
      }
    });
  }

  void increment() {
    emit(
      CounterState(
        counterValue: state.counterValue + 1,
        isIncreament: true,
      ),
    );
  }

  void decrement() {
    if (state.counterValue > 0) {
      emit(
        CounterState(
          counterValue: state.counterValue - 1,
          isIncreament: false,
        ),
      );
    }
  }
}
