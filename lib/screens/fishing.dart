import 'package:fishies_sih/widgets/alert_dialog.dart';
import 'package:fishies_sih/widgets/dropdown.dart';
import 'package:fishies_sih/widgets/swipe_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fishies_sih/utils/colors.dart' as colors;
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'go_fishing.dart';

class Fishing extends StatefulWidget {
  const Fishing({Key? key}) : super(key: key);

  @override
  State<Fishing> createState() => _FishingState();
}

class _FishingState extends State<Fishing> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  void showToast(){
    print("hi");
    Fluttertoast.showToast(
        msg: "Location has been successfully recorded",

        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        // backgroundColor: Colors.red,
        //textColor: Colors.white,
        webPosition: "center",
        fontSize: 16.0
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => GoFishing()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Padding(padding: EdgeInsets.all(12.0),
              child:  Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 30,),
                  Spacer(),
                  Text("Turn Left",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: colors.primaryTextColor,
                        fontSize: 30
                    ),),
                  Spacer(),
                  Text("3.1nm",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: colors.primaryTextColor,
                        fontSize: 30
                    ),),
                ],
              ),
              ),
            ),
            Expanded(child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.85,
              color: colors.textBoxColor,

              child:  GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
            flex: 4,),
            Expanded(child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                  child: ElevatedButton(
                      onPressed:  showToast,
                      style: ElevatedButton.styleFrom(
                          primary: colors.alternateButtonColor),
                      child: SizedBox(
                        height: 50,
                        width: double.maxFinite,
                        child: Center(
                            child: Text('Record location',
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold, fontSize: 30))),
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
