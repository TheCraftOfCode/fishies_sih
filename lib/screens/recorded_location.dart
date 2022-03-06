import 'package:fishies_sih/screens/go_fishing.dart';
import 'package:fishies_sih/utils/colors.dart' as colors;
import 'package:fishies_sih/utils/constants.dart' as constants;
import 'package:fishies_sih/widgets/landings_listview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/alert_dialog.dart';

class RecordedLocation extends StatefulWidget {
  const RecordedLocation({Key? key}) : super(key: key);

  @override
  State<RecordedLocation> createState() => _RecordedLocationState();
}

class _RecordedLocationState extends State<RecordedLocation> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GoFishing()));
            },
          ),

          title: Text(
            "FISHING",
            style:
            GoogleFonts.nunito(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(padding: EdgeInsets.all(8.0),
                child: AppBar(
                  title: Row(
                    children: [
                      Text("Turn Left",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        ),),
                      Spacer(),
                      Text("3.1nm",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        ),),
                    ],
                  ),
                  leading: Icon(Icons.arrow_back_ios_outlined, size: 30,),
                ),
              ),
            ),
            Expanded(child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.85,
                  color: colors.textBoxColor,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Location 1 has been successfully recorded",
                  style: GoogleFonts.nunito(
                    fontSize: 18,
color: colors.primaryTextColor
                  ),
                  ),

                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.85,
                  color: colors.textBoxColor,
                ),
              ],
            ),

              flex: 4,),
            Expanded(child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                  child: ElevatedButton(
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => GoFishing()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: colors.alternateButtonColor),
                      child: SizedBox(
                        height: 50,
                        width: double.maxFinite,
                        child: Center(
                            child: Text('Record Another location',
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold, fontSize: 25))),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                  child: ElevatedButton(
                      onPressed: () {

                        displayDialog(context, "Yes", "No", (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GoFishing()));
                        }, 'End this trip', 'Are you sure you want to end this trip?');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: colors.endButtonColor),
                      child: SizedBox(
                        height: 50,
                        width: double.maxFinite,
                        child: Center(
                            child: Text('End Trip',
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold, fontSize: 30))),
                      )),
                )
              ],
            ),
              flex: 2,)
          ],
        ),
      ),
    );
  }
}
