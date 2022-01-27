import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:test1/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body:
          Container(
            decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage("images/login2.jpg"),fit: BoxFit.cover)),
            child:
            SplashScreenView(
              // navigateRoute: IntroScreen(),
              navigateRoute: LoginScreen(),
              imageSrc: 'images/login_images/logo1.jpg',
              imageSize: 150,
              duration: 2000,
              text: 'Welcom To My App Store',
              textStyle: TextStyle(color: Colors.white54,fontSize: 20),
              backgroundColor: Color.fromARGB(150, 0, 0, 0),
            ),
          )
      );
  }
}
