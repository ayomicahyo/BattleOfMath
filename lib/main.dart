import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'dashboard.dart';
//import 'soloTest.dart';
import 'Splash.dart';

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
      //home: GetJson(), // GANTI AJA PAKE CLASS YANG MAU DI PANGGIL GUYS
      home: SplashScreen(), // GANTI AJA PAKE CLASS YANG MAU DI PANGGIL GUYS
    );
  }
}
