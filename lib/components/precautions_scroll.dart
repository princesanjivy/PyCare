import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PrecautionScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: [
        Deck(
          imageLocation: 'images/mask.png',
          imageCaption: 'Don\'t forget to wear \nyour Mask',
        ),
        Deck(
          imageLocation: 'images/sanitize_hand.png',
          imageCaption: 'Ensure you sanitize \nyour hands regularly',
        ),
        Deck(
          imageLocation: 'images/wash_hand.png',
          imageCaption: 'Wash your hands \nregularly',
        ),
        Deck(
          imageLocation: 'images/hand.png',
          imageCaption: 'Use Gloves when \nrequired',
        ),
        Deck(
          imageLocation: 'images/vaccinated.png',
          imageCaption: 'Get \nVaccinated',
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
                  imageCaption,
                  style:
                      GoogleFonts.poppins(fontSize: 16.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
