import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/map.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:pycare/providers/translation.dart';

class PlaceMarker {
  final String hospitalName;
  final int oxygenBeds;
  final int ventilatorBeds;
  final int isolationBeds;
  final String lat;
  final String long;

  PlaceMarker({
    this.hospitalName,
    this.oxygenBeds,
    this.ventilatorBeds,
    this.isolationBeds,
    this.lat,
    this.long,
  });

  Marker build(BuildContext context) {
    return Marker(
      width: 100,
      height: 100,
      point: LatLng(double.parse(lat), double.parse(long)),
      builder: (context) =>
          Consumer<TranslationText>(builder: (context, translation, child) {
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
                                    top: 0.0,
                                    left: 8.0,
                                    right: 175.0,
                                    bottom: 10.0,
                                  ),
                                  child: Text(
                                    translation.getTranslatedText(
                                        context, 'Bed Availability'),
                                    maxLines: 1,
                                    // textAlign: ,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.poppins(
                                      fontSize:
                                          translation.currentLanguage == "tamil"
                                              ? 24
                                              : 30,
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
                                // Container(
                                //   height: 50,
                                //   margin: EdgeInsets.all(25),
                                //   padding: EdgeInsets.only(
                                //     left: 200,
                                //   ),
                                //   child: OutlineButton(
                                //     child: Text(
                                //       translation.getTranslatedText(
                                //           context, "More Details"),
                                //       style: GoogleFonts.poppins(
                                //         fontSize: 20.0,
                                //         color: darkBlue,
                                //       ),
                                //     ),
                                //     highlightedBorderColor: darkBlue,
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius:
                                //         BorderRadius.circular(
                                //             10)),
                                //     borderSide: BorderSide(
                                //         color: darkBlue, width: 2),
                                //     onPressed: () {},
                                //   ),
                                // ),
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
