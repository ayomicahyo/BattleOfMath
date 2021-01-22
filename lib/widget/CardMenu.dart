import 'package:flutter/material.dart';

class CardMenu extends StatefulWidget {
  @override
  _CardMenuState createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 10,
                color: Colors.grey.withOpacity(.2),
              ),
              BoxShadow(
                offset: Offset(-3, 0),
                blurRadius: 15,
                color: Colors.grey.withOpacity(.1),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu self
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        "assets/images/SelfLearnIlustration.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: Text(
                    "Self Test",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Kerjakan test matematika mandiri, untuk melatih kemampuanmu.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    //PERUBAHAN SEMENTARA
                    Navigator.pushNamed(context, "/GetJson");
                    // Navigator.pushReplacement(context,
                    //    MaterialPageRoute(builder: (context) => GetJson(true)));
                  },
                ),
              ),
            ],
          ),
        ),
        //menu 2
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 10,
                color: Colors.grey.withOpacity(.2),
              ),
              BoxShadow(
                offset: Offset(-3, 0),
                blurRadius: 15,
                color: Colors.grey.withOpacity(.1),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu self
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        //color: Colors.black,
                      ),
                      child: Image.asset(
                        "assets/images/RankedMatrch.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: Text(
                    "Ranked Match",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Lawanlah challanger sekitar dan dapatkan bintang untuk meningkatkan status kemampuan matematikamu.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    //Navigator.pushNamed(context, "/MatchMaking");
                  },
                ),
              ),
            ],
          ),
        ),
        //menu 3
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 10,
                color: Colors.grey.withOpacity(.2),
              ),
              BoxShadow(
                offset: Offset(-3, 0),
                blurRadius: 15,
                color: Colors.grey.withOpacity(.1),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu self
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/images/customMatch.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: Text(
                    "Custom Match",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Lawanlah  temanmu dalam custom room dan belajarlah bersama untuk mengerjakan soal.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/MatchMaking");
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
