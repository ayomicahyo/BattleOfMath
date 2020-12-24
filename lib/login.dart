import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'main.dart';

void main() => runApp(MyApp());

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email, password;

  //tambah form input
  final _formKey = GlobalKey<FormState>();

  //tampilkan alert jika input salah
  void _alertinputansalah() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
          height: 100,
          child: new Center(
            child: new Text("Inputan anda salah"),
          )),
    );
    showDialog(context: context, child: alertDialog);
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
                  child: Image.asset(
                "images/logo.png",
                //width: 100,
                alignment: Alignment.center,
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
                              if (!value.contains('@')) {
                                //jika email mengandung karakter @ maka tampilkan
                                return 'return some text';
                              }
                              return null;
                            },
                            //initialValue: 'email',
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
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'enter your password';
                                }
                                return null;
                              },
                              maxLength: 8,
                              maxLengthEnforced: true,
                              controller: passwordController,
                              //initialValue: 'password',
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: "enter password",
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder()))),
                      RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if (email == "admin@gmail.com") {
                            } else if (password == "admin") {
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()));
                            } else {
                              //menampilkan alert jika input salah
                              _alertinputansalah();
                            }
                          }
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Lupa password',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('atau masuk dengan'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: Image.asset('images/google.png'),
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: Image.asset('images/facebook.png'),
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 150, bottom: 0),
                        child: Text(
                          'Belum punya akun? Daftar sekarang',
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
