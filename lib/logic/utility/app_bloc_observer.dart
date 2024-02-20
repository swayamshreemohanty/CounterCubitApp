import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print(bloc);
    print(change);
    super.onChange(bloc, change);
  }

  // @override
  // void onClose(BlocBase bloc) {
  //   // TODO: implement onClose
  //   super.onClose(bloc);
  // }

  @override
  void onCreate(BlocBase bloc) {
    print(bloc);
    super.onCreate(bloc);
  }

  // @override
  // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  //   // TODO: implement onError
  //   super.onError(bloc, error, stackTrace);
  // }

  // @override
  // void onEvent(Bloc bloc, Object? event) {
  //   // TODO: implement onEvent
  //   super.onEvent(bloc, event);
  // }
}
