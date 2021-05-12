import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pycare/models/hcard.dart';
import 'package:pycare/models/scrol.dart';

import '../Components/my_appbar.dart';
import '../Components/my_colors.dart';
import '../Components/my_colors.dart';
import '../Components/my_colors.dart';
import '../Components/my_colors.dart';
import '../Components/my_colors.dart';
import '../Components/my_colors.dart';
import '../Components/my_colors.dart';
import '../Components/my_colors.dart';
import '../Components/my_colors.dart';
// import 'package:pycare/models/scroll.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String assetName = 'images/illustration.svg';

  Map<String, double> cMap = {
    'Active': 13078,
    'Cured': 54375,
    'Deaths': 920,
  };
  List<Color> colList = [
    Colors.yellow,
    Colors.green,
    Colors.red,
  ];

  Widget cirChart() {
    return PieChart(
      dataMap: cMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: colList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: "COVID \n Analysis as on \n 9 | May | 2021",
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'PYCARE',
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffe4fbff),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                child: Text(
                  "PUDUCHERRY",
                  style: GoogleFonts.poppins(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Divider(
                thickness: 0.7,
                color: Colors.indigo,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "COVID-19 TRACKER",
                  style: GoogleFonts.poppins(
                    color: Colors.indigo,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              // CHART HERE
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250.0,
                  child: PieChart(dataMap: cMap),
                ),
              ),
              // CHART ENDS HERE

              // THE MID SCREEN
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      top: 5.0,
                    ),
                    child: Container(
                      // height: 100.0,
                      // width: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: lightBlue,
                      ),
                      child: hcard(
                        eNum: 68373,
                        cCol: lightBlue,
                        title: "Total Cases",
                        perc: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, right: 8.0),
                    child: Container(
                      // height: 100.0,
                      // width: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: green,
                      ),
                      child: hcard(
                        eNum: 54375,
                        cCol: Colors.lightGreen,
                        title: "Cured",
                        perc: 19,
                        // perc: 79.53f+"%",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      top: 5.0,
                    ),
                    child: Container(
                      // height: 100.0,
                      // width: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: yellow,
                      ),
                      child: hcard(
                        eNum: 13078,
                        cCol: Colors.yellow,
                        title: "Active",
                        perc: 80,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, right: 8.0),
                    child: Container(
                      // height: 100.0,
                      // width: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: red,
                      ),
                      child: hcard(
                        eNum: 920,
                        cCol: Colors.red,
                        title: "Dead",
                        perc: 1,
                        // perc: 79.53f+"%",
                      ),
                    ),
                  ),
                  // THE MID SCREEN ENDS HERE

                  Container(
                    height: 250.0,
                    width: double.infinity,
                    color: Colors.white12,
                    // SVG HERE

                    // child: SvgPicture.network(
                    //   'https://raw.githubusercontent.com/ayushved78/images/master/illustration.svg',
                    //   semanticsLabel: 'Illustration',
                    //   cacheColorFilter: false,
                    // ),

                    child: Image.asset(
                      'images/illustration.png',
                      fit: BoxFit.cover,
                      scale: 1,
                    ),
                  ),

                  Divider(
                    thickness: 0.8,
                    color: Colors.indigo,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      bottom: 8.0,
                    ),
                    child: Container(
                      color: Color(0xf4f9f9),
                      child: Text(
                        'PRECAUTIONS',
                        style: GoogleFonts.poppins(
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  //STACK UP AHEAD
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 8.0,
                          bottom: 20.0,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [
                                grad1,
                                grad2,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          height: 300.0,
                          width: 400.0,
                        ),
                      ),
                      horz(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class cItem extends StatelessWidget {
  final int eNum;
  final String title;
  final int perc;
  final Color color;
  cItem({this.eNum, this.title, this.perc, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(title),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class gridStat {
  final int eNum;
  final String title;
  final int perc;
  final Color color;

  gridStat({
    @required this.eNum,
    @required this.title,
    this.perc,
    this.color = Colors.green,
  });
}
