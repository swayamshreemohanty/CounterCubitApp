import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

import 'package:counter_bloc_cubit/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  late StreamSubscription _connectivityStreamSubscription;
  final Connectivity connectivity;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    print("Internet Monitor Activated");
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return _connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen(
      (_connectivityResult) {
        if (_connectivityResult == ConnectivityResult.wifi) {
          emitInternetConnected(ConnectionType.wifi);
        } else if (_connectivityResult == ConnectivityResult.mobile) {
          emitInternetConnected(ConnectionType.mobile);
        } else if (_connectivityResult == ConnectivityResult.none) {
          emitInternetDisconnected();
        }
      },
    );
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(
        connectionType: _connectionType,
      ));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    _connectivityStreamSubscription.cancel();
    return super.close();
  }
}
