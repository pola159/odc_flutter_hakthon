import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange_odc_flutter_hackathon_code/appScreens/screensToLogin/loginScreen.dart';
import 'package:orange_odc_flutter_hackathon_code/appScreens/screensToLogin/policyScreen.dart';

import '../controls/controlsForApp.dart';

class singin extends StatefulWidget {
  const singin({Key? key}) : super(key: key);

  @override
  State<singin> createState() => _singinState();
}

class _singinState extends State<singin> {
  bool _passwordVisible = false;
  bool _checkedValue = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  SvgPicture.asset("images/loginSignImages/Rectangle_2662.svg"),
                  SvgPicture.asset("images/loginSignImages/Rectangle_2663.svg"),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.09,
                  ),
                  Form(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          blackText(
                              text: "Hello ",
                              fontSize: 35,
                              wid: FontWeight.w700),
                          orangeText(
                              text: "Friend!",
                              fontSize: 35,
                              wid: FontWeight.w700),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          blackText(
                              text: "Sign Up",
                              fontSize: 20,
                              wid: FontWeight.w600),
                        ],
                      ),
                      textField(
                          text: "Full Name", icon: Icon(Icons.person_outline)),
                      textField(
                          text: "E-mail", icon: Icon(Icons.email_outlined)),
                      textFieldpass(
                          text: "Password", icon: Icon(Icons.lock_outline)),
                      textField(
                          text: "Phone number",
                          icon: Icon(Icons.phone_outlined)),
                      textField(
                          text: "Addres",
                          icon: Icon(Icons.location_on_outlined)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CheckboxListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              blackText(
                                  text: "Do you agree to our",
                                  fontSize: 13,
                                  wid: FontWeight.w500),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const policy()));
                                },
                                child: orangeText(
                                    text: "Privacy Policy",
                                    fontSize: 12.14,
                                    wid: FontWeight.w500),
                              ),
                            ],
                          ),
                          value: _checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              _checkedValue = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                      ),
                      button(them: true, text: "Sign Up", pageToGo: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const login()));
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          blackText(
                              text: "Already Have an Account?",
                              fontSize: 13,
                              wid: FontWeight.w500),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const login()));
                            },
                            child: orangeText(
                                text: "Login",
                                fontSize: 12.14,
                                wid: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  SvgPicture.asset("images/loginSignImages/Rectangle_2665.svg"),
                  SvgPicture.asset("images/loginSignImages/Rectangle_2664.svg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget textFieldpass({required String text, required Icon icon}) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 8, bottom: 8),
      child: TextFormField(
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xF8F8F8).withOpacity(1.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.09)),
          label: Text(text),
          prefixIcon: icon,
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Color(0x888888).withOpacity(1.0),
              size: 15,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

}

