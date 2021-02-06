import 'package:battleofmath/model/account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Account userId;

  final globalKey = GlobalKey<ScaffoldState>();
  //inputan
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController imageController;

  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    imageController = TextEditingController();

    nameController.text = '';
    emailController.text = '';
    passwordController.text = '';
    super.initState();
  }

  void alertsukses(BuildContext context) {
    AlertDialog alertDialog = new AlertDialog(
        title: Text("Registrasi"),
        content: Text("Berhasil!"),
        actions: [
          FlatButton(
            onPressed: () {
              setState(
                () {
                  Navigator.pop(context, false);
                },
              );
            },
            //Navigator.pop(context, false), // ini nanti diganti jadi Next Soal
            child: Text("Okey"),
          ),
        ]);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  Widget backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget entryField(String title, controller, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.lightBlue,
      ),
      child: InkWell(
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onTap: () {
          //print(nameController.text);
          //showAlertDialogCupertino('Please input your username or email');
          //  if (emailController.text == '') {
          //    showAlertDialogCupertino('Please input your username or email');
          //  } else {
          //
          userId = new Account(
              emailController.text,
              '',
              imageController.text,
              nameController.text,
              passwordController.text,
              '',
              0,
              '',
              nameController.text);
          FirebaseFirestore.instance.collection('account').add(userId.toJson());
          alertsukses(context);
          Navigator.pop(context);

          // } //end if
        },
      ),
    );
  }

  Widget loginAccountLabel() {
    return InkWell(
      onTap: () {
        //Navigator.push(
        //    context, MaterialPageRoute(builder: (context) => LoginPage()));
        Navigator.pushNamed(context, '/login');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xFF13E3D2),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/ColorLogo.png",
            fit: BoxFit.fitHeight,
            //width: 20,
            height: 65,
          ),
        ],
      ),
    );
  }

  Widget emailPasswordWidget() {
    return Column(
      children: <Widget>[
        entryField("Username", nameController),
        entryField("Email id", emailController),
        entryField("Password", passwordController, isPassword: true),
        entryField("Image Url", imageController),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              //child: BezierContainer(),
              child: Text('hallo'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    title(),
                    SizedBox(
                      height: 50,
                    ),
                    emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    submitButton(),
                    //SizedBox(height: height * .1),
                    loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: backButton()),
          ],
        ),
      ),
    );
  }

  //notification
  showAlertDialogCupertino(text) {
    showDialog(
      context: globalKey.currentContext,
      builder: (_) => CupertinoAlertDialog(
        title: Text('Info'),
        content: Text(text),
        actions: [
          CupertinoDialogAction(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(globalKey.currentContext);
              print('Clicked No!');
            },
          ),
          CupertinoDialogAction(
            child: Text('Yes'),
            onPressed: () {
              print('Clicked Yes!');
            },
          ),
        ],
      ),
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: false,
    );
  }
}
