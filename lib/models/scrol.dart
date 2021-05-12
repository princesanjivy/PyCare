import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class horz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          deck(
            image_location: 'images/prec.png',
            image_caption: 'Prevention is better \nthan cure.',
          ),
          deck(
            image_location: 'images/mask.png',
            image_caption: 'Don\'t forget to wear \n your Mask.',
          ),
          deck(
            image_location: 'images/sanitize_hand.png',
            image_caption: 'Ensure you sanitize \n your hands regularly.',
          ),
          deck(
            image_location: 'images/wash_hand.png',
            image_caption: 'Wash your hands \n regularly',
          ),
          deck(
            image_location: 'images/hand.png',
            image_caption: 'Use Gloves when \n required.',
          ),
          deck(
            image_location: 'images/vaccinated.png',
            image_caption: 'Get Vaccinated..',
          ),
        ],
      ),
    );
  }
}

class deck extends StatelessWidget {
  final String image_location;
  final String image_caption;
  deck({this.image_location, this.image_caption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        bottom: 50.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.lightBlueAccent),
        height: 400.0,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 150.0,
                child: ListTile(
                  title: Image.asset(
                    image_location,
                    height: 250.0,
                    width: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  image_caption,
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
