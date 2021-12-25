

import 'package:flutter_assignment/models/Logout/LogoutResponse.dart';

class LogoutViewModel {

   late final LogoutResponse logoutResponse;

   LogoutViewModel({required this.logoutResponse});


  String? get message {
    return this.logoutResponse.message;
  }
  String? get status {
    return this.logoutResponse.status;
  }

   }

