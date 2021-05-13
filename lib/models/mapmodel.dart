import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pycare/Components/my_colors.dart';
import 'package:pycare/Components/my_text.dart';

class mcon extends StatelessWidget {
  // final int icb;
  final int ocb;
  final int vnb;
  final int ocy;

  mcon({
    this.ocb,
    this.vnb,
    this.ocy,
  });
  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        // Oxygen Beds
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10.0,
                            right: 10.0,
                            left: 10.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            height: 110,
                            width: 110,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 5.0,
                                  ),
                                  child: Text(
                                    ocb.toString(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 9.0),
                                  child: Text(
                                    'Oxygen \nBeds',
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Ventilator beds
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: yellow,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            height: 110,
                            width: 110,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 5.0,
                                  ),
                                  child: Text(
                                    vnb.toString(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 9.0),
                                  child: Text(
                                    'Ventilator Beds',
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Ventilator Beds

                        // Oxygen Cylinders
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            bottom: 10.0,
                            right: 20.0,
                          ),
                          child: Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                              color: lightBlue,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 5.0,
                                  ),
                                  child: Text(
                                    ocy.toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 9.0),
                                  child: Text(
                                    'Oxygen Cylinder',
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // ANOTHER MODAL
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.only(
              //       left: 50.0,
              //     ),
              //     child: Row(
              //       children: [
              //         //Ventilator beds
              //         Padding(
              //           padding: const EdgeInsets.only(
              //             bottom: 10.0,
              //           ),
              //           child: Container(
              //             decoration: BoxDecoration(
              //               color: yellow,
              //               borderRadius: BorderRadius.circular(10.0),
              //             ),
              //             height: 100,
              //             width: 150,
              //             child: Column(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.only(top: 15.0),
              //                   child: MyText(
              //                     text: vnb.toString(),
              //                     size: 26,
              //                     fontWeight: 'BOLD',
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.only(bottom: 15.0),
              //                   child: MyText(
              //                     text: 'Ventilator Beds',
              //                     size: 18,
              //                     fontWeight: 'BOLD',
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //         // Oxygen Cylinders
              //         Padding(
              //           padding: const EdgeInsets.only(
              //             left: 10.0,
              //             bottom: 10.0,
              //           ),
              //           child: Container(
              //             height: 100,
              //             width: 150,
              //             decoration: BoxDecoration(
              //               color: shittyPink,
              //               borderRadius: BorderRadius.circular(10.0),
              //             ),
              //             child: Column(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.only(top: 15.0),
              //                   child: MyText(
              //                     text: ocy.toString(),
              //                     size: 26,
              //                     fontWeight: 'BOLD',
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.only(bottom: 15.0),
              //                   child: MyText(
              //                     text: 'Oxygen Cylinders',
              //                     size: 16,
              //                     fontWeight: 'BOLD',
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //         // THE END
              //       ],
              //     ),
              //   ),
              // ),
              // MODAL ENDS HERE
            ],
          ),
        ),
      ),
    );
  }
}
