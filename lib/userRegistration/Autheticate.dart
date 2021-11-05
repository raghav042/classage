import 'package:classage/intro/onboarding.dart';
import 'package:classage/intro/userAgreement.dart';
import 'package:classage/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return MainScreen();
    } else {
      return OnboardingPage();
    }
  }
}
