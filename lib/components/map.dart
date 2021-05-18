import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:pycare/components/my_text.dart';
import 'package:pycare/providers/translation.dart';

class MapComponent extends StatelessWidget {
  final int oxygenBedCount;
  final int ventilatorBedCount;
  final int isolationBedCount;

  MapComponent({
    this.oxygenBedCount,
    this.ventilatorBedCount,
    this.isolationBedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TranslationText>(builder: (context, translation, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: green,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: translation.getTranslatedText(
                          context, oxygenBedCount.toString()),
                      fontWeight: 'BOLD',
                      color: Colors.black,
                      size: 25,
                    ),
                    Text(
                      translation.getTranslatedText(context, 'Oxygen Beds'),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: yellow,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: translation.getTranslatedText(
                        context, ventilatorBedCount.toString()),
                    fontWeight: 'BOLD',
                    color: Colors.black,
                    size: 25,
                  ),
                  Text(
                    translation.getTranslatedText(context, 'Ventilator Beds'),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: lightBlue,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: translation.getTranslatedText(
                        context, isolationBedCount.toString()),
                    fontWeight: 'BOLD',
                    color: Colors.black,
                    size: 25,
                  ),
                  Text(
                    translation.getTranslatedText(context, 'Isolation Beds'),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
