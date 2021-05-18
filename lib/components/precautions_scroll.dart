import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pycare/providers/translation.dart';

class PrecautionScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TranslationText>(builder: (context, translation, child) {
      return Container(
        height: 300.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Deck(
              imageLocation: 'images/mask.png',
              imageCaption: translation.getTranslatedText(
                  context, 'Don\'t forget to wear your Mask'),
            ),
            Deck(
                imageLocation: 'images/sanitize_hand.png',
                imageCaption: translation.getTranslatedText(
                  context,
                  'Ensure you sanitize your hands regularly',
                )),
            Deck(
                imageLocation: 'images/wash_hand.png',
                imageCaption: translation.getTranslatedText(
                  context,
                  'Wash your hands regularly',
                )),
            Deck(
                imageLocation: 'images/hand.png',
                imageCaption: translation.getTranslatedText(
                  context,
                  'Use Gloves when required',
                )),
            Deck(
                imageLocation: 'images/vaccinated.png',
                imageCaption: translation.getTranslatedText(
                  context,
                  'Get Vaccinated',
                )),
          ],
        ),
      );
    });
  }
}

class Deck extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Deck({
    this.imageLocation,
    this.imageCaption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        bottom: 32,
        left: 16,
        right: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.lightBlueAccent),
        height: 400,
        width: 200,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 150.0,
                child: ListTile(
                  title: Image.asset(
                    imageLocation,
                    height: 250.0,
                    width: 180.0,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  imageCaption,
                  style:
                      GoogleFonts.poppins(fontSize: 16.0, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
