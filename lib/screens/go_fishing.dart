import 'package:fishies_sih/screens/fishing.dart';
import 'package:fishies_sih/widgets/dropdown.dart';
import 'package:fishies_sih/widgets/swipe_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fishies_sih/utils/colors.dart' as colors;
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../widgets/custom_sliver_widget.dart';

class GoFishing extends StatefulWidget {
  const GoFishing({Key? key}) : super(key: key);

  @override
  _GoFishingState createState() => _GoFishingState();
}

class _GoFishingState extends State<GoFishing> {
  final items = ['species 1', 'species 2', 'species 3'];
  String? value = 'Pick Species';
  late CardController controller;
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return
        Container(
          color: colors.scaffoldColor,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                "GO FISHING",
                style:
                GoogleFonts.nunito(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                DropDownFormField(
                    list: items, title: 'Pick Species', hint: 'Pick a species'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.height * 0.8,
                    color: colors.textBoxColor,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Click on a location to see more details",
                    style: GoogleFonts.nunito(
                        fontSize: 18, color: colors.primaryTextColor),
                  ),
                ),
ExampleHomePage(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Fishing()));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: colors.alternateButtonColor),
                        child: SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.2,

                          child: Center(
                              child: Text(
                                'Choose',
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                        )),
                  ),
                ),
              ]),
            ),
          ),
        );


  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(item,
          style: GoogleFonts.poppins(
              color: colors.primaryTextColor.withOpacity(0.7))));
}

