import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pycare/providers/translation.dart';

class PrecautionScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        autoPlayInterval: Duration(
          seconds: 2,
        ),
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: [
        Deck(
          imageLocation: 'images/mask.png',
          imageCaption: 'Don\'t forget to wear your Mask',
        ),
        Deck(
          imageLocation: 'images/sanitize_hand.png',
          imageCaption: 'Ensure you sanitize your hands regularly',
        ),
        Deck(
          imageLocation: 'images/wash_hand.png',
          imageCaption: 'Wash your hands regularly',
        ),
        Deck(
          imageLocation: 'images/hand.png',
          imageCaption: 'Use Gloves when required',
        ),
        Deck(
          imageLocation: 'images/vaccinated.png',
          imageCaption: 'Get Vaccinated',
        )
      ],
    );
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
    return Consumer<TranslationText>(builder: (context, translation, _) {
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
          width: 250,
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
                    translation.getTranslatedText(context, imageCaption),
                    style: GoogleFonts.poppins(
                        fontSize: 16.0, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
