import 'package:flutter/material.dart';
import 'package:fishies_sih/utils/colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

displayDialog(context, positiveText, negativeText, Function positiveFunction,
    title, subTitle) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: colors.primaryTextColor,
      title: Text(
        title,
        style: GoogleFonts.raleway(color: colors.alertBoxTextColor, fontWeight: FontWeight.bold),
      ),
      content: Text(
        subTitle,
        style: GoogleFonts.raleway(color: colors.alertBoxTextColor),
      ),
      actions: <Widget>[
        negativeText != null
            ? ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: colors.noButtonColor
          ),

          child: Text(
            negativeText,
            style: GoogleFonts.raleway(color: colors.primaryTextColor, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
            : Container(),
        ElevatedButton(
style: ElevatedButton.styleFrom(
  primary: colors.yesButtonColor
),
          child: Text(positiveText,
              style: TextStyle(color: colors.alertBoxTextColor, fontWeight: FontWeight.bold)),
          onPressed: () async {
            positiveFunction();
          },
        ),
      ],
    ),
  );
}
