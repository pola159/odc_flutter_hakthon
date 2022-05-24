import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../controls/controlsForApp.dart';
import 'loginSignScreen.dart';

class restpass extends StatefulWidget {
  const restpass({Key? key}) : super(key: key);

  @override
  State<restpass> createState() => _restpassState();
}

class _restpassState extends State<restpass> {
  int indesScreen = 0;


  @override
  Widget build(BuildContext context) {
    List<Scaffold> screens = [
      Scaffold(
        appBar: appBarWithBack(titel: "Forget Password"),
        body: Container(
          height: double.infinity,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("images/forgetPassword/illustrations_1.svg"),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      blackText(
                          text: "Please enter your email address to",
                          fontSize: 15,
                          wid: FontWeight.w600),
                      blackText(
                          text: " recieve vervication code",
                          fontSize: 15,
                          wid: FontWeight.w600),
                    ],
                  ),
                ),
                textField(text: "E-mail", icon: Icon(null)),
                button(
                    them: true,
                    text: "Sign Up",
                    pageToGo: () {
                      setState(() {
                        indesScreen++;
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
      Scaffold(
        appBar: appBarWithBack(titel: "Verify Your Email"),
        body: Container(
          height: double.infinity,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("images/forgetPassword/illustrations_2.svg"),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      blackText(
                          text: "please enter the 4-digit code sent to",
                          fontSize: 15,
                          wid: FontWeight.w600),
                      orangeText(
                          text: "e-mail", fontSize: 15, wid: FontWeight.w600),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                textFieldOneNumber(text: ""),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                textFieldOneNumber(text: ""),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                textFieldOneNumber(text: ""),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                textFieldOneNumber(text: ""),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                button(
                    them: true,
                    text: "Verify",
                    pageToGo: () {
                      setState(() {
                        indesScreen++;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
      Scaffold(
        appBar: appBarWithBack(titel: "Create New Password"),
        body: Container(
          height: double.infinity,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("images/forgetPassword/illustrations_3.svg"),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      blackText(
                          text: "Enter your new password",
                          fontSize: 15,
                          wid: FontWeight.w600),
                    ],
                  ),
                ),
                textField(text: "New Password", icon: Icon(null)),
                textField(text: "Confirm Password", icon: Icon(null)),
                button(
                    them: true,
                    text: "Submit",
                    pageToGo: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (c) {
                        return login(member: true);
                      }));
                    }),
              ],
            ),
          ),
        ),

      ),
    ];
    return screens[indesScreen];
  }

}

Widget textFieldOneNumber({required String text}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 8, bottom: 8),
    child: TextFormField(
      inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xF8F8F8).withOpacity(1.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.09)),
        label: Text(text),
      ),
    ),
  );
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: min(truncated.length, truncated.length + 1),
          extentOffset: min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
