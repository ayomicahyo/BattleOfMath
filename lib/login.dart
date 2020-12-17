import 'package:flutter/material.dart';
import 'soloTest.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    startSolotest();
  }

  startSolotest() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return Solotest();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Column(children: <Widget>[
              Center(
                  child: Text(
                "Battle of Math",
                style: TextStyle(
                  color: Colors.blueAccent,
                  height: 10,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              )),
              Padding(
                padding: const EdgeInsets.only(
                    top: 100, bottom: 20, left: 20, right: 20),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'return some text';
                              }
                              return null;
                            },
                            initialValue: 'email',
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'email@example.com',
                                prefixIcon: Icon(Icons.message),
                                border: OutlineInputBorder()),
                          )),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                              initialValue: 'password',
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: "enter password",
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder()))),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Solotest()));
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 150, bottom: 0),
                        child: Text(
                          'Not have account? Register',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}
