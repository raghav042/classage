import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'classroom.dart';

class ClassroomTile extends StatelessWidget {
  ClassroomTile({Key? key, required this.subjectName, required this.teacher})
      : super(key: key);

  final String subjectName;
  final String teacher;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ElevatedButton(
        onPressed: () {
          //await UserPreferences.setUserSubject(subject);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Classroom(
                subjectName: subjectName,
                userName: _auth.currentUser!.displayName!,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.purple[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(subjectName, style: const TextStyle(fontSize: 23)),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(teacher,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
