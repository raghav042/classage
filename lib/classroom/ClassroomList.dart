import 'package:classage/classroom/classroomTile.dart';
import 'package:classage/classroom/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ClassroomListPage extends StatefulWidget {
  const ClassroomListPage({Key? key}) : super(key: key);

  @override
  _ClassroomListPageState createState() => _ClassroomListPageState();
}

class _ClassroomListPageState extends State<ClassroomListPage> {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  late String state;
  late String school;
  late String classroom;
  String? subject;

  @override
  void initState() {
    super.initState();

    state = UserPreferences.getUserState() ?? '';
    school = UserPreferences.getUserSchool() ?? '';
    classroom = UserPreferences.getUserClassroom() ?? '';
    //subject = UserPreferences.getUserSubject() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: _firestore
            .collection('states')
            .doc(state)
            .collection('schools')
            .doc(school)
            .collection('classrooms')
            .doc(classroom)
            .collection('subjects')
            //.orderBy('time', descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return noClassroom();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Row(
                children: const [
                  CircularProgressIndicator(),
                  Text("Loading")
                ],
              ),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return ClassroomTile(subjectName: data['subject'], teacher: data['createdBy']);
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addSubjectDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future addSubject(String state, String school, String classroom, String subject) async {
    await _firestore
        .collection('states')
        .doc(state)
        .collection('schools')
        .doc(school)
        .collection('classrooms')
        .doc(classroom)
        .update({
      'subjects': FieldValue.arrayUnion([subject]),
    });

    await _firestore
        .collection('states')
        .doc(state)
        .collection('schools')
        .doc(school)
        .collection('classrooms')
        .doc(classroom)
        .collection('subjects')
        .doc(subject)
        .set({
      'createdBy': _auth.currentUser!.displayName,
      'createdAt': Timestamp.now(),
      'subject': subject,
      'recentMessage': '',
      'recentMessageSender': ''
    });

    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      'classroom': FieldValue.arrayUnion([classroom.toUpperCase()]),
      'subject': FieldValue.arrayUnion([subject])
    });
  }



  Future<void> addSubjectDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            contentPadding: const EdgeInsets.only(top: 10.0),
            title: const Text("Add new subject",
                style: TextStyle(fontWeight: FontWeight.bold)),
            titlePadding: const EdgeInsets.all(20),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'subject name',
                ),
                onChanged: (subject) {
                  setState(() {
                    this.subject = subject;
                  });
                },
              ),
            ),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(subject);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 17),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      if (subject!.isNotEmpty) {
                        await addSubject(state, school, classroom, subject!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.lightBlueAccent,
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Please enter fields'),
                              ],
                            )));
                      }
                    },
                    child: const Text(
                      "Create",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    )),
              ),
            ],
          );
        });
  }

}

Widget noClassroom() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/uhho.png'),
        const SizedBox(height: 50),
        const Text(
            "You've not joined any group, tap on the 'add' icon to create a group by tapping the button below.")
      ],
    ),
  );
}