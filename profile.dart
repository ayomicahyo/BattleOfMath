import 'package:battleofmath/model/account.dart';
import 'package:battleofmath/widget/MyHeader.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Account userId;

  Profile(Account _userId) {
    this.userId = _userId;
  }

  @override
  _ProfileState createState() => _ProfileState(userId);
}

class _ProfileState extends State<Profile> {
  Account userId;
  _ProfileState(this.userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at home.",
              //offset: offset,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  //SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      //icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: "Indonesia",
                      items: [
                        'Indonesia',
                        'Bangladesh',
                        'United States',
                        'Japan'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
