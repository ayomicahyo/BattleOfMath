import 'package:flutter/material.dart';

class MatchMaking extends StatefulWidget {
  @override
  _MatchMaking createState() => _MatchMaking();
}

class _MatchMaking extends State<MatchMaking> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("MatchMaking"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Input Room Id",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    labelText: 'Room Id',
                    prefixIcon: Icon(Icons.lock_open),
                    border: OutlineInputBorder()),
              )),
          RaisedButton(
              color: Colors.lightBlue,
              onPressed: () {
                if (controller.text == "JK811") {
                  Navigator.pushNamed(context, "/GetJsonFalse");
                } else {
                  salahRoomAlertDialog(context);
                }
              },
              child: Text(
                'JOIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }

  salahRoomAlertDialog(BuildContext context) {
    AlertDialog falseAlert = AlertDialog(
      title: Text("Check Room"),
      content: Text("Kode Salah"),
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
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return falseAlert;
      },
    );
  }
}
