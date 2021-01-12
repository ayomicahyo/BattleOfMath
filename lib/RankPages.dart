import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'soloTest.dart';

class RankPages extends StatefulWidget {
  var myData;

  RankPages({Key key, @required this.myData}) : super(key: key);
  @override
  _RankPagesState createState() => _RankPagesState(myData);
}

class _RankPagesState extends State<RankPages> {
  var myData;
  _RankPagesState(this.myData);

  @override
  Widget build(BuildContext context) {
    return Solotest(
      myData: myData,
    );
  }
}
