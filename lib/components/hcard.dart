import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/my_text.dart';
import 'package:pycare/providers/translation.dart';

class HCard extends StatelessWidget {
  final int count;
  final Color color;
  final String title;
  final String percentage;

  HCard({
    this.title,
    this.percentage,
    this.count,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TranslationText>(builder: (context, translation, _) {
      return Container(
        width: MediaQuery.of(context).size.width / 2.3,
        height: MediaQuery.of(context).size.width / 3,
        padding: EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              text: this.count.toString(),
              size: 32,
              color: Colors.white,
              fontWeight: "BOLD",
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: title,
                  size: 14,
                  color: Colors.white,
                ),
                MyText(
                  text: percentage == null ? "" : percentage.toString() + "%",
                  size: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      );
    });
    // return LayoutBuilder(
    //   builder: (context, constraints) {
    //     return Container(
    //       width: constraints.maxWidth / 2 - 10,
    //       decoration: BoxDecoration(
    //         // color: Colors.white,
    //         borderRadius: BorderRadius.circular(8),
    //       ),
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(
    //                 // top: 10.0,
    //                 bottom: 0.0,
    //               ),
    //               child: Text(
    //                 "$count \n",
    //                 style: GoogleFonts.poppins(
    //                   fontSize: 45.0,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //             ),
    //             SizedBox(
    //               height: 5.0,
    //             ),
    //             Row(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(
    //                     left: 8.0,
    //                     bottom: 8.0,
    //                     top: 10.0,
    //                   ),
    //                   child: Text(
    //                     title,
    //                     textAlign: TextAlign.start,
    //                     maxLines: 1,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: GoogleFonts.poppins(
    //                       color: Colors.white,
    //                       fontSize: 20.0,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: 30.0,
    //                 ),
    //                 Text(
    //                   "$percentage %",
    //                   textAlign: TextAlign.end,
    //                   maxLines: 1,
    //                   overflow: TextOverflow.ellipsis,
    //                   style: GoogleFonts.poppins(
    //                     color: Colors.white,
    //                     fontSize: 20.0,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
