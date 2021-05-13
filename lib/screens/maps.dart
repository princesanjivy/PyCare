import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:pycare/Components/my_appbar.dart';
import 'package:pycare/Components/my_colors.dart';
import 'package:pycare/models/mapmodel.dart';

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
              new Marker(
                width: 100.0,
                height: 100.0,
                point: new LatLng(11.9416, 79.8083),
                builder: (ctx) => new Container(
                  //color: Color(0xFF737373),
                  child: new IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return Container(
                                color: Colors.transparent,
                                child: mcon(),
                              );
                            });
                      },
                      icon: Icon(Icons.pin_drop)),
                ),
              ),
              Marker(
                width: 100.0,
                height: 100.0,
                point: new LatLng(12.0463, 79.8551),
                builder: (ctx) => new Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: new IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return mcon();
                            });
                      },
                      icon: Icon(Icons.pin_drop)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
