import 'package:fishies_sih/screens/home.dart';
import 'package:fishies_sih/utils/colors.dart' as colors;
import 'package:fishies_sih/widgets/custom_sliver_widget.dart';
import 'package:fishies_sih/widgets/error_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fishies_sih/utils/constants.dart' as constants;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  String error = "";

  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Container(
            color: colors.scaffoldColor,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              body: CustomSliverView(
                columnList: [
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Expanded(
                      flex: 4,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Container())
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 30),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome',
                                  style: GoogleFonts.nunito(
                                    color: colors.primaryTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                Padding(
                                    padding:
                                    const EdgeInsets.only(top: 1, bottom: 20),
                                    child: Text(
                                      'Register with Find my Fishies',
                                      style: GoogleFonts.nunito(
                                        color: colors.primaryTextColor,
                                        fontSize: 16,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: constants.textFieldPadding,
                          child: TextFormField(
                              controller: _nameController,
                              style: GoogleFonts.montserrat(
                                  color: colors.primaryTextColor),
                              validator: (value) {
                                if (value == "" || value == null) {
                                  return "Please enter a valid name";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                label: Text('Name',
                                    style: GoogleFonts.nunito(
                                        color: colors.textBoxTextColor,
                                        fontSize: 17)),
                                filled: true,
                                hintText: 'Enter your name',
                                hintStyle: GoogleFonts.poppins(
                                    color:
                                    colors.textBoxTextColor),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                                fillColor: colors.textBoxColor,
                                focusColor: colors.textBoxColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                              )),
                        ),
                        Padding(
                          padding: constants.textFieldPadding,
                          child: TextFormField(
                              controller: _nameController,
                              style: GoogleFonts.montserrat(
                                  color: colors.primaryTextColor),
                              validator: (value) {
                                if (value == "" || value == null) {
                                  return "Please enter a valid phone number";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                label: Text('Phone number',
                                    style: GoogleFonts.nunito(
                                        color: colors.textBoxTextColor,
                                        fontSize: 17)),
                                filled: true,
                                hintText: 'Enter your phone number',
                                hintStyle: GoogleFonts.poppins(
                                    color:
                                    colors.textBoxTextColor),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                                fillColor: colors.textBoxColor,
                                focusColor: colors.textBoxColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                              )),
                        ),
                        Padding(
                          padding: constants.textFieldPadding,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: colors.alternateButtonColor),
                              child: Text('Send OTP', style: constants.alternateIconTextStyle,),onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                            },

                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 100.0, bottom: 100, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                    maxLength: 6,
                                    keyboardType: const TextInputType.numberWithOptions(),
                                    controller: _passwordController,
                                    validator: (value) {
                                      if (value == "" || value == null) {
                                        return "Enter OTP";
                                      } else {
                                        return null;
                                      }
                                    },
                                    style: GoogleFonts.nunito(
                                        color: colors.primaryTextColor, fontSize: 17),

                                    decoration: InputDecoration(
                                      label: Text('OTP',
                                          style: GoogleFonts.nunito(
                                              color: colors.textBoxTextColor,
                                              fontSize: 17)),
                                      filled: true,
                                      hintText: 'Enter OTP',
                                      hintStyle: GoogleFonts.poppins(
                                          color:
                                          colors.textBoxTextColor),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(5)),
                                      fillColor: colors.textBoxColor,
                                      focusColor: colors.textBoxColor,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(5)),
                                    )
                                ),
                              ),
                              ElevatedButton(onPressed: (){}, child: SizedBox(height: 40,child: Center(child: Text('Verify OTP',style: constants.iconTextStyle,))))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: Container())
                ],
              ))
        ]
    );
  }
}
