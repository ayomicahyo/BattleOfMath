import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'soloTest.dart';
import 'RankPages.dart';
import 'LeaderBoard.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 1;
  Image applogo = new Image(
      image: new ExactAssetImage("assets/images/whiteLogo.png"),
      height: 50.9,
      width: 50.9,
      alignment: FractionalOffset.center);

  //widget untuk appbar
  Widget appbar() {
    return AppBar(
      centerTitle: true,
      title: applogo,
    );
  }

  Widget header() {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset("assets/images/ImageIlustration.png", fit: BoxFit.fill),
        ],
      ),
    );
  }

  Widget listmenu() {
    return Container(
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
        children: <Widget>[
          //container 1
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
                    color: Colors.black,
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => GetJson(true)));
                //Navigator.pushNamed(context, "/selftest");  Sorry Diganti Dulu
              },
            ),
          ),
          Divider(),
          //container 2
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
                    color: Colors.black,
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => GetJson(false)));
              },
            ),
          ),
          Divider(),
          //container 3
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
                Navigator.pushNamed(context, "/selftest");
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                header(),
                listmenu(),
              ],
            ),
          ),
          //list menu
        ],
      ),
      //menu navigation bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                //tabBackgroundColor: Colors.grey[800],
                tabBackgroundColor: Colors.blue[600],
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.bar_chart,
                    text: 'Leaderbard',
                    // INI CHANGE SCENE NYA CEMANA ?!!!!
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LeaderBoard()));
                    },
                  ),
                  GButton(
                    icon: LineIcons.search,
                    text: 'Riwayat',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: currentIndex,
                onTabChange: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
