import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchData with ChangeNotifier {
  bool loading = false;
  final String uri = "https://pycare-api.herokuapp.com";

  Map status;
  List hospitalDetails;

  FetchData() {
    getAllData();
  }

  getAllData() async {
    loading = true;

    http.Response response = await http.get(Uri.parse(uri + "/status"));
    status = jsonDecode(response.body)[0];

    http.Response response1 =
        await http.get(Uri.parse(uri + "/hospitalDetails?sort=hospitalName"));
    hospitalDetails = jsonDecode(response1.body);

    hospitalDetails = hospitalDetails.reversed.toList();
    print(hospitalDetails.length);

    // http.Response response2 =
    //     await http.get(Uri.parse(uri + "/translation"), headers: {
    //   "Content-Type": "application/json",
    //   "Accept-Charset": "utf-8",
    // });
    // print(utf8.decode(utf8.encode(response2.body)));
    //
    // translation = jsonDecode(response2.body);

    loading = false;
    notifyListeners();
  }

  getStatusData() async {
    loading = true;

    http.Response response = await http.get(Uri.parse(uri + "/status"));
    status = jsonDecode(response.body)[0];

    loading = false;
    notifyListeners();
  }

  getHospitalData() async {
    loading = true;

    http.Response response =
        await http.get(Uri.parse(uri + "/hospitalDetails"));
    hospitalDetails = jsonDecode(response.body);

    print(hospitalDetails);

    loading = false;
    notifyListeners();
  }
}
