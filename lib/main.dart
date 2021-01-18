import 'package:battleofmath/Splash.dart';
import 'package:battleofmath/dashboard.dart';
import 'package:battleofmath/login.dart';
import 'package:battleofmath/soloTest.dart';
import 'package:flutter/material.dart';
//import 'dashboard.dart';
//import 'soloTest.dart';
//import 'Splash.dart';
//import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove mode dubug
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/dashboard': (context) => Dashboard(),
        '/GetJson': (context) => GetJson(true),
      },
      //home: GetJson(), // GANTI AJA PAKE CLASS YANG MAU DI PANGGIL GUYS
      //home: SplashScreen(), // GANTI AJA PAKE CLASS YANG MAU DI PANGGIL GUYS
      //home: Dashboard(), // GANTI AJA PAKE CLASS YANG MAU DI PANGGIL GUYS
    );
  }
}
