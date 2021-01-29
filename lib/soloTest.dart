import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screenshots/screenshots.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'RankPages.dart';

class GetJson extends StatelessWidget {
  bool soloTest = false;
  String player1Name = "Player1";
  String player2name = "Player2";
  String currentName = "";
  GetJson(bool _soloTest, _player1name, _player2name, _currentName) {
    this.soloTest = _soloTest;
    this.player1Name = _player1name;
    this.player2name = _player2name;
    this.currentName = _currentName;
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
                ? Solotest(myData, player1Name, player2name, "Widiya")
                : RankPages(myData, player1Name, player2name);
          }
        });
  }
}

class Solotest extends StatefulWidget {
  var myData;
  String player1Name;
  String player2Name;
  String currentName;
  Solotest(List myData, String name1, String name2, String currentName) {
    this.myData = myData;
    this.player1Name = name1;
    this.player2Name = name2;
    this.currentName = currentName;
  }
  @override
  _SolotestState createState() =>
      _SolotestState(myData, player1Name, player2Name, currentName);
}

class _SolotestState extends State<Solotest> {
  var myData;
  String player1Name;
  String player2Name;
  String currentName;
  _SolotestState(
      this.myData, this.player1Name, this.player2Name, this.currentName);

  int timer = 60;
  int nomorSoal = 1;
  int currentSoal = 0;
  String updateTime = "60";
  bool timerOn = true;
  List<String> buttonAnswerStatus = ["normal", "normal", "normal", "normal"];
  List<bool> buttonStatus = [true, true, true, true];
  int player1Jawab = 0;
  int player2Jawab = 0;
  int jumlahBenar = 0;
  int jumlahSalah = 0;
  String jawaban;
  int playerNumber = 1;

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

  showNextKejawabOrangAlertDialog(BuildContext context) {
    AlertDialog kejawabActionAlert = AlertDialog(
      title: Text("OOps"),
      content: Text("Keduluan Lawan Nih"),
      actions: [
        FlatButton(
          onPressed: () {
            setState(
              () {
                nomorSoal = currentSoal;
                jawaban = myData[2][nomorSoal.toString()];
                timer = 60; // ini tergantung waktu soal di JSON ya
                timerOn = true;
                Navigator.pop(context, false);
              },
            );
          },
          //Navigator.pop(context, false), // ini nanti diganti jadi Next Soal
          child: Text("Okey"),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return kejawabActionAlert;
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
                FirebaseFirestore.instance
                    .collection('room')
                    .doc('zXlEpgyxeBPyQQIh4UFs')
                    .update({'qNumber': nomorSoal.toString()});

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

            if (currentSoal != nomorSoal) {
              showNextKejawabOrangAlertDialog(context);
            } else {
              showNextActionAlertDialog(context);
            }
          } else if (timer == 0) {
            timerOn = false;
            //TimeStop Didnt do anything
          } else {
            timer -= 1;
            if (currentSoal != nomorSoal) {
              timer = 1;
            }
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
          timerOn = false;
          setState(() {
            if (optionText == jawaban) {
              jumlahBenar += 1;
              if (playerNumber == 1) {
                player1Jawab += 1;
                FirebaseFirestore.instance
                    .collection('room')
                    .doc('zXlEpgyxeBPyQQIh4UFs')
                    .update({'p1Score': player1Jawab.toString()});
              } else {
                player2Jawab += 1;
                FirebaseFirestore.instance
                    .collection('room')
                    .doc('zXlEpgyxeBPyQQIh4UFs')
                    .update({'p2Score': player2Jawab.toString()});
              }
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
    CollectionReference roomData =
        FirebaseFirestore.instance.collection('room');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Soal : " + currentSoal.toString() + "/10",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: roomData.doc("zXlEpgyxeBPyQQIh4UFs").get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          Map<String, dynamic> data = snapshot.data.data();
          //currentSoal = data['qNumber'];

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            currentSoal = int.parse(data['qNumber']);
            if (player1Name == currentName) {
              playerNumber = 1;
            } else {
              playerNumber = 2;
            }
            return Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Text(currentName + " : " + data['p1Score']),
                        Text(currentName + " : " + data['p2Score']),
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
            );
          }
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
