import 'package:flutter/material.dart';
import 'package:pycare/models/bottombar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../screens/about.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

enum BottomIcons {
  Home,
  Hospital,
  Maps,
  About,
}

class _MainPageState extends State<MainPage> {
  BottomIcons bottomIcons = BottomIcons.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //MAKE CHANGES HERE
          bottomIcons == BottomIcons.Home
              ? Center(
                  child: Text(
                    "Hi, this is home page",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Container(),
          bottomIcons == BottomIcons.Hospital
              ? Center(
                  child: Text(
                    "Hi, this is Hospital page",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Container(),
          bottomIcons == BottomIcons.Maps
              ? Center(
                  child: Text(
                    "Hi, this is Maps page",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Container(),
          bottomIcons == BottomIcons.About
              ? Center(
                  child: About(),
                )
              : Container(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Home;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Home ? true : false,
                      icons: EvaIcons.home,
                      text: "Home"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Hospital;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Hospital ? true : false,
                      icons: Icons.local_hospital_outlined,
                      text: "Hospitals"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.About;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Maps ? true : false,
                      icons: Icons.map_rounded,
                      text: "Maps"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Maps;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.About ? true : false,
                      icons: Icons.developer_mode,
                      text: "About"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
