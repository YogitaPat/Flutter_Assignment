
import 'package:flutter/material.dart';
import 'LogoutViewModel.dart';


class LogoutModel extends ChangeNotifier {
 LogoutViewModel? logoutResponse;

  // Logout
  Future<void> logoutData(String token) async {

    notifyListeners();
  }
}