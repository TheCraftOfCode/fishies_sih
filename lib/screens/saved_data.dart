import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fishies_sih/widgets/appbar_with_back_button.dart';
import 'package:fishies_sih/utils/colors.dart' as colors;
import 'package:fishies_sih/utils/constants.dart' as constants;

class SavedDataPage extends StatefulWidget {
  String resp='Name';
  SavedDataPage( {Key? key,required this.resp} ): super(key: key);
  @override
  _SavedDataPageState createState() => _SavedDataPageState();
}

class _SavedDataPageState extends State<SavedDataPage> {

  @override
  Widget build(BuildContext context) {
    var landingsMap = {
      'species': widget.resp,
      'date': '14 Mar 2022',
      'weight': 30
    };

    var allLandingsMap = [
      landingsMap,
    ];
    return Container(
      color: colors.scaffoldColor,
      height: double.maxFinite,
      child: Scaffold(
          appBar: AppBarBackButton('Saved Data'),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}
