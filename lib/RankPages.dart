import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'soloTest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class RankPages extends StatefulWidget {
  var myData;
  String player1Name;
  String player2Name;

  RankPages(List myData, String name1, String name2) {
    this.myData = myData;
    this.player1Name = name1;
    this.player2Name = name2;
  }

  @override
  _RankPagesState createState() =>
      _RankPagesState(myData, player1Name, player2Name);
}

class _RankPagesState extends State<RankPages> {
  var myData;
  String player1Name;
  String player2Name;

  _RankPagesState(this.myData, this.player1Name, this.player2Name);

  @override
  Widget build(BuildContext context) {
    CollectionReference roomData =
        FirebaseFirestore.instance.collection('room');

    return FutureBuilder<DocumentSnapshot>(
      future: roomData.doc("zXlEpgyxeBPyQQIh4UFs").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Solotest(myData, data['player1'], data['player2'], "Cahyo");
        }

        return Text("loading");
      },
    );
  }
}
