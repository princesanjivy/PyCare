import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong/latlong.dart';
import 'package:pycare/components/map.dart';
import 'package:pycare/components/my_appbar.dart';
import 'package:pycare/components/my_colors.dart';

class HomeMap extends StatefulWidget {
  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'LOCATION',
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(11.9416, 79.8083),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
              // urlTemplate: "https://api.tiles.mapbox.com/v4/"
              //     "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
              // "https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/{z}/{x}/{y}?access_token={accessToken}"
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/{z}/{x}/{y}?access_token={accessToken}",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoiYXl1c2h2ZWQ3OCIsImEiOiJja29tYzI0MmwwbnY2Mm9wZWZicnhjaHJhIn0.psTv4THsbl4IACawQVW_pA',
                'id': 'mapbox.light-v10'
              }),
          new MarkerLayerOptions(
            markers: [
              // 19 Hospitals 19 markers
              //PIMS
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
                                        //UPPER SECTION
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
                                                  'Pondicherry Institute of Medical Sciences',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: red,
                        size: 45,
                      )),
                ),
              ),

              //SVMC
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(10.773430, 76.388520),
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
                                        //UPPER SECTION
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
                                                  'Sri Vanakalum Medical College',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: shittyPink,
                        size: 45,
                      )),
                ),
              ),

              //MGMC
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(11.934110, 79.808040),
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
                                        //UPPER SECTION
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
                                                  'Mahatama Gandhi Medical College',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: lightBlue,
                        size: 45,
                      )),
                ),
              ),

              //SLIMS
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(11.9382, 79.7360),
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
                                        //UPPER SECTION
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
                                                  'SLIMS',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: grad1,
                        size: 45,
                      )),
                ),
              ),

              //SMVMC
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(11.9213, 79.6281),
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
                                        //UPPER SECTION
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
                                                  'SMVMC',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: bgColor,
                        size: 45,
                      )),
                ),
              ),

              //AVMC
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
                                        //UPPER SECTION
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
                                                  'Pondicherry Institute of Medical Sciences',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: red,
                        size: 45,
                      )),
                ),
              ),

              //IVMC
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(11.940763, 79.802373),
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
                                        //UPPER SECTION
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
                                                  'Indhra Gandhi Medical Colege',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: darkBlue,
                        size: 45,
                      )),
                ),
              ),

              //JIPMER
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(11.953376, 79.799646),
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
                                        //UPPER SECTION
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
                                                  'Jawaharlal Institute of Postgraduate Medical Education and Research,Government of India',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: green,
                        size: 45,
                      )),
                ),
              ),

              //Dental College
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(11.915401, 79.795929),
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
                                        //UPPER SECTION
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
                                                  'Dental College',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: Colors.pink,
                        size: 45,
                      )),
                ),
              ),

              //Mahe

              //Karaikal

              //Be Well Hospital
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(11.9508, 79.8153),
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
                                        //UPPER SECTION
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
                                                  'Be Well Hospital',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: Colors.cyan,
                        size: 45,
                      )),
                ),
              ),

              //Rani Hospital
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(11.9412, 79.8071),
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
                                        //UPPER SECTION
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
                                                  'Rani Hospital',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: Colors.brown,
                        size: 45,
                      )),
                ),
              ),

              //New Medical Center
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(11.9299, 79.8281),
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
                                        //UPPER SECTION
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
                                                  'New Medical Center',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: Colors.black,
                        size: 45,
                      )),
                ),
              ),

              //MVR
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(11.9550, 79.8225),
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
                                        //UPPER SECTION
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
                                                  'MVR Medical Center',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: Colors.blueGrey,
                        size: 45,
                      )),
                ),
              ),

              //IGGGH & PGI
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(11.9318, 79.8330),
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
                                        //UPPER SECTION
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
                                                  'IGGGH & PGI',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: Colors.orange,
                        size: 45,
                      )),
                ),
              ),

              //CHC
              Marker(
                width: 100.0,
                height: 250.0,
                point: new LatLng(11.889528, 79.763031),
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
                                        //UPPER SECTION
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
                                                  'Common Health Center Karikalampakkam',
                                                  maxLines: 10,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.directions,
                                                size: 50,
                                                color: darkBlue,
                                              ),
                                              onPressed: () {},
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
                                          padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 8.0,
                                            right: 175.0,
                                            bottom: 10.0,
                                          ),
                                          child: Text(
                                            'Bed Availiblity',
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
                                        MapComponent(
                                          // icb: 12,
                                          oxygenBedCount: 8,
                                          ventilatorBedCount: 4,
                                          isolationBedCount: 33,
                                        ),
                                        // BUTTON UP
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.all(25),
                                          padding: EdgeInsets.only(
                                            left: 200,
                                          ),
                                          child: OutlineButton(
                                            child: Text(
                                              "More Details",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.0,
                                                color: darkBlue,
                                              ),
                                            ),
                                            highlightedBorderColor: darkBlue,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                        Icons.pin_drop,
                        color: Colors.purple,
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
  }
}
