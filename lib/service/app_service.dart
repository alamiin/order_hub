import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppService{
  static Future<bool> checkInternet() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;
    return hasInternet;
  }
}