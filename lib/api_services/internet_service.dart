import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService{
  static InternetService? _instance;
  Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? subscription;

  factory InternetService.getInstance(){
    _instance ??= InternetService._();
    return _instance!;
  }
  InternetService._();

  Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult[0].name == ConnectivityResult.mobile.name) {
      return true;
    } else if (connectivityResult[0].name == ConnectivityResult.wifi.name) {
      return true;
    }
    return false;
  }
}