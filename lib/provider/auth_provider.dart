import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  void userLogin({required String username, required String password, required Function callback}){
    if(username == "esssumon@gmail.com" && password == "esssumon@gmail.com"){
      callback(true);
    }else{
      callback(false);
    }
  }
}