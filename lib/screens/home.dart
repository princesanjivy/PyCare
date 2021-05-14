import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pycare/components/hcard.dart';
import 'package:pycare/components/my_appbar.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:pycare/components/precautions_scroll.dart';

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
      backgroundColor: bgColor,
      appBar: MyAppBar(
        title: 'PYCARE',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16),
              child: Text(
                "PUDUCHERRY",
                style: GoogleFonts.poppins(
                  fontSize: 28,
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
              padding: EdgeInsets.only(left: 16, bottom: 4, top: 4),
              child: Text(
                "COVID-19 TRACKER",
                style: GoogleFonts.poppins(
                  color: Colors.indigo,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 4, top: 4),
              child: Container(
                height: 250.0,
                child: PieChart(dataMap: cMap),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8, top: 8, right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HCard(
                    count: 68373,
                    color: lightBlue,
                    title: "Total Reported",
                  ),
                  HCard(
                    count: 54375,
                    color: green,
                    title: "Cured",
                    percentage: 79,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8, top: 8, right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HCard(
                    count: 68373,
                    color: yellow,
                    title: "Active",
                    percentage: 5,
                  ),
                  HCard(
                    count: 54375,
                    color: red,
                    title: "Death",
                    percentage: 79,
                  ),
                ],
              ),
            ),

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
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            //STACK UP AHEAD
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
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: PrecautionScroll(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class cItem extends StatelessWidget {
//   final int eNum;
//   final String title;
//   final int percentage;
//   final Color color;
//   cItem({this.eNum, this.title, this.percentage, this.color});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(15),
//       child: Text(title),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
// }
//
// class gridStat {
//   final int eNum;
//   final String title;
//   final int percentage;
//   final Color color;
//
//   gridStat({
//     @required this.eNum,
//     @required this.title,
//     this.percentage,
//     this.color = Colors.green,
//   });
// }
