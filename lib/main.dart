
import 'package:fishies_sih/screens/home.dart';
import 'package:fishies_sih/utils/themes.dart';
import 'package:fishies_sih/widgets/load_valid_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'screens/login.dart';

//TODO: Change Icons in each tiles in home page
//TODO: Fill about pages
//TODO: Add widget to generate list


Future<void> main() async {


  runApp(OKToast(
    position: ToastPosition.center,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme.DarkTheme,
      home: const LoadValidPageWidget(LoginPage(), HomePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}





//TODO: Change home page nav bar
//TODO: Dialogue asking lose changes blah blah using alert_dialog widget
//TODO: Add progress wheels for buttons
