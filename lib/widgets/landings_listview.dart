import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fishies_sih/utils/constants.dart' as constants;
import 'package:fishies_sih/utils/colors.dart' as colors;

class LandingsListView extends StatefulWidget {
  const LandingsListView({Key? key}) : super(key: key);

  @override
  State<LandingsListView> createState() => _LandingsListViewState();
}

class _LandingsListViewState extends State<LandingsListView> {

  var landingsMap = {
    'species': 'Fish species name',
    'date': '26 Feb 2022',
    'weight': 30
  };



  @override
  Widget build(BuildContext context) {

    var allLandingsMap = [
      landingsMap,
      landingsMap,
      landingsMap,
      landingsMap,
      landingsMap,
      landingsMap,
      landingsMap,
      landingsMap
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        child: SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: allLandingsMap.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                allLandingsMap[i]['species']
                                    .toString(),
                                style: constants.textNormalStyle,
                              ),
                              Text(
                                allLandingsMap[i]['date']
                                    .toString(),
                                style: constants.textNormalStyle,
                              ),
                            ],
                          ),
                          Text(
                            "${allLandingsMap[i]['weight'].toString()} Kg",
                            style: constants.textNormalStyle,
                          )
                        ],
                      ),
                      Divider(
                        color: colors.textBoxTextColor,
                        thickness: 1,
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

