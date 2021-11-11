import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import './counter_state.dart';
part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> with HydratedMixin {
  CounterBloc() : super(CounterState(counterValue: 0, isIncreament: false)) {
    on<CounterEvent>((event, emit) {
      if (event is Increment) {
        emit(
          CounterState(
            counterValue: state.counterValue + 1,
            isIncreament: true,
          ),
        );
      } else {
        emit(
          CounterState(
            counterValue: state.counterValue - 1,
            isIncreament: false,
          ),
        );
      }
    });
  }
  //Use to retrive stored data
  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

//Use to save data to storage
  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
