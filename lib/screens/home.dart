import 'package:fishies_sih/utils/colors.dart' as colors;
import 'package:fishies_sih/utils/constants.dart' as constants;
import 'package:fishies_sih/widgets/landings_listview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: colors.scaffoldColor,
      height: double.maxFinite,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 100.0, bottom: 20, left: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Mr. Name',
                          style: GoogleFonts.nunito(
                              fontSize: 30,
                              color: colors.primaryTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Choose an option',
                          style: GoogleFonts.nunito(
                              fontSize: 17, color: colors.primaryTextColor),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  'Previous Landings',
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      color: colors.primaryTextColor,
                      fontSize: 25),
                ),
              ),
              const LandingsListView(),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: colors.alternateButtonColor),
                    child: SizedBox(
                      height: 130,
                      width: double.maxFinite,
                      child: Center(
                          child: Text(
                        'Capture Images',
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: colors.alternateButtonColor),
                    child: SizedBox(
                      height: 130,
                      width: double.maxFinite,
                      child: Center(
                          child: Text('Go Fishing',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold, fontSize: 30))),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
