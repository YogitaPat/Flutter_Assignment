
import 'package:connectivity/connectivity.dart';


class Utils {
  Utils._();

  static bool isEmail(String em) {

   //String p = r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$';
   Pattern p =
       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

   //String p = r'([a-z0-9][-a-z0-9_+.][a-z0-9])@([a-z0-9][-a-z0-9.][a-z0-9].(com|net)|([0-9]{1,3}.{3}[0-9]{1,3}))';
   var regExp = new RegExp(p.toString());

    return regExp.hasMatch(em);
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) return 'Email is required.';
    final RegExp nameExp = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!nameExp.hasMatch(value)) return 'Invalid email address';
    return null;
  }

  static String? valdiatePassword(String value) {
    if (value.trim().isEmpty) return "Enter password";
    if (value.trim().length < 6)
      return "Password should be greater then 6 character.";
    return null;
  }

  static String? validateFullName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  static String? validateOTP(String value) {
    if (value.isEmpty) return 'OTP is required.';
    if (value.length != 6) return 'OTP has to be 6 digits';
    return null;
  }

  static Future<bool> checkInternetConnectivity() async {
    final ConnectivityResult connectivityResult =
    await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      // print('Mobile');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // print('Wifi');
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      print('No Connection');
      return false;
    } else {
      return false;
    }
  }

}


String? _validateName(String value) {
  // _formWasEdited = true;
  if (value.isEmpty) return 'Name is required.';
  final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
  if (!nameExp.hasMatch(value))
    return 'Please enter only alphabetical characters.';
  return null;
}


