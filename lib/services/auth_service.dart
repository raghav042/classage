import 'package:classage/homepage.dart';
import 'package:classage/splash_screen/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      return const MainScreen();
    } else {
      return const OnboardingPage();
    }
  }
}
