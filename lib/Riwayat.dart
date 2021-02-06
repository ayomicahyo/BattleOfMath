import 'package:flutter/material.dart';

class Riwayat extends StatefulWidget {
  @override
  _Riwayat createState() => _Riwayat();
}

class _Riwayat extends State<Riwayat> {
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
              color: Colors.lightBlue,
            ),
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("RankMatch"),
                  Text('WIN'),
                  Text('60')
                ])),
        SizedBox(
          height: 30,
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.lightBlue,
            ),
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("RankMatch"),
                  Text('WIN'),
                  Text('40')
                ])),
        SizedBox(
          height: 30,
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.lightBlue,
            ),
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Custom Match"),
                  Text('Lose'),
                  Text('60')
                ])),
      ],
    ));
  }
}
