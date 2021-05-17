import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/map.dart';
import 'package:pycare/components/my_appbar.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:pycare/providers/fetch_data.dart';
import 'package:pycare/providers/translation.dart';

class HomeMap extends StatefulWidget {
  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<FetchData, TranslationText>(
        builder: (context, api, translation, child) {
      return Scaffold(
        appBar: MyAppBar(
          title: translation.getTranslatedText(context, 'LOCATION'),
        ),
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(11.9416, 79.8083),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/{z}/{x}/{y}?access_token={accessToken}",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoiYXl1c2h2ZWQ3OCIsImEiOiJja29tYzI0MmwwbnY2Mm9wZWZicnhjaHJhIn0.psTv4THsbl4IACawQVW_pA',
                  'id': 'mapbox.light-v10'
                }),
            new MarkerLayerOptions(
              markers: [
                Marker(
                  width: 100.0,
                  height: 250.0,
                  point: new LatLng(12.0463, 79.8551),
                  builder: (ctx) => new Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: new IconButton(
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
                                      topLeft: const Radius.circular(20.0),
                                      topRight: const Radius.circular(20.0),
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
                                                padding: const EdgeInsets.only(
                                                  top: 10.0,
                                                  left: 10.0,
                                                ),
                                                child: Container(
                                                  width: 300.0,
                                                  child: Text(
                                                    translation.getTranslatedText(
                                                        context,
                                                        'Pondicherry Institute of Medical Sciences'),
                                                    maxLines: 10,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // IconButton(
                                              //   icon: Icon(
                                              //     FontAwesomeIcons.directions,
                                              //     size: 50,
                                              //     color: darkBlue,
                                              //   ),
                                              //   onPressed: () {},
                                              // ),
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
                                            padding: const EdgeInsets.only(
                                              top: 0.0,
                                              left: 8.0,
                                              right: 175.0,
                                              bottom: 10.0,
                                            ),
                                            child: Text(
                                              translation.getTranslatedText(
                                                  context, 'Bed Availiblity'),
                                              maxLines: 1,
                                              // textAlign: ,
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.poppins(
                                                fontSize: 30.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          // THE COUNT ZONE
                                          Center(
                                            child: MapComponent(
                                              oxygenBedCount: 8,
                                              ventilatorBedCount: 4,
                                              isolationBedCount: 33,
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            margin: EdgeInsets.all(25),
                                            padding: EdgeInsets.only(
                                              left: 200,
                                            ),
                                            child: OutlineButton(
                                              child: Text(
                                                translation.getTranslatedText(
                                                    context, "More Details"),
                                                style: GoogleFonts.poppins(
                                                  fontSize: 20.0,
                                                  color: darkBlue,
                                                ),
                                              ),
                                              highlightedBorderColor: darkBlue,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              borderSide: BorderSide(
                                                  color: darkBlue, width: 2),
                                              onPressed: () {},
                                            ),
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
                          color: red,
                          size: 45,
                        )),
                  ),
                ),
                //PHC
              ],
            ),
          ],
        ),
      );
    });
  }
}
