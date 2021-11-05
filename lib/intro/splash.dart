import 'dart:async';
import 'package:classage/intro/userAgreement.dart';
import 'package:classage/userRegistration/Autheticate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  @override
  SplashscreenState createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 600),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Authenticate()),
            (Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/logo.PNG'),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'Welcome to',
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'classage',
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      fontSize: 60,
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )),
    );
  }
}
