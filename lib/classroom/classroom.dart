import 'package:classage/classroom/ClassroomList.dart';
import 'package:classage/classroom/message_tile.dart';
import 'package:classage/classroom/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Classroom extends StatefulWidget {
  const Classroom({Key key, this.userName, this.subjectName}) : super(key: key);

  final String subjectName;
  final String userName;

  @override
  _ClassroomState createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {
  TextEditingController messageController = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String name;
  String state;
  String school;
  String classroom;

  @override
  void initState() {
    super.initState();

    name = UserPreferences.getUserName() ?? '';
    state = UserPreferences.getUserState() ?? '';
    school = UserPreferences.getUserSchool() ?? '';
    classroom = UserPreferences.getUserClassroom() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.subjectName),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.videocam))],
      ),
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height - 160,
              child: StreamBuilder(
                stream: _firestore
                    .collection('states')
                    .doc(state)
                    .collection('schools')
                    .doc(school)
                    .collection('classrooms')
                    .doc(classroom)
                    .collection('subjects')
                    .doc(widget.subjectName)
                    .collection('messages')
                    .orderBy('time', descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return noClassroom();
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Row(
                        children: [
                          CircularProgressIndicator(),
                          Text("Loading")
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return MessageTile(
                        message: snapshot.data.docs[index]['message'],
                        sender: snapshot.data.docs[index]['sender'],
                        sentByMe: widget.userName ==
                            snapshot.data.docs[index]["sender"],
                      );
                    },
                  );
                },
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: msgType(widget.subjectName))
        ],
      ),
    );
  }

  sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await _firestore
          .collection('states')
          .doc(state)
          .collection('schools')
          .doc(school)
          .collection('classrooms')
          .doc(classroom)
          .collection('subjects')
          .doc(widget.subjectName)
          .collection('messages')
          .add({
        'message': messageController.text,
        'sender': widget.userName,
        'time': DateTime.now().millisecondsSinceEpoch,
      });
    }
  }

  Widget msgType(String subject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          color: Colors.white,
          height: 65,
          width: MediaQuery.of(context).size.width - 75,
          child: TextField(
            controller: messageController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: "Send a message ...",
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 2),
                )),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            sendMessage();
            messageController.clear();
          },
          child: SizedBox(
              height: 40,
              width: 40,
              child: Icon(
                Icons.send,
                color: Colors.white,
                size: 26,
              )),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(6),
          ),
        )
      ],
    );
  }
}
