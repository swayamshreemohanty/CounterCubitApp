import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0, isIncreament: false));

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

//Use to retrive stored data
  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

//Use to save data to storage
  @override
  Map<String, dynamic>? toJson(CounterState state) {
    // addError(Exception("Couldn't write to storage!"), StackTrace.current);
    return state.toMap();
  }
}
