import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:pycare/components/my_text.dart';
import 'package:pycare/providers/fetch_data.dart';
import 'package:pycare/providers/translation.dart';
import 'package:pycare/screens/about_us.dart';
import 'package:pycare/screens/home.dart';
import 'package:pycare/screens/hospitals_list.dart';
import 'package:pycare/screens/maps.dart';
import 'package:pycare/screens/vaccination.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FetchData(),
        ),
        ChangeNotifierProvider(
          create: (_) => TranslationText(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 8,
          ),
        ),
      ),
      home: Bar(),
    );
  }
}

class Bar extends StatefulWidget {
  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  int _currentIndex = 0;

  List _screens = [
    HomeScreen(),
    Hospitals(),
    VaccineDrive(),
    HomeMap(),
    AboutUs(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer2<FetchData, TranslationText>(
      builder: (context, api, translation, child) {
        return api.loading
            ? Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    MyText(
                      text: "Pudhuvai Care",
                    ),
                    MyText(
                      text: "An outcome of Google DSC-PEC",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    MyText(
                      text: "Please wait...",
                    ),
                  ],
                ),
              )
            : Scaffold(
                body: _screens[_currentIndex],
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
                          "HOME",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
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
                          "HOSPITAL",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        activeColor: Colors.indigo.shade900,
                        inactiveColor: Colors.white,
                      ),
                      BottomNavyBarItem(
                        icon: FaIcon(
                          FontAwesomeIcons.syringe,
                          color: Colors.white,
                        ),
                        title: Text(
                          "VACCINE",
                          textAlign: TextAlign.center,
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
                          "MAP",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
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
                          "ABOUT US",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        activeColor: Colors.indigo.shade900,
                        inactiveColor: Colors.white,
                      ),
                      // BottomNavyBarItem(
                      //   icon: FaIcon(
                      //     FontAwesomeIcons.users,
                      //     color: Colors.white,
                      //   ),
                      //   title: Text(
                      //     "DISCLAIMER",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //     ),
                      //     textAlign: TextAlign.center,
                      //   ),
                      //   activeColor: Colors.indigo.shade900,
                      //   inactiveColor: Colors.white,
                      // ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
