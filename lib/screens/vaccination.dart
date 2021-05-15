import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../components/my_appbar.dart';

class VaccineDrive extends StatefulWidget {
  @override
  _VaccineDriveState createState() => _VaccineDriveState();
}

class _VaccineDriveState extends State<VaccineDrive> {
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
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
  }
}
