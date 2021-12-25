import 'package:flutter/material.dart';
import 'package:flutter_assignment/providers/auth.dart';
import 'package:flutter_assignment/screens/dashboard.dart';
import 'package:flutter_assignment/screens/loginscreen.dart';
import 'package:flutter_assignment/screens/mainscreen.dart';
import 'package:flutter_assignment/screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

var email;
var pass;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email');
  pass = prefs.getString('password');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: MaterialApp(
            title: 'Flutter Assignment',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: email == null
                ? Splash()
                : Dashboard(
                    localStorage: Email,
                    localStorage1: Pass,
                  ),
            routes: {
              //'/': (context) => LoginScreen(),
              '/login': (context) => LoginScreen(),
              '/dash': (context) => Dashboard(
                    localStorage: Email,
                    localStorage1: Pass,
                  ),
              '/mainscreen': (context) => MainScreen(),
            }));
  }
}


