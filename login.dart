import 'package:battleofmath/model/account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dashboard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //handel perubahan text
  Account userId;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email, password;
  bool loginDone = false;
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
    CollectionReference users =
        FirebaseFirestore.instance.collection('account');

    return Scaffold(
        body: StreamBuilder(
            stream: users.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

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

                                        for (int i = 0;
                                            i < snapshot.data.docs.length;
                                            i++) {
                                          if (email ==
                                                  snapshot.data.docs[i]
                                                      ['email'] &&
                                              password ==
                                                  snapshot.data.docs[i]
                                                      ['password']) {
                                            userId = new Account(
                                                snapshot.data.docs[i]['email'],
                                                snapshot.data.docs[i]['id'],
                                                snapshot.data.docs[i]['image'],
                                                snapshot.data.docs[i]['name'],
                                                snapshot.data.docs[i]
                                                    ['password'],
                                                snapshot.data.docs[i]['power'],
                                                snapshot.data.docs[i]
                                                    ['startcont'],
                                                snapshot.data.docs[i]['status'],
                                                snapshot.data.docs[i]
                                                    ['username']);
                                            loginDone = true;
                                            break;
                                          }
                                        }

                                        if (loginDone) {
                                          //PERUBAHAN SEMENTARA
                                          return Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Dashboard(userId)));
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
                                        margin:
                                            EdgeInsets.only(top: 20, right: 20),
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
                                        margin:
                                            EdgeInsets.only(top: 20, left: 20),
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
                                    padding: const EdgeInsets.only(
                                        top: 30, bottom: 1),
                                    child: InkWell(
                                      child: Text(
                                        'Belum punya akun? Daftar sekarang',
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/register');
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, bottom: 0),
                                    child: Text(
                                      snapshot.data.docs[1]['email'] +
                                          " " +
                                          snapshot.data.docs[1]['password'],
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
            }));
  }
}

/*return FutureBuilder<DocumentSnapshot>(
        // Initialize FlutterFire:
        future: users.doc(userId).get(),
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

                                      if (email == data['email'] &&
                                          password == data['password']) {
                                        //PERUBAHAN SEMENTARA
                                        return Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Dashboard(userId)));
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
                                      margin:
                                          EdgeInsets.only(top: 20, right: 20),
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
                                      margin:
                                          EdgeInsets.only(top: 20, left: 20),
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
                                  padding:
                                      const EdgeInsets.only(top: 50, bottom: 0),
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
          return Scaffold(
            body: Center(
              child: Text("Loading.."),
            ),
          );
        });
  }
}*/
