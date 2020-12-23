import 'package:flutter/material.dart';
import 'dart:async';

class Solotest extends StatefulWidget {
  @override
  _SolotestState createState() => _SolotestState();
}

class _SolotestState extends State<Solotest> {
  int timer = 60;
  int nomorSoal = 1;
  String updateTime = "60";
  bool timerOn = true;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  showDoneAlertDialog(BuildContext context) {
    AlertDialog doneActionAlert = AlertDialog(
      title: Text("selesai"),
      content: Text("Lihat Hasil"),
      actions: [
        FlatButton(
          onPressed: () {},
          child: Text("Calculation"),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return doneActionAlert;
      },
    );
  }

  showNextActionAlertDialog(BuildContext context) {
    AlertDialog nextActionAlert = AlertDialog(
      title: Text("selesai"),
      content: Text("Lanjut Soal Selanjutnya"),
      actions: [
        FlatButton(
          onPressed: () {
            setState(
              () {
                nomorSoal += 1;
                timer = 60; // ini tergantung waktu soal di JSON ya
                timerOn = true;
                Navigator.pop(context, false);
              },
            );
          },
          //Navigator.pop(context, false), // ini nanti diganti jadi Next Soal
          child: Text("Lanjut"),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return nextActionAlert;
      },
    );
  }

  void startTimer() async {
    const onesec = Duration(seconds: 1);
    if (timerOn == true) {
      Timer.periodic(onesec, (Timer t) {
        setState(() {
          if (timer == 1 && nomorSoal != 10) {
            timerOn = false;
            timer -= 1;
            showNextActionAlertDialog(context);
          } else if (timer == 0) {
            timerOn = false;
            //TimeStop Didnt do anything
          } else {
            timer -= 1;
          }

          updateTime = timer.toString();
        });
      });
    }
  }

  Widget choiceButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: MaterialButton(
        onPressed: () {
          if (nomorSoal == 10) {
            showDoneAlertDialog(context);
          } else {
            showNextActionAlertDialog(context);
          }
        },
        child: Text(
          "Option 1",
          style: TextStyle(fontFamily: "Quando", fontSize: 16),
        ),
        splashColor: Colors.lightBlueAccent,
        color: Colors.lightBlue,
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Soal : " + nomorSoal.toString() + "/10",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text("Your Score : 0"),
                    Text("Opponent Score 0"),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  updateTime, // Timer,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      height: 1,
                      fontSize: 30),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sample Soal...",
                  style: TextStyle(fontSize: 18, fontFamily: "Quando"),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choiceButton(),
                    choiceButton(),
                    choiceButton(),
                    choiceButton(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
