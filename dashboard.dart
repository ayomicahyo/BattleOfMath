import 'package:battleofmath/account/profile.dart';
import 'package:battleofmath/model/account.dart';
import 'package:battleofmath/widget/CardMenu.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  Account userId;

  Dashboard(Account _userId) {
    this.userId = _userId;
  }

  @override
  _DashboardState createState() => _DashboardState(userId);
}

class _DashboardState extends State<Dashboard> {
  //for navigator
  //Pake ini userId nya
  Account userId;
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _DashboardState(this.userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 25,
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(userId.email),
                              Image.asset(
                                "assets/images/ColorLogo.png",
                                width: 50.9,
                                height: 50.9,
                              ),
                            ],
                          ),
                        ),
                        //class image position center
                        Container(
                          child: Stack(
                            children: <Widget>[
                              Image.asset("assets/images/ImageIlustration.png",
                                  fit: BoxFit.fill),
                            ],
                          ),
                        ),
                        //class position menu
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                          child: CardMenu(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            //profile
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Profile(userId),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      //class navigator button menu
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(title: Text('Home'), icon: Icon(Icons.home)),
          BottomNavyBarItem(
              title: Text('Leaderbard'), icon: Icon(Icons.chat_bubble)),
          BottomNavyBarItem(title: Text('Riwayat'), icon: Icon(Icons.apps)),
          BottomNavyBarItem(title: Text('Profile'), icon: Icon(LineIcons.user)),
        ],
      ),
    );
  }
}