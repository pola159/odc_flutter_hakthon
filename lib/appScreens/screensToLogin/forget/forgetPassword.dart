import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../controls/controlsForApp.dart';
import 'verify_Your_Email.dart';

class restpass extends StatefulWidget {
  const restpass({Key? key}) : super(key: key);

  @override
  State<restpass> createState() => _restpassState();
}

class _restpassState extends State<restpass> {
  int indesScreen = 0;


  @override
  Widget build(BuildContext context) {
      return Scaffold(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                 verify()));
                      });
                    }),
              ],
            ),
          ),
        ),
      );
  }

}

Widget textFieldOneNumber({required String text}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 8, bottom: 8),
    child: TextFormField(
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

