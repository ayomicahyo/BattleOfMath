import 'package:flutter/material.dart';
import 'login.dart';
import 'dart:async';
import 'LeaderBoard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    splashScreenAction();
  }

  splashScreenAction() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LeaderBoard(), //GANTI GANTI DISINI YA
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        "assets/images/ColorLogo.png",
        height: 200,
        width: 200,
        alignment: Alignment.center,
      ),
    ));
  }
}
