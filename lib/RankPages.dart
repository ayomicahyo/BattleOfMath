import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'soloTest.dart';

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
    return Solotest(myData, player1Name, player2Name);
  }
}
