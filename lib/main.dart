import 'package:arado/screens/drawerscreens/aboutus.dart';
import 'package:arado/screens/drawerscreens/contauctus.dart';
import 'package:arado/screens/drawerscreens/profile.dart';
import 'package:arado/screens/drawerscreens/setting.dart';
import 'package:arado/screens/login.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

@override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Login(),
     routes: {
       'My Account' : (context) => Profile(),
       'Settings' : (context) => Setting(),
       'Contact Us' : (context) => ContactUs(),
       'About Us' : (context) => AboutUs(),
     },
   );
 }
}