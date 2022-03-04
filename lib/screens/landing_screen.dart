import 'package:fishies_sih/screens/login.dart';
import 'package:fishies_sih/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fishies_sih/utils/colors.dart' as colors;
import 'package:fishies_sih/utils/constants.dart' as constants;

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container(), flex: 4,),
            Expanded(child: Text('Find \nmy Fishies', style: GoogleFonts.nunito(fontSize: 50, fontWeight: FontWeight.bold, color: colors.primaryTextColor),), flex: 5,),
            Expanded(child: Text('Something comes here', style: TextStyle(color: colors.primaryTextColor),),flex: 4,),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpPage()));
                }, child: Text('SIGN UP', style: constants.iconTextStyle)),
                SizedBox(width: 20,),
                ElevatedButton(style: ElevatedButton.styleFrom(primary: colors.alternateButtonColor), onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                }, child: Text('SIGN IN', style: constants.alternateIconTextStyle,))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
