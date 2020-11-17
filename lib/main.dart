import 'package:flutter/material.dart';
import 'soloTest.dart';

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
      home: Solotest(), // GANTI AJA PAKE CLASS YANG MAU DI PANGGIL GUYS
    );
  }
}
