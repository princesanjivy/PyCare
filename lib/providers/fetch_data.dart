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
        await http.get(Uri.parse(uri + "/hospitalDetails"));
    hospitalDetails = jsonDecode(response1.body);

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
