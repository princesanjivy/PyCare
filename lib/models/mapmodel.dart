import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pycare/Components/my_colors.dart';

class mcon extends StatelessWidget {
  final int icb;
  final int ocb;
  final int vnb;
  final int ocy;
  final String name;

  mcon({
    this.name,
    this.icb,
    this.ocb,
    this.vnb,
    this.ocy,
  });
  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(20.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "$name",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.directions,
                color: darkBlue,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
