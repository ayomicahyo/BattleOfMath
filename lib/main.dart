import 'package:battleofmath/Splash.dart';
import 'package:battleofmath/dashboard.dart';
import 'package:battleofmath/login.dart';
import 'package:battleofmath/soloTest.dart';
import 'package:battleofmath/MatchMaking.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/MatchMaking': (context) => MatchMaking(),
      },
      //home: GetJson(), // GANTI AJA PAKE CLASS YANG MAU DI PANGGIL GUYS
      //home: SplashScreen(), // GANTI AJA PAKE CLASS YANG MAU DI PANGGIL GUYS
      //home: Dashboard(), // GANTI AJA PAKE CLASS YANG MAU DI PANGGIL GUYS
    );
  }
}
