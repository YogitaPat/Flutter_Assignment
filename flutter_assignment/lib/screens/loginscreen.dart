import 'package:flutter_assignment/common/Error_Dailog.dart';
import 'package:flutter_assignment/common/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_assignment/providers/auth.dart';
import 'package:provider/provider.dart';

import 'dashboard.dart';

var authProvider;
SharedPreferences? localStorage;

TextEditingController emailController = new TextEditingController();
TextEditingController pwdController = new TextEditingController();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();

  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    void _togglePassword() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    authProvider = Provider.of<AuthProvider>(context, listen: false);
    var postDataLogin = () async {
      String email = emailController.text;
      String password = pwdController.text;

      if (emailController.text.trim().length == 0) {
        Fluttertoast.showToast(
            msg: "Email address is Required",
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.red,
            backgroundColor: Colors.black54,
            gravity: ToastGravity.CENTER // also possible "TOP" and "CENTER"
            );
      } else if (!Utils.isEmail(emailController.text)) {
        Fluttertoast.showToast(
            msg: "Please Enter valid email address",
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.red,
            backgroundColor: Colors.black54,
            gravity: ToastGravity.CENTER // also possible "TOP" and "CENTER"
            );
      } else if (pwdController.text.trim().length == 0) {
        Fluttertoast.showToast(
            msg: "Password is Required",
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.red,
            backgroundColor: Colors.black54,
            gravity: ToastGravity.CENTER // also possible "TOP" and "CENTER"
            );
      } else if (await Utils.checkInternetConnectivity()) {
       // final ProgressDialog pr = ProgressDialog(context);
       // pr.show();
        await auth.loginSave(email, password).then((response) async {
         // pr.hide();

          if (Email == null) {
            Navigator.pushNamed(
              context,
              '/dash',
              arguments: Dashboard(
                localStorage1: Email,
                localStorage: Pass,
              ),
            );

          } else {

            Flushbar(
              title: "Sorry..Login Failed!!",
              backgroundColor: Colors.red,
              message: "Invalid Credentials",
              duration: Duration(seconds: 4),
            ).show(context);
          }
        });
      } else {
        showDialog<dynamic>(
            context: context,
            builder: (BuildContext context) {
              return ErrorDialog(
                  message: "Please check your internet connection !");
            });
      }
    };

    return Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/back_Img.png"),
                fit: BoxFit.cover,
              ),
            ),
            // alignment: Alignment.center,
            constraints: BoxConstraints.expand(),
            child: SingleChildScrollView(
                child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 140.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/companyLogo.png",
                              height: 50,
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'johnwick@gmail.com'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        obscureText: _obscureText,
                        controller: pwdController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: _obscureText
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                _togglePassword();
                              },
                            ),
                            // border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter secure password'),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: 290,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: MaterialButton(
                      onPressed: () {
                        // Navigator.pushReplacementNamed(context, '/dashboard');
                        postDataLogin();
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),

                ],
              ),
            )))
      ],
    ));
  }
}
