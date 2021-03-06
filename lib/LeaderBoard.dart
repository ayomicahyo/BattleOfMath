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
        body: ListView(
      children: <Widget>[
        Container(
          color: Colors.lightBlue,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/whiteLogo.png",
                width: 50.9,
                height: 50.9,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.lightGreen,
            ),
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[Text('1 |'), Text('Entry A'), Text('100')])),
        SizedBox(
          height: 30,
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.lightGreen,
            ),
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[Text('2 |'), Text('Entry B'), Text('100')])),
        SizedBox(
          height: 30,
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.lightGreen,
            ),
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[Text('3 |'), Text('Entry C'), Text('100')])),
      ],
    ));
  }
}
