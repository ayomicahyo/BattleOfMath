import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'RankPages.dart';

class GetJson extends StatelessWidget {
  bool soloTest = false;
  String player1Name = "Player1";
  String player2name = "Player2";

  GetJson(bool _soloTest) {
    this.soloTest = _soloTest;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString("assets/sampleQuestion.json"),
        builder: (context, snapshot) {
          List myData = json.decode(snapshot.data.toString());
          if (myData == null) {
            return Scaffold(
              body: Center(
                child: Text("Loading.."),
              ),
            );
          } else {
            return (soloTest == true)
                ? Solotest(myData: myData)
                : RankPages(myData: myData);
          }
        });
  }
}

class Solotest extends StatefulWidget {
  var myData;
  String player1Name;
  String player2Name;
  Solotest({Key key, @required this.myData}) : super(key: key);
  @override
  _SolotestState createState() =>
      _SolotestState(myData, player1Name, player2Name);
}

class _SolotestState extends State<Solotest> {
  var myData;
  String player1Name;
  String player2Name;
  _SolotestState(this.myData, this.player1Name, this.player2Name);

  int timer = 60;
  int nomorSoal = 1;
  String updateTime = "60";
  bool timerOn = true;
  List<String> buttonAnswerStatus = ["normal", "normal", "normal", "normal"];
  List<bool> buttonStatus = [true, true, true, true];
  int jumlahBenar = 0;
  int jumlahSalah = 0;
  String jawaban;

  @override
  void initState() {
    jawaban = myData[2][nomorSoal.toString()];
    startTimer();
    super.initState();
  }

  showDoneAlertDialog(BuildContext context) {
    AlertDialog doneActionAlert = AlertDialog(
      title: Text("selesai"),
      content: Text("Lihat Hasil " +
          jumlahBenar.toString() +
          " " +
          jumlahSalah.toString()),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, "/dashboard");
          },
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
                jawaban = myData[2][nomorSoal.toString()];
                timer = 60; // ini tergantung waktu soal di JSON ya
                timerOn = true;
                for (int i = 0; i < 4; i++) {
                  buttonAnswerStatus[i] = "normal";
                  buttonStatus[i] = true;
                }
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

  Widget choiceButton(String optionText, int numButton) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            if (optionText == jawaban) {
              jumlahBenar += 1;
            } else {
              jumlahSalah += 1;
            }

            if (jawaban == "a") {
              buttonStatus[0] = false;
            }
            if (jawaban == "b") {
              buttonStatus[1] = false;
            }
            if (jawaban == "c") {
              buttonStatus[2] = false;
            }
            if (jawaban == "d") {
              buttonStatus[3] = false;
            }
          });

          if (nomorSoal == 10) {
            showDoneAlertDialog(context);
          } else {
            showNextActionAlertDialog(context);
          }
        },
        child: Text(
          myData[1][nomorSoal.toString()][optionText],
          style: TextStyle(fontFamily: "Quando", fontSize: 16),
        ),
        splashColor: Colors.lightBlueAccent,
        color: buttonStatus[numButton] ? Colors.lightBlue : Colors.green,
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('room').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data.docs.map((document) {
              return Container(
                child: Center(child: Text(document['id'])),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

/*Column(
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
                  myData[0][nomorSoal.toString()],
                  style: TextStyle(fontSize: 15, fontFamily: "Quando"),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choiceButton("a", 0),
                    choiceButton("b", 1),
                    choiceButton("c", 2),
                    choiceButton("d", 3),
                  ],
                ),
              ),
            ),
          ],
        ));*/
