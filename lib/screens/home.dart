import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:pycare/Components/popup.dart';
import 'package:pycare/components/hcard.dart';
import 'package:pycare/components/my_appbar.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:pycare/components/precautions_scroll.dart';
import 'package:pycare/providers/fetch_data.dart';
import 'package:pycare/providers/translation.dart';

import '../components/my_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String assetName = 'images/illustration.svg';

  @override
  Widget build(BuildContext context) {
    return Consumer2<FetchData, TranslationText>(
        builder: (context, api, translation, child) {
      int totalReported = int.parse(api.status["total"]);

      Map<String, double> dataMap = api.status.map((key, value) {
        return MapEntry(
            key.toString()[0].toUpperCase() + key.toString().substring(1),
            double.parse(value));
      });
      dataMap.remove("Total");

      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          title: Text(
            translation.getTranslatedText(context, "PYCARE"),
            style: GoogleFonts.poppins(),
          ),
          centerTitle: true,
          backgroundColor: appBarCol,
          actions: [
            PopUp(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16, left: 16),
                child: Text(
                  translation.getTranslatedText(context, "PUDUCHERRY"),
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
                  translation.getTranslatedText(context, "COVID-19 TRACKER"),
                  style: GoogleFonts.poppins(
                    color: Colors.indigo,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16, top: 4),
                child: Container(
                  height: 250.0,
                  child: PieChart(
                    dataMap: dataMap,
                    colorList: [green, yellow, red],
                    centerText: "AS ON 16/4/2021",
                    ringStrokeWidth: 32,
                    chartValuesOptions: ChartValuesOptions(
                      showChartValues: false,
                    ),
                    chartType: ChartType.ring,
                    legendOptions: LegendOptions(
                      showLegends: false,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, bottom: 8, top: 8, right: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HCard(
                      count: totalReported,
                      color: lightBlue,
                      title: translation.getTranslatedText(
                          context, "Total Reported"),
                    ),
                    HCard(
                      count: int.parse(api.status["cured"]),
                      color: green,
                      title: translation.getTranslatedText(context, "Cured"),
                      percentage:
                          (int.parse(api.status["cured"]) / totalReported * 100)
                              .toInt(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, bottom: 8, top: 8, right: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HCard(
                        count: int.parse(api.status["active"]),
                        color: yellow,
                        title: translation.getTranslatedText(context, "Active"),
                        percentage: (int.parse(api.status["active"]) /
                                totalReported *
                                100)
                            .toInt()),
                    HCard(
                        count: int.parse(api.status["death"]),
                        color: red,
                        title: translation.getTranslatedText(context, "Death"),
                        percentage: (int.parse(api.status["death"]) /
                                totalReported *
                                100)
                            .toInt()),
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
                    translation.getTranslatedText(context, 'PRECAUTIONS'),
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
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
    });
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
