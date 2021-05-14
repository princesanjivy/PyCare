import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final String fontWeight;

  MyText({this.text, this.color, this.size, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    FontWeight finalWeight = FontWeight.normal;
    if (this.fontWeight == 'BOLD') {
      finalWeight = FontWeight.bold;
    }
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: finalWeight,
      ),
    );
  }
}
