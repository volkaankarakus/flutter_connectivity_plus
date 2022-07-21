import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

typedef NetworkCallback = void Function(NetworkResults result);

enum NetworkResults {
  on,
  off;

  static NetworkResults checkConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
        return NetworkResults.on;

      case ConnectivityResult.none:
        return NetworkResults.off;
    }
  }
}

abstract class INetworkChangeManager {
  // When the application opens, it checks the internet
  Future<NetworkResults> checkNetworkFirst();

  // Let's write a callback that will let you know if it's on or off
  // When this function listens, we will be able to send property to its onChange.
  void handleNetworkChange(NetworkCallback onChange);

  // After listen, we should dispose.
  void dispose();
}

class NetworkChangeManager extends INetworkChangeManager {
  late final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _subscription;
  NetworkChangeManager() {
    _connectivity = Connectivity();
  }

  @override
  Future<NetworkResults> checkNetworkFirst() async {
    final connectivityResult = await (_connectivity.checkConnectivity());
    return NetworkResults.checkConnectivityResult(connectivityResult);
  }

  @override
  void handleNetworkChange(NetworkCallback onChange) {
    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      onChange.call(NetworkResults.checkConnectivityResult(event));
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}
