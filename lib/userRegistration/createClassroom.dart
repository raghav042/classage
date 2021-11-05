import 'package:classage/classroom/classroomServices.dart';
import 'package:classage/classroom/utils.dart';
import 'package:classage/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helper.dart';

class CreateClassroomPage extends StatefulWidget {
  const CreateClassroomPage({Key key}) : super(key: key);

  @override
  _CreateClassroomPageState createState() => _CreateClassroomPageState();
}

class _CreateClassroomPageState extends State<CreateClassroomPage> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User user = FirebaseAuth.instance.currentUser;

  String state;
  String school;
  String classroom;
  String subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                topProgressIndicator(MediaQuery.of(context).size.width - 20),
                SizedBox(height: 60),
                Text(
                  "Create your classroom",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 45),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            "State/UT",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                      ),
                      DropdownButton<String>(
                        value: state,
                        icon: Icon(Icons.keyboard_arrow_down),
                        iconSize: 24,
                        elevation: 16,
                        menuMaxHeight: 600,
                        items: <String>[
                          'Andhra Pradesh',
                          'Arunachal Pradesh',
                          'Assam',
                          'Bihar',
                          'Chhattisgarh',
                          'Goa',
                          'Gujarat',
                          'Haryana',
                          'Himachal Pradesh',
                          'Jharkhand',
                          'Karnataka',
                          'Kerala',
                          'Madhya Pradesh',
                          'Manipur',
                          'Meghalaya',
                          'Mizoram',
                          'Nagaland',
                          'Odisha',
                          'Punjab',
                          'Rajasthan',
                          'Sikkim',
                          'Tamil Nadu',
                          'Telangana',
                          'Tripura',
                          'Uttar Pradesh',
                          'Uttarakhand',
                          'West Bengal',
                          'Andaman & Nicobar',
                          'Chandigarh',
                          'DNHDD',
                          'Delhi',
                          'Jammu & Kashmir',
                          'Ladakh',
                          'Lakshadweep',
                          'Puducherry'
                        ].map<DropdownMenuItem<String>>((String newState) {
                          return DropdownMenuItem<String>(
                            value: newState,
                            child: Text(newState),
                          );
                        }).toList(),
                        onChanged: (String newState) {
                          setState(() {
                            state = newState;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: Text(
                      "School Name",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: TextFormField(
                    initialValue: school,
                    keyboardType: TextInputType.name,
                    onChanged: (school) {
                      setState(() {
                        this.school = school;
                      });
                    },
                    decoration: textFieldDecoration(Icon(Icons.school)),
                    validator: (schoolValue) {
                      if (schoolValue == null) {
                        return 'School name required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: Text(
                      "Class name",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: TextFormField(
                    initialValue: classroom,
                    keyboardType: TextInputType.name,
                    onChanged: (classroom) {
                      setState(() {
                        this.classroom = classroom;
                      });
                    },
                    decoration: textFieldDecoration(Icon(Icons.people)),
                    validator: (classroomValue) {
                      if (classroomValue == null) {
                        return 'Class required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: Text(
                      "Subject name",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: TextFormField(
                    initialValue: subject,
                    keyboardType: TextInputType.name,
                    onChanged: (subject) {
                      setState(() {
                        this.subject = subject;
                      });
                    },
                    decoration: textFieldDecoration(Icon(Icons.class_)),
                    validator: (subjectValue) {
                      if (subjectValue == null) {
                        return 'Subjects name required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 150),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => MainScreen()),
                              (Route<dynamic> route) => false);
                      await createClassroom(state, school, classroom, subject);

                      await UserPreferences.setUserState(state);
                      await UserPreferences.setUserSchool(school);
                      await UserPreferences.setUserClassroom(classroom);

                    },
                    child: Text("Done"),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
