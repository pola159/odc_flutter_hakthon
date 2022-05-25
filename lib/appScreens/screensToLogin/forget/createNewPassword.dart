import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../controls/controlsForApp.dart';
import '../loginScreen.dart';

class createNewPassword extends StatefulWidget {
  const createNewPassword({Key? key}) : super(key: key);

  @override
  State<createNewPassword> createState() => _createNewPasswordState();
}

class _createNewPasswordState extends State<createNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      return login();
                    }));
                  }),
            ],
          ),
        ),
      ),

    );
  }
}
