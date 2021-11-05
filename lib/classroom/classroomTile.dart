import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'classroom.dart';

class ClassroomTile extends StatelessWidget {
  ClassroomTile({Key key, this.subjectName, this.teacher})
      : super(key: key);

  final String subjectName;
  final String teacher;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ElevatedButton(
        onPressed: () {
          //await UserPreferences.setUserSubject(subject);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Classroom(subjectName: subjectName, userName: _auth.currentUser.displayName)));
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.purple[50],
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25.0),
            )),
        child: new ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: new Text(subjectName, style: TextStyle(fontSize: 23)),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(teacher,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
