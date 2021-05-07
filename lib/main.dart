import 'package:flutter/material.dart';
import 'package:pycare/screens/hospital_info.dart';
import 'package:pycare/screens/admin_update_info.dart';

void main() => runApp(MaterialApp(home: PyCare()));

class PyCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdminUpdateInfo();
  }
}
