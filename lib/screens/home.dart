import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/hcard.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:pycare/components/popup.dart';
import 'package:pycare/components/precautions_scroll.dart';
import 'package:pycare/providers/fetch_data.dart';
import 'package:pycare/providers/translation.dart';

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
        try {
          return MapEntry(
              key.toString()[0].toUpperCase() + key.toString().substring(1),
              double.parse(value));
        } catch (e) {
          return MapEntry("nothing", 0);
        }
      });
      dataMap.remove("Total");
      dataMap.remove("nothing");

      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          title: Text(
            translation.getTranslatedText(context, "Pudhuvai Care"),
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
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 16, top: 4),
                    child: Container(
                      height: 250.0,
                      child: PieChart(
                        dataMap: dataMap,
                        colorList: [green, yellow, red],
                        // centerText: "AS ON 19/5/2021",
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
                  Text(
                    "As on\n" +
                        api.status["lastUpdatedOn"]
                            .toString()
                            .replaceFirst(" ", "\n"),
                    // "As on 19/5/2021",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 4, top: 4),
                child: Text(
                  translation.getTranslatedText(context, "source") +
                      ": https://covid19dashboard.py.gov.in/",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
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
                              .toDouble()
                              .toStringAsPrecision(3),
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
                            .toDouble()
                            .toStringAsPrecision(3)),
                    HCard(
                        count: int.parse(api.status["death"]),
                        color: red,
                        title: translation.getTranslatedText(context, "Death"),
                        percentage: (int.parse(api.status["death"]) /
                                totalReported *
                                100)
                            .toDouble()
                            .toStringAsPrecision(3)),
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
                      fontSize:
                          translation.currentLanguage == "tamil" ? 22 : 28,
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
              SizedBox(
                height: 10.0,
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
                  alignment: Alignment.topLeft,
                  color: Color(0xf4f9f9),
                  child: Text(
                    translation.getTranslatedText(context, 'DISCLAIMER NOTICE'),
                    style: GoogleFonts.poppins(
                      fontSize:
                          translation.currentLanguage == "tamil" ? 22 : 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 4, top: 4),
                child: Text(
                  "Neither PTU nor the Google DSC is responsible for inadvertent mistakes in the data provided by the app in the absence of good internet connectivity. The data available at the GoP portal should be considered official.",
                  style: GoogleFonts.poppins(
                    color: Colors.indigo,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  color: Color(0xf4f9f9),
                  child: Text(
                    translation.getTranslatedText(context, 'CREDITS'),
                    style: GoogleFonts.poppins(
                      fontSize:
                          translation.currentLanguage == "tamil" ? 18 : 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 4, top: 4),
                child: Text(
                  "All the data are being fetched from the website https://covid19dashboard.py.gov.in/",
                  style: GoogleFonts.poppins(
                    color: Colors.indigo,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 8.0,
              //     right: 8.0,
              //   ),
              //   child: Text(
              //     translation.getTranslatedText(context,
              //         'All the data are being fetched from the website mentioned below:'),
              //     style: GoogleFonts.poppins(
              //       fontSize: 16.0,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 8.0,
              //     right: 8.0,
              //     top: 7.0,
              //   ),
              //   child: Text(
              //     'https://covid19dashboard.py.gov.in/',
              //     style: GoogleFonts.poppins(
              //       fontSize: 16.0,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 8.0,
              // ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     textStyle: GoogleFonts.poppins(
              //       fontSize: 16.0,
              //       //backgroundColor: appBarCol,
              //     ),
              //     primary: appBarCol,
              //   ),
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (_) => FlareGiffyDialog(
              //         flarePath: 'assets/space_demo.flr',
              //         flareAnimation: 'loading',
              //         title: Text(
              //           'DISCLAIMER',
              //           style: GoogleFonts.poppins(
              //               fontSize: 22.0, fontWeight: FontWeight.w600),
              //         ),
              //         description: Text(
              //             'Neither PTU nor the Google DSC is responsible for inadvertent mistakes in the data provided by the app in the absence of good internet connectivity. The data available at the GoP portal should be considered official.'),
              //         entryAnimation: EntryAnimation.DEFAULT,
              //         onOkButtonPressed: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //     );
              //   },
              //   child: Text(
              //     translation.getTranslatedText(context, 'DISCLAIMER'),
              //   ),
              // ),
              SizedBox(
                height: 8.0,
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
