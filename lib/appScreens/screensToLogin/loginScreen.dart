import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orange_odc_flutter_hackathon_code/appScreens/screensToLogin/forget/forgetPassword.dart';
import 'package:orange_odc_flutter_hackathon_code/appScreens/screensToLogin/signScreen.dart';
import '../controls/controlsForApp.dart';
import '../homeScreens/home.dart';

class login extends StatefulWidget {

 const login({ Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
              child :Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.13,
                        ),
                        Form(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Image.asset('images/loginSignImages/Logo.png', width: 81),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  blackText(
                                      text: "Welcom ",
                                      fontSize: 35,
                                      wid: FontWeight.w700),
                                  orangeText(
                                      text: "Back!",
                                      fontSize: 35,
                                      wid: FontWeight.w700)
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  blackText(
                                      text: "Login",
                                      fontSize: 20,
                                      wid: FontWeight.w600),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              textField(text: "E-mail", icon: Icon(null)),
                              textFieldpass(text: "Password", icon: Icon(null)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const restpass()));
                                      },
                                      child: orangeText(
                                          text: "Forget Password?",
                                          fontSize: 12.14,
                                          wid: FontWeight.w500)),
                                  SizedBox(
                                    width: 40,
                                  )
                                ],
                              ),
                              button(
                                  them: true, text: "Login", pageToGo: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(builder: (con) {
                                  return home();
                                }));
                              }),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  blackText(
                                      text: "Don’t Have an Account?",
                                      fontSize: 13,
                                      wid: FontWeight.w500),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const singin()));
                                      });
                                    },
                                    child: orangeText(
                                        text: "Sign Up",
                                        fontSize: 12.14,
                                        wid: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
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
      padding:
          const EdgeInsets.only(right: 40.0, left: 40.0, top: 8, bottom: 8),
      child: TextFormField(
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xF8F8F8).withOpacity(1.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.09)),
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
