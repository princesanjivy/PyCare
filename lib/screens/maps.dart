import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/marker.dart';
import 'package:pycare/components/my_appbar.dart';
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
      List<Marker> markers = api.hospitalDetails.map((data) {
        return PlaceMarker(
          hospitalName: data["hospitalName"],
          isolationBeds: data["isolationBeds"]["vacant"],
          lat: data["lat"],
          long: data["long"],
          oxygenBeds: data["oxygenBeds"]["vacant"],
          ventilatorBeds: data["ventilatorBeds"]["vacant"],
        ).build(context);
      }).toList();

      return Scaffold(
        appBar: MyAppBar(
          title: translation.getTranslatedText(context, 'LOCATION'),
        ),
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(11.9416, 79.8083),
            zoom: 12.5,
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
            MarkerLayerOptions(
              markers: markers,
            ),
          ],
        ),
      );
    });
  }
}
