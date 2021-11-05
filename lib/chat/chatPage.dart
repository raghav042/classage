import 'package:classage/chat/ChatRoom.dart';
import 'package:classage/classroom/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with WidgetsBindingObserver {
  Map<String, dynamic> userMap;
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String state;
  String school;
  String classroom;
  String subject;
  List<String> members;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    setStatus("Online");

    state = UserPreferences.getUserState() ?? '';
    school = UserPreferences.getUserSchool() ?? '';
    classroom = UserPreferences.getUserClassroom() ?? '';
    //subject = UserPreferences.getUserSubject() ?? '';
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: isLoading
            ? Center(
                child: Container(
                  height: size.height / 20,
                  width: size.height / 20,
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await showClassmates();
                  },
                  child: Text("show classmates"),
                ),
              ))
        /*: FutureBuilder(
                future: FirebaseFirestore.instance.collection('states').doc(state).collection('schools').doc(school).collection('classrooms').doc(classroom).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }
                  if (snapshot.hasData && !snapshot.data.exists) {
                    return Text("Document does not exist");
                  }
                  if(snapshot.connectionState == ConnectionState.done){
                    Map<String, dynamic> data = snapshot.data.data() as Map<String, dynamic>;
                    return Text("members: ${data['members']}");
                  }
                  return Text("loading");
                })*/
        );
  }

  Future showClassmates() {
    FirebaseFirestore.instance
        .collection('states')
        .doc(state)
        .collection('schools')
        .doc(school)
        .collection('classrooms')
        .doc(classroom)
        .collection('subjects')
        .get()
        .then((QuerySnapshot document) {
          print([members]);
    });
  }
}
