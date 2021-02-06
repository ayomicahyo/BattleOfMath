import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchMaking extends StatefulWidget {
  @override
  _MatchMaking createState() => _MatchMaking();
}

class _MatchMaking extends State<MatchMaking> {
  final textController = TextEditingController();

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
                controller: textController,
                decoration: InputDecoration(
                    labelText: 'Room Id',
                    prefixIcon: Icon(Icons.lock_open),
                    border: OutlineInputBorder()),
              )),
          RaisedButton(
              color: Colors.lightBlue,
              onPressed: () {
                if (textController.text == "ID1") {
                  FirebaseFirestore.instance
                      .collection('room')
                      .doc('zXlEpgyxeBPyQQIh4UFs')
                      .update({'p2Score': '0', 'p1Score': '0', 'qNumber': '1'});
                  Navigator.pushNamed(context, "/GetJsonFalse");
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
}
