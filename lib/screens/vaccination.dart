import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../components/my_appbar.dart';
import '../providers/fetch_data.dart';
import '../providers/translation.dart';

class VaccineDrive extends StatefulWidget {
  @override
  _VaccineDriveState createState() => _VaccineDriveState();
}

class _VaccineDriveState extends State<VaccineDrive> {
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Consumer2<FetchData, TranslationText>(
        builder: (context, api, translation, child) {
      return Scaffold(
        appBar: MyAppBar(
          title: 'Vaccine Drive',
        ),
        body: SafeArea(
          child: WebView(
            initialUrl: 'https://www.cowin.gov.in/home',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewcontroller) {
              _controller = webviewcontroller;
            },
          ),
        ),
      );
    });
  }
}
