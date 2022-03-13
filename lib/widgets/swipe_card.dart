import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';


import 'package:fishies_sih/utils/colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';
class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage>
    with TickerProviderStateMixin {
  List<String> Locations = [
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",

  ];
  List<String> Dates = [
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",

  ];
  List<String> KGs = [
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",
    "Location 1",

  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: new TinderSwapCard(
        swipeUp: true,
        swipeDown: true,
        orientation: AmassOrientation.BOTTOM,
        totalNum: Locations.length,
        stackNum: 3,
        swipeEdge: 5.0,
        maxWidth: MediaQuery.of(context).size.width * 0.9,
        maxHeight: MediaQuery.of(context).size.width * 0.63,
        minWidth: MediaQuery.of(context).size.width * 0.5,
        minHeight: MediaQuery.of(context).size.width * 0.62,
        cardBuilder: (context, index) => Card(
          color: colors.textBoxColor,
          child:  ListTile(
            textColor: colors.primaryTextColor,
            title: Text(Locations[index], style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.bold,

            ),),
            subtitle: Center(
              child: Row(
               children: [
                 Text(Dates[index], style: GoogleFonts.nunito(
                   fontSize: 18,

                 ),
                 ),
                 Spacer(),
                 Text(KGs[index], style: GoogleFonts.nunito(
                   fontSize: 18,

                 ),
                 ),
               ],
              ),
            ),
          ),
        ),
        cardController: controller = CardController(),
        swipeUpdateCallback:
            (DragUpdateDetails details, Alignment align) {
          /// Get swiping card's alignment
          if (align.x < 0) {
            //Card is LEFT swiping
          } else if (align.x > 0) {
            //Card is RIGHT swiping
          }
        },
        swipeCompleteCallback:
            (CardSwipeOrientation orientation, int index) {
          /// Get orientation & index of swiped card!
        },
      ),
    );
  }
}