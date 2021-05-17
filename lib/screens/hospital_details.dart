import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/my_appbar.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:pycare/components/my_text.dart';
import 'package:pycare/providers/fetch_data.dart';
import 'package:pycare/providers/translation.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalDetails extends StatefulWidget {
  final String imgLink;
  final String hospitalName;
  final String instituteType;
  final String oxygenBeds;
  final String ventilatorBeds;
  final String isolationBeds;
  final String address;
  final List contactNos;

  HospitalDetails(
      {this.imgLink,
      this.hospitalName,
      this.instituteType,
      this.oxygenBeds,
      this.ventilatorBeds,
      this.isolationBeds,
      this.address,
      this.contactNos});

  @override
  _HospitalDetailsState createState() => _HospitalDetailsState();
}

class _HospitalDetailsState extends State<HospitalDetails> {
  @override
  void initState() {
    super.initState();
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer2<FetchData, TranslationText>(
        builder: (context, api, translation, child) {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: MyAppBar(
          title: translation.getTranslatedText(context, 'HOSPITAL DETAILS'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.imgLink,
                    imageBuilder: (context, imageProvider) => Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            MyText(
                              text: translation.getTranslatedText(
                                  context, widget.hospitalName),
                              color: Colors.black,
                              size: 15,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              translation.getTranslatedText(
                                      context, 'INSTITUTE TYPE') +
                                  ": ",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            MyText(
                              text: widget.instituteType,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                translation.getTranslatedText(
                                        context, 'AVAILABILITY OF') +
                                    ": ",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MyText(
                                              text:
                                                  translation.getTranslatedText(
                                                      context,
                                                      widget.oxygenBeds),
                                              fontWeight: 'BOLD',
                                              color: Colors.black,
                                              size: 25,
                                            ),
                                            Text(
                                              translation.getTranslatedText(
                                                  context, 'Oxygen Beds'),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MyText(
                                            text: translation.getTranslatedText(
                                                context, widget.ventilatorBeds),
                                            fontWeight: 'BOLD',
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                          Text(
                                            translation.getTranslatedText(
                                                context, 'Ventilator Beds'),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MyText(
                                            text: translation.getTranslatedText(
                                                context, widget.isolationBeds),
                                            fontWeight: 'BOLD',
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                          Text(
                                            translation.getTranslatedText(
                                                context, 'Oxygen Cylinders'),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 125,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                translation.getTranslatedText(
                                        context, 'ADDRESS') +
                                    ": ",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.address,
                                style: GoogleFonts.poppins(),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: darkBlue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashColor: Colors.white,
                                        radius: 900,
                                        onTap: () {}, //Navigate to Maps Page
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          width: 80,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.near_me_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Text(
                              translation.getTranslatedText(
                                      context, 'PHONE NUMBER') +
                                  ": ",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.contactNos.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(9),
                                  onTap: () {
                                    _launchURL(
                                        'tel:' + widget.contactNos[index]);
                                  }, //Redirect to Dialer

                                  radius: 300,
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xFF9DC6FF),
                                      ),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        child: Row(
                                          children: [
                                            MyText(
                                              text:
                                                  translation.getTranslatedText(
                                                      context,
                                                      widget.contactNos[index]),
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: width * 0.55),
                                            Icon(
                                              Icons.call,
                                              color: green,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
