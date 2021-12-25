
import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/loginscreen.dart';



class AuthProvider with ChangeNotifier {
  loginSave(String email,String password) async {
    await LoginScreen.init();
    localStorage!.setString('email', email);
    localStorage!.setString('password',password);
  }

}