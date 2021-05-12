import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pycare/screens/about.dart';
import 'package:pycare/screens/home.dart';

import 'Components/my_colors.dart';
import 'Components/my_colors.dart';
import 'Components/my_colors.dart';
import 'Components/my_colors.dart';
import 'Components/my_colors.dart';
import 'screens/hospitals_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bar(),
    );
  }
}

// MAKE CHANGES HERE FOR SCREEN!!!!

class Bar extends StatefulWidget {
  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  int _currentIndex = 0;

//CHANGE THE CONTAINER TO YOUR SCREEN!!!

  List _Screens = [
    HomeScreen(),
    Hospitals(),
    Container(
      color: Colors.green,
    ),
    About(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Screens[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavyBar(
          curve: Curves.elasticInOut,
          backgroundColor: appBarCol,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(
              () {
                _currentIndex = index;
              },
            );
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: FaIcon(
                FontAwesomeIcons.home,
                color: Colors.white,
              ),
              title: Text(
                " HOME",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              activeColor: Colors.indigo.shade900,
              inactiveColor: Colors.white,
            ),
            BottomNavyBarItem(
              icon: FaIcon(
                FontAwesomeIcons.hospital,
                color: Colors.white,
              ),
              title: Text(
                " HOSPITAL",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              activeColor: Colors.indigo.shade900,
              inactiveColor: Colors.white,
            ),
            BottomNavyBarItem(
              icon: FaIcon(
                FontAwesomeIcons.map,
                color: Colors.white,
              ),
              title: Text(
                "  MAP",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              activeColor: Colors.indigo.shade900,
              inactiveColor: Colors.white,
            ),
            BottomNavyBarItem(
              icon: FaIcon(
                FontAwesomeIcons.users,
                color: Colors.white,
              ),
              title: Text(
                " ABOUT US",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              activeColor: Colors.indigo.shade900,
              inactiveColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
