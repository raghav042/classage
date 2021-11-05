import 'package:classage/userRegistration/signInPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<User> signUp(String _name, String _email, String _password) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _email, password: _password);
    User user = (userCredential).user;

    if (user != null) {
      print("Account created Successful");
      user.updateDisplayName(_name);

      await _firestore.collection('users').doc(_auth.currentUser.uid).set({
        "name": _name,
        "email": _email,
        "status": "Unavailable",
        "uid": _auth.currentUser.uid,
      });

      return user;
    } else {
      print("Account creation failed");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User> logIn(String _email, String _password) async {
  try {
    User user = (await _auth.signInWithEmailAndPassword(
            email: _email, password: _password))
        .user;

    if (user != null) {
      print("Login Successful");
      _firestore
          .collection('users')
          .doc(_auth.currentUser.uid)
          .get()
          .then((value) => user.updateDisplayName(value['_name']));

      return user;
    } else {
      print("Login Failed");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User> signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  User user =
      (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  return user;
}

Future<User> updateTeacher(
    String _school, String _class, String _subjects) async {
  User user = _auth.currentUser;

  await _firestore.collection('users').doc(user.uid).update({
    "profession": "teacher",
    "school": _school,
    "classes": _class,
    "subjects": _subjects,
  });
  return user;
}

Future<User> updateStudent() async {
  User user = _auth.currentUser;

  await _firestore.collection('users').doc(user.uid).update({
    "profession": "student",
  });
  return user;
}

Future logOut(BuildContext context) async {
  await _auth.signOut().then((value) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SignInPage()));
  });
}
