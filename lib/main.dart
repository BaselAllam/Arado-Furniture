import 'package:arado/models/mainmodel.dart';
import 'package:arado/screens/drawerscreens/aboutus.dart';
import 'package:arado/screens/drawerscreens/contauctus.dart';
import 'package:arado/screens/drawerscreens/profile.dart';
import 'package:arado/screens/drawerscreens/setting.dart';
import 'package:arado/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

@override
 Widget build(BuildContext context) {
   return ScopedModel(
     model: MainModel(), 
     child: MaterialApp(
       debugShowCheckedModeBanner: false,
       home: SplashScreens(),
       routes: {
         'My Account' : (context) => Profile(),
         'Add Product' : (context) => Setting(),
         'Contact Us' : (context) => ContactUs(),
         'About Us' : (context) => AboutUs(),
       },
     ),
   );
 }
}