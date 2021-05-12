import 'package:first_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class InfoCard extends StatelessWidget {
  String name;
  String role;
  String imgLink;
  String mailLink;
  String instaLink;
  String linkedInLink;
  String portfolioLink;
  String githubLink;
  String fbLink;

  InfoCard(this.name, this.role, this.imgLink, this.mailLink, this.instaLink,
      this.linkedInLink, this.portfolioLink, this.githubLink, this.fbLink);

  _openMail(String mailLnk) async {
    if (await canLaunch("mailto:$mailLnk"))
      launch("mailto:$mailLnk");
    else
      print("URL can't be launched");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      //margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: borderBlue,
          width: 1,
        ),
      ),
      child: Container(
        //height: 900,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [darkBlue, bgColor],
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey[350],
                backgroundImage: CachedNetworkImageProvider('$imgLink'),
              ),
            ),
            Text(
              "$name",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  //height: 2,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "$role",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  height: 1,
                  color: Colors.white,
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              //spacing: 5.0,
              //runSpacing: 3.0,
              children: [
                if (mailLink != null)
                  IconButton(
                    icon: Icon(FontAwesomeIcons.envelope),
                    iconSize: 20,
                    onPressed: () {
                      _openMail(mailLink);
                    },
                  ),
                //if (mailLink != null) SizedBox(width: 1),
                if (instaLink != null)
                  IconButton(
                    icon: Icon(FontAwesomeIcons.instagram),
                    iconSize: 20,
                    onPressed: () {
                      launch(instaLink);
                    },
                  ),
                //if (instaLink != null) SizedBox(width: 1),
                if (linkedInLink != null)
                  IconButton(
                    icon: Icon(FontAwesomeIcons.linkedin),
                    iconSize: 20,
                    onPressed: () {
                      launch(linkedInLink);
                    },
                  ),
                //if (linkedInLink != null) SizedBox(width: 1),
                if (portfolioLink != null)
                  IconButton(
                    icon: Icon(FontAwesomeIcons.globe),
                    iconSize: 20,
                    onPressed: () {
                      launch(portfolioLink);
                    },
                  ),
                //if (portfolioLink != null) SizedBox(width: 1),
                if (githubLink != null)
                  IconButton(
                    icon: Icon(FontAwesomeIcons.github),
                    iconSize: 20,
                    onPressed: () {
                      launch(githubLink);
                    },
                  ),
                //if (githubLink != null) SizedBox(width: 1),
                if (fbLink != null)
                  IconButton(
                    icon: Icon(FontAwesomeIcons.facebook),
                    iconSize: 20,
                    onPressed: () {
                      launch(fbLink);
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
