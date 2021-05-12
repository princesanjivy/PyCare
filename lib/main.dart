import 'package:flutter/material.dart';
import 'package:pycare/screens/hospitals_list.dart';

void main() => runApp(
      MaterialApp(
        home: PyCare(),
        theme: ThemeData(
          dividerTheme: DividerThemeData(
            color: Colors.black26,
            thickness: 1,
          ),
        ),
      ),
    );

class PyCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hospitals();
  }
}
