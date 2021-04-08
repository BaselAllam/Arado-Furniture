import 'package:arado/screens/homepage.dart';
import 'package:arado/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';


class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {

String email;

checkData() async {
  SharedPreferences _user = await SharedPreferences.getInstance();
  setState(() {
    email = _user.getString('email');
  });
}

@override
void initState() {
  checkData();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: email == null ? Login() : HomePage(),
      title: Text('Welcome In Arado'),
      image: Image.asset('assets/logo.jpg'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.black
    );
  }
}