import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
final databaseReference = FirebaseFirestore.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future createClassroom(String state, String school, String classroom, String subject) async {
  await _firestore.collection('states').doc(state).set({'state': state.toUpperCase()});

  await _firestore
      .collection('states')
      .doc(state)
      .collection('schools')
      .doc(school)
      .set({'school': school.toUpperCase(), 'state': state.toUpperCase()});

  await _firestore
      .collection('states')
      .doc(state)
      .collection('schools')
      .doc(school)
      .collection('classrooms')
      .doc(classroom)
      .set({
    'state': state,
    'createdBy': _auth.currentUser!.displayName,
    'className': classroom.toUpperCase(),
    'createdAt': Timestamp.now(),
    'subjects': FieldValue.arrayUnion([subject]),
    'members': FieldValue.arrayUnion([_auth.currentUser!.displayName]),
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
    'profession': "Teacher",
    'school': school,
    'classroom': FieldValue.arrayUnion([classroom.toUpperCase()]),
    'subject': FieldValue.arrayUnion([subject.toUpperCase()]),
  });

}
