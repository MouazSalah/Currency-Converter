import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

Future<bool> isInternetConnected() async {
  bool isConnected = await InternetConnectionChecker().hasConnection;
  return isConnected;
}

void checkInternetSpeed() async {
  final listener =
      InternetConnection().onStatusChange.listen((InternetStatus status) {
    switch (status) {
      case InternetStatus.connected:
        // The internet is now connected
        Fluttertoast.showToast(msg: "The internet is now connected");
        break;
      case InternetStatus.disconnected:
        // The internet is now disconnected
        Fluttertoast.showToast(msg: "Disconnected!");
        break;
    }
  });
}
