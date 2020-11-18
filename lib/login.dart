import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent, shape: BoxShape.rectangle),
                    child: Center()),
                Text(
                  "Battle of Math",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
                TextFormField(
                  initialValue: 'Username',
                  decoration: InputDecoration(
                      labelText: 'Username',
                      errorText: 'Error',
                      border: OutlineInputBorder()),
                ),
                TextFormField(
                  initialValue: 'Password',
                  decoration: InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                ),
                OutlineButton(
                  textColor: Colors.white,
                  highlightedBorderColor: Colors.blue.withOpacity(0.15),
                ),
                Text('Belum punya akun? DAFTAR'),
              ],
            )));
  }
}
