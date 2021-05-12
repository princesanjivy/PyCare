import 'package:flutter/material.dart';
import 'package:pycare/Components/my_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Size preferredSize;
  MyAppBar({this.title}) : preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      centerTitle: true,
      backgroundColor: appBarCol,
      title: Text(
        title,
        style: GoogleFonts.poppins(),
      ),
    );
  }
}
