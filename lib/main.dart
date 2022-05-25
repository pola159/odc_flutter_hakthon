import 'package:flutter/material.dart';
import 'package:orange_odc_flutter_hackathon_code/appScreens/homeScreens/firstScreen.dart';
import 'package:orange_odc_flutter_hackathon_code/appScreens/screensToLogin/startPage.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashIconSize: 200,
        splash: 'images/loginSignImages/Logo.png',
        nextScreen: firstScreen(),
      ),
    ) ;
  }
}
