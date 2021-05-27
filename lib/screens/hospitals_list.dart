import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/my_appbar.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:pycare/components/my_text.dart';
import 'package:pycare/screens/hospital_details.dart';

import '../providers/fetch_data.dart';
import '../providers/translation.dart';

class Hospitals extends StatefulWidget {
  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  String selectedPopItem;
  String selectedFilterPopItem;
  // var tempHospitals = [];
  // var hospitals = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer2<FetchData, TranslationText>(
        builder: (context, api, translation, child) {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: MyAppBar(
          title: translation.getTranslatedText(context, 'List of Hospitals'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // PopupMenuButton(
                    //   child: Container(
                    //     width: width / 3,
                    //     height: 36.35,
                    //     decoration: BoxDecoration(
                    //         color: darkBlue,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: Center(
                    //       child: Row(
                    //         children: [
                    //           SizedBox(
                    //             width: 10,
                    //           ),
                    //           MyText(
                    //             text: translation.getTranslatedText(
                    //                 context, 'Filter'),
                    //             color: Colors.white,
                    //           ),
                    //           SizedBox(
                    //             width: 40,
                    //           ),
                    //           Icon(
                    //             Icons.filter_list_rounded,
                    //             color: Colors.white,
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    //   onSelected: (popItem) {
                    //     print(popItem);
                    //     setState(() {
                    //       selectedFilterPopItem = popItem;
                    //     });
                    //   },
                    //   color: bgColor,
                    //   itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    //     PopupMenuItem(
                    //       child: PopupMenuButton(
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(16),
                    //         ),
                    //         color: bgColor,
                    //         child: MyText(
                    //           text: translation.getTranslatedText(
                    //               context, 'Type Of Institute'),
                    //         ),
                    //         itemBuilder: (BuildContext context) =>
                    //             <PopupMenuEntry>[
                    //           PopupMenuItem(
                    //             child: ListTile(
                    //               onTap: () {
                    //                 hospitals = tempHospitals;
                    //                 setState(() {
                    //                   hospitals = hospitals.where((item) {
                    //                     return item.containsValue('govt');
                    //                   }).toList();
                    //                 });
                    //                 Navigator.pop(context);
                    //               }, //Show Hospitals Under Govt. Category.
                    //               title: MyText(
                    //                 text: 'Govt',
                    //               ),
                    //             ),
                    //           ),
                    //           PopupMenuItem(
                    //             child: ListTile(
                    //               onTap: () {
                    //                 hospitals = tempHospitals;
                    //                 setState(() {
                    //                   hospitals = hospitals.where((item) {
                    //                     return item.containsValue('private');
                    //                   }).toList();
                    //                 });
                    //                 Navigator.pop(context);
                    //               }, //Show private Hospitals.
                    //               title: MyText(
                    //                 text: 'Private',
                    //               ),
                    //             ),
                    //           ),
                    //           PopupMenuItem(
                    //             child: ListTile(
                    //               onTap: () {
                    //                 hospitals = tempHospitals;
                    //                 setState(() {
                    //                   hospitals = hospitals.where((item) {
                    //                     return item
                    //                         .containsValue('nursing homes');
                    //                   }).toList();
                    //                 });
                    //                 Navigator.pop(context);
                    //               }, //Show Nursing homes.
                    //               title: MyText(
                    //                 text: translation.getTranslatedText(
                    //                     context, 'Nursing Homes'),
                    //               ),
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     PopupMenuItem(
                    //       child: ListTile(
                    //         onTap: () {
                    //           setState(() {
                    //             hospitals = tempHospitals;
                    //           });
                    //           Navigator.pop(context);
                    //         }, //Show all
                    //         title: MyText(
                    //           text:
                    //               translation.getTranslatedText(context, 'All'),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(16),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 8,
                    // ),
                    PopupMenuButton(
                      initialValue: selectedPopItem,
                      child: Container(
                        width: width / 3,
                        height: 36.35,
                        decoration: BoxDecoration(
                            color: darkBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                translation.getTranslatedText(
                                    context, 'Bed type'),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      translation.currentLanguage == "tamil"
                                          ? 12
                                          : 18,
                                ),
                              ),
                              Icon(
                                Icons.sort,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      onSelected: (popItem) {
                        setState(() {
                          selectedPopItem = popItem;
                        });
                      },
                      color: bgColor,
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              api.sortThing(0);

                              Navigator.pop(context);
                            }, //Sort Logic (Ascending)
                            title: Text(
                              translation.getTranslatedText(
                                  context, 'Oxygen Beds'),
                            ),
                            trailing: api.sortItem == 0
                                ? Icon(
                                    Icons.check,
                                    color: green,
                                  )
                                : Opacity(
                                    opacity: 0,
                                    child: Icon(
                                      Icons.check,
                                      color: green,
                                    ),
                                  ),
                          ),
                        ),
                        PopupMenuDivider(
                          height: 20,
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              api.sortThing(1);
                              Navigator.pop(context);
                            }, //Sort Logic (Descending)
                            title: Text(
                              translation.getTranslatedText(
                                  context, 'Ventilator Beds'),
                              style: GoogleFonts.poppins(),
                            ),
                            trailing: api.sortItem == 1
                                ? Icon(
                                    Icons.check,
                                    color: green,
                                  )
                                : Opacity(
                                    opacity: 0,
                                    child: Icon(
                                      Icons.check,
                                      color: green,
                                    ),
                                  ),
                          ),
                        ),
                        PopupMenuDivider(
                          height: 20,
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              api.sortThing(2);
                              Navigator.pop(context);
                            }, //Sort Logic (Vacant Beds)
                            title: MyText(
                              text: translation.getTranslatedText(
                                  context, 'Isolation Beds'),
                            ),
                            trailing: api.sortItem == 2
                                ? Icon(
                                    Icons.check,
                                    color: green,
                                  )
                                : Opacity(
                                    opacity: 0,
                                    child: Icon(
                                      Icons.check,
                                      color: green,
                                    ),
                                  ),
                          ),
                        )
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  translation.getTranslatedText(context, "data source") +
                      ": https://covid19dashboard.py.gov.in/",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  translation.getTranslatedText(context, "as on: ") +
                      api.status["lastUpdatedOn"].toString().split(" ")[0],
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  translation.getTranslatedText(
                          context, "Selected bed type: ") +
                      translation.getTranslatedText(
                        context,
                        api.sortItem == 0
                            ? "Oxygen Beds"
                            : api.sortItem == 1
                                ? "Ventilator Beds"
                                : "Isolation Beds",
                      ),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: api.hospitalDetails.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(9),
                            splashColor: darkBlue,
                            radius: 500,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HospitalDetails(
                                    hospitalFullName: api.hospitalDetails[index]
                                        ["Full form"],
                                    latitude: api.hospitalDetails[index]['lat'],
                                    longitude: api.hospitalDetails[index]
                                        ['long'],
                                    imgLink: api.hospitalDetails[index]["URL"],
                                    hospitalName: api.hospitalDetails[index]
                                        ['hospitalName'],
                                    oxygenBeds: api.hospitalDetails[index]
                                            ['oxygenBeds']["vacant"]
                                        .toString(),
                                    instituteType: "GOVT",
                                    ventilatorBeds: api.hospitalDetails[index]
                                            ['ventilatorBeds']["vacant"]
                                        .toString(),
                                    isolationBeds: api.hospitalDetails[index]
                                            ['isolationBeds']["vacant"]
                                        .toString(),
                                    allotedOxygenBeds: api
                                        .hospitalDetails[index]['oxygenBeds']
                                            ["alloted"]
                                        .toString(),
                                    allotedVentilatorBeds: api
                                        .hospitalDetails[index]
                                            ['ventilatorBeds']["alloted"]
                                        .toString(),
                                    alltoedIsolationBeds: api
                                        .hospitalDetails[index]['isolationBeds']
                                            ["alloted"]
                                        .toString(),
                                    address: api.hospitalDetails[index]
                                        ['address'],
                                    contactNos: api.hospitalDetails[index]
                                        ['phNumber'],
                                  ),
                                ),
                              );
                            }, //Hospitals Specific Details Component Call
                            child: Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: borderBlue),
                              ),
                              child: SafeArea(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, top: 10, right: 16),
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  MyText(
                                                    text: translation
                                                        .getTranslatedText(
                                                            context,
                                                            api.hospitalDetails[
                                                                    index][
                                                                'hospitalName']),
                                                    size: 16,
                                                    color: Colors.black,
                                                    fontWeight: 'BOLD',
                                                  ),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Row(
                                                    children: [
                                                      MyText(
                                                        text: translation
                                                                .getTranslatedText(
                                                                    context,
                                                                    'Vacant') +
                                                            ": ",
                                                        color: darkBlue,
                                                        fontWeight: 'BOLD',
                                                      ),
                                                      MyText(
                                                        text: translation.getTranslatedText(
                                                            context,
                                                            api.hospitalDetails[index][api.sortItem == 0
                                                                    ? 'oxygenBeds'
                                                                    : api.sortItem == 1
                                                                        ? 'ventilatorBeds'
                                                                        : "isolationBeds"]["vacant"]
                                                                .toString()),
                                                        color: numberRed,
                                                        fontWeight: 'BOLD',
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: darkBlue,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          height: 30,
                                          width: 30,
                                          child: Center(
                                            child: Icon(
                                              Icons.arrow_right_alt_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
