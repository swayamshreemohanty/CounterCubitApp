import 'package:bloc/bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, isIncreament: false)) {
    print("Counter Cubit Started");
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
