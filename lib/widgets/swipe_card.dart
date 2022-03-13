import 'package:fishies_sih/utils/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fishies_sih/utils/data_model.dart';

class SwipeCard extends StatefulWidget {
  const SwipeCard({Key? key}) : super(key: key);

  @override
  _SwipeCardState createState() => _SwipeCardState();
}



class _SwipeCardState extends State<SwipeCard> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    final List<LocationData> locationArray = [
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    LocationData("locationID", 171.156345, 171.156345, "date", 20.4),
    ];



    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23,
      child: PageView.builder(
        itemCount: 14,
        itemBuilder: (context, index) => Card(
          color: colors.textBoxColor,
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            textColor: colors.primaryTextColor,
            title: Text(
              locationArray[index].locationID,
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Center(
              child: Row(
                children: [
                  Text(
                    locationArray[index].date,
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    locationArray[index].weight.toString(),
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
