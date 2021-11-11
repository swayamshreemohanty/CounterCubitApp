part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class Increment extends CounterEvent {
  final String checkData;
  Increment({
    required this.checkData,
  });
}

class Decrement extends CounterEvent {}
