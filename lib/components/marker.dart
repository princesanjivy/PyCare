import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/map.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:pycare/components/my_text.dart';
import 'package:pycare/providers/fetch_data.dart';
import 'package:pycare/providers/translation.dart';
import 'package:pycare/screens/hospital_details.dart';

class PlaceMarker {
  final String hospitalName;
  final int oxygenBeds;
  final int ventilatorBeds;
  final int isolationBeds;
  final String lat;
  final String long;
  final int index;

  PlaceMarker({
    this.hospitalName,
    this.oxygenBeds,
    this.ventilatorBeds,
    this.isolationBeds,
    this.lat,
    this.long,
    this.index,
  });

  Marker build(BuildContext context) {
    return Marker(
      width: 100,
      height: 100,
      point: LatLng(double.parse(lat), double.parse(long)),
      builder: (context) => Consumer2<TranslationText, FetchData>(
          builder: (context, translation, api, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    backgroundColor: Colors.black,
                    context: context,
                    builder: (builder) {
                      return Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Container(
                            color: bgColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10.0,
                                        left: 10.0,
                                      ),
                                      child: Container(
                                        width: 300.0,
                                        child: Text(
                                          translation.getTranslatedText(
                                              context, hospitalName),
                                          maxLines: 10,
                                          style: GoogleFonts.poppins(
                                            fontSize:
                                                translation.currentLanguage ==
                                                        "tamil"
                                                    ? 14
                                                    : 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: darkBlue,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 8.0,
                                  ),
                                  child: Text(
                                    translation.getTranslatedText(
                                        context, 'Bed Availability'),
                                    maxLines: 1,
                                    // textAlign: ,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                      fontSize:
                                          translation.currentLanguage == "tamil"
                                              ? 24
                                              : 26,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: MapComponent(
                                    oxygenBedCount: oxygenBeds,
                                    ventilatorBedCount: ventilatorBeds,
                                    isolationBedCount: isolationBeds,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 8, bottom: 32, right: 8),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HospitalDetails(
                                                hospitalFullName:
                                                    api.hospitalDetails[index]
                                                        ["Full form"],
                                                latitude:
                                                    api.hospitalDetails[index]
                                                        ['lat'],
                                                longitude:
                                                    api.hospitalDetails[index]
                                                        ['long'],
                                                imgLink:
                                                    api.hospitalDetails[index]
                                                        ["URL"],
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
                                                hospitalName:
                                                    api.hospitalDetails[index]
                                                        ['hospitalName'],
                                                oxygenBeds: api
                                                    .hospitalDetails[index]
                                                        ['oxygenBeds']["vacant"]
                                                    .toString(),
                                                instituteType: "GOVT",
                                                ventilatorBeds: api
                                                    .hospitalDetails[index]
                                                        ['ventilatorBeds']
                                                        ["vacant"]
                                                    .toString(),
                                                isolationBeds: api
                                                    .hospitalDetails[index]
                                                        ['isolationBeds']
                                                        ["vacant"]
                                                    .toString(),
                                                address:
                                                    api.hospitalDetails[index]
                                                        ['address'],
                                                contactNos:
                                                    api.hospitalDetails[index]
                                                        ['phNumber'],
                                              ),
                                            ),
                                          );
                                        },
                                        child: MyText(
                                          text: translation.getTranslatedText(
                                              context, "More Details"),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  appBarCol),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              icon: Icon(
                Icons.place,
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                size: 45,
              )),
        );
      }),
    );
  }
}
