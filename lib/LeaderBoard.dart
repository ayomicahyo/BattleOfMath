import 'package:flutter/material.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  Image applogo = new Image(
      image: new ExactAssetImage("assets/images/whiteLogo.png"),
      height: 50.9,
      width: 50.9,
      alignment: FractionalOffset.center);

  Widget appbar() {
    return AppBar(
      centerTitle: true,
      title: applogo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(),
        body: ListView(
          padding: const EdgeInsets.all(30),
          children: <Widget>[
            Container(
              height: 60,
              color: Colors.amber[600],
              child: Row(children: <Widget>[Text('1 |'), Text('Entry A')]),
            ),
            Container(
              height: 60,
              color: Colors.amber[600],
              child: Row(children: <Widget>[Text('2 |'), Text('Entry B')]),
            ),
            Container(
              height: 60,
              color: Colors.amber[600],
              child: Row(children: <Widget>[Text('3 |'), Text('Entry C')]),
            ),
          ],
        ));
  }
}
