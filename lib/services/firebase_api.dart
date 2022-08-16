import 'package:classage/splash_screen/onboarding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<User> updateTeacher(
    String _school, String _class, String subjects) async {
  User? user = _auth.currentUser;

  await _firestore.collection('users').doc(user!.uid).update({
    "profession": "teacher",
    "school": _school,
    "classes": _class,
    "subjects": subjects,
  });
  return user;
}

Future<User> updateStudent() async {
  User? user = _auth.currentUser;

  await _firestore.collection('users').doc(user!.uid).update({
    "profession": "student",
  });
  return user;
}

class FirebaseApi {
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    User? user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    return user;
  }

  Future logOut(BuildContext context) async {
    await _auth.signOut().then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const OnboardingPage()));
    });
  }
}
