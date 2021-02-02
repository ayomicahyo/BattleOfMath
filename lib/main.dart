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
    CollectionReference users = FirebaseFirestore.instance.collection('room');
    return FutureBuilder<DocumentSnapshot>(
        // Initialize FlutterFire:
        future: users.doc("zXlEpgyxeBPyQQIh4UFs").get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Loading.."),
              ),
            );
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            return MaterialApp(
                //remove mode dubug
                debugShowCheckedModeBanner: false,
                routes: {
                  '/': (context) => SplashScreen(),
                  '/login': (context) => Login(),
                  '/dashboard': (context) => Dashboard(),
                  '/GetJsonTrue': (context) =>
                      GetJson(true, "Cahyo", "Widiya", "Widiya"),
                  '/GetJsonFalse': (context) =>
                      GetJson(false, "Player1", "anjay", "Cahyo"),
                  '/MatchMaking': (context) => MatchMaking(),
                });
          }
          return Scaffold(
            body: Center(
              child: Text("Loading.."),
            ),
          );
        });
  }
}
