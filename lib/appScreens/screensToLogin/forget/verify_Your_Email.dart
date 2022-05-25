import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../controls/controlsForApp.dart';
import 'createNewPassword.dart';
import 'forgetPassword.dart';

class verify extends StatefulWidget {
  const verify({Key? key}) : super(key: key);

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: const EdgeInsets.only(left: 40, right: 40),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  createNewPassword()));
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
