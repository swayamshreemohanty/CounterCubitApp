part of 'counter_cubit.dart';

class CounterState {
  bool isIncreament;
  int counterValue;
  CounterState({
    required this.isIncreament,
    required this.counterValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'isIncreament': isIncreament,
      'counterValue': counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      isIncreament: map['isIncreament'],
      counterValue: map['counterValue'],
    );
  }

//! Use-less
  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));

  @override
  String toString() => 'CounterState(isIncreament: $isIncreament, counterValue: $counterValue)';
}
