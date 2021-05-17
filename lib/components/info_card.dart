import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pycare/providers/translation.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final String role;
  final String imgLink;
  final String mailLink;
  final String instaLink;
  final String linkedInLink;
  final String portfolioLink;
  final String githubLink;
  final String fbLink;

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
    return Consumer<TranslationText>(builder: (context, translation, child) {
      return Card(
        color: Colors.transparent,
        elevation: 4,
        //margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          //height: 900,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [darkBlue, grad2],
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CachedNetworkImage(
                  imageUrl: '$imgLink',
                  imageBuilder: (context, imageProvider) => Container(
                    width: 74,
                    height: 74,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.fill),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(
                translation.getTranslatedText("$name"),
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    //height: 2,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                translation.getTranslatedText("$role"),
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    height: 1,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
    });
  }
}
