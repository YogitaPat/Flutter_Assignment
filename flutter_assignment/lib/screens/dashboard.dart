import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'mainscreen.dart';

var Email;
var Pass;

class Dashboard extends StatefulWidget {
  SharedPreferences? localStorage;
  SharedPreferences? localStorage1;

  Dashboard({
    required this.localStorage,
    required this.localStorage1,
  });

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    pass = prefs.getString('password');
  }

  @override
  void initState() {

    setState(() {
      getData();

    });
    //var Email =this.widget.localStorage!.get('email');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Screen'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Image.asset('assets/images/logout_icon.png',height: 50),
            tooltip: 'Logout',
            onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            // await prefs.remove('email');
            // await prefs.remove('password');
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/naturedash.png"))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('In nature, nothing is perfect and everything is perfect. ...',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                ),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            ),
            SizedBox(
              height: 50,
            ),
           Container(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            width: double.infinity,
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15, right: 15),
                                    width: double.infinity,
                                    color: Colors.transparent,
                                    child: Text(
                                      'Login Details :',
                                      textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 15, right: 15),
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: Text(
                                          'Email : ${email.toString()}')),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 15, right: 15),
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: Text(
                                          'Password : ${pass.toString()}')),
                                  // if (localStorage != null)
                                  //   Padding(
                                  //     padding: const EdgeInsets.all(15.0),
                                  //     child: Text("User Logged in!!! ->  Email Id: ${localStorage!.get('email')}  Password: ${localStorage!.get('password')}",style: TextStyle(fontSize: 20),),
                                  //   ),
                                ])),
                      ],
                    )
                  ],
                )
              // padding: const EdgeInsets.all(10.0),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 30,
              width: 180,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MainScreen()));
                },
                child: Text(
                  'Goto Main Screen',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
