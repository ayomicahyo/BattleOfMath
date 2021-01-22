import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

//class DignInResult
/*class SignInResult{
  final FirebaseUser user;
  final String message;
    //tampilkan
    SignInResult({this.user, this.message});
}*/

class _LoginState extends State<Login> {
  //handel perubahan text
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email, password;

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
/*
  //class buat daftar email/pass
  static FirebaseAuth _auth = FirebaseAuth.instance;
  //method login
  static Future<SignInResult> signInWithEmail(
      {String email, String password}) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return SignInResult(user: result.user);
    } catch (e) {
      return SignInResult(message: e.toString());
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          Container(
              color: Colors.white,
              child: Column(children: <Widget>[
                Center(
                    child: Image.asset(
                  "assets/images/ColorLogo.png",
                  height: 200,
                  width: 200,
                  alignment: Alignment.center,
                )),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 20, left: 20, right: 20),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.all(10),
                            child: TextFormField(
                              //menyambungkan
                              controller: emailController,
                              validator: (String value) {
                                if (!email.contains('@')) {
                                  //jika email mengandung karakter @ maka tampilkan
                                  return 'email tidak valid';
                                }
                                return null;
                              },
                              //initialValue: 'email',
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
                                maxLength: 5,
                                //maxLengthEnforced: true,
                                controller: passwordController,
                                //initialValue: 'password',
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: "enter password",
                                    prefixIcon: Icon(Icons.lock),
                                    border: OutlineInputBorder()))),
                        RaisedButton(
                            onPressed: () async {
                              //SignInResult result = await AuthServices.createUser(
                              email = emailController.text;
                              password = passwordController.text;

                              /*FirebaseFirestore.instance
                                .collection('account')
                                .add({
                              'id': '16',
                              'username': 'admin@email.com',
                              'password': 'admin'
                            });*/

                              if (email == "admin@gmail.com" &&
                                  password == "admin") {
                                //PERUBAHAN SEMENTARA
                                return Navigator.pushReplacementNamed(
                                    context, '/dashboard');
                                // return Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Dashboard()));
                              } else {
                                //menampilkan alert jika input salah
                                _alertinputansalah();
                              }
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Lupa password?',
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
                              margin: EdgeInsets.only(top: 20, right: 20),
                              child: FloatingActionButton(
                                heroTag: "btnGoogle",
                                child: Image.asset(
                                  'assets/images/google.png',
                                  width: 50,
                                  height: 50,
                                ),
                                onPressed: () {},
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 20),
                              child: FloatingActionButton(
                                heroTag: "buttonFacebook",
                                child: Image.asset(
                                  'assets/images/facebook.png',
                                  width: 50,
                                  height: 50,
                                ),
                                onPressed: () {},
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 0),
                          child: Text(
                            'Belum punya akun? Daftar sekarang',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]))
        ],
      ),
    );
  }
}
