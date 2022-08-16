import 'package:classage/classroom/classroomServices.dart';
import 'package:classage/classroom/utils.dart';
import 'package:classage/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/stylesheet.dart';

class CreateClassroomPage extends StatefulWidget {
  const CreateClassroomPage({Key? key}) : super(key: key);

  @override
  CreateClassroomPageState createState() => CreateClassroomPageState();
}

class CreateClassroomPageState extends State<CreateClassroomPage> {
  User? user = FirebaseAuth.instance.currentUser;
  String? state;
  String? school;
  String? classroom;
  String? subject;

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
              const SizedBox(height: 60),
              const Text(
                "Create your classroom",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 45),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "State/UT",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      value: state,
                      icon: const Icon(Icons.keyboard_arrow_down),
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
                      onChanged: (newState) {
                        setState(() {
                          state = newState!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.0),
                  child: Text(
                    "School Name",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                child: TextFormField(
                  initialValue: school,
                  keyboardType: TextInputType.name,
                  onChanged: (school) {
                    setState(() {
                      this.school = school;
                    });
                  },
                  decoration: textFieldDecoration(const Icon(Icons.school)),
                  validator: (schoolValue) {
                    if (schoolValue == null) {
                      return 'School name required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.0),
                  child: Text(
                    "Class name",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                child: TextFormField(
                  initialValue: classroom,
                  keyboardType: TextInputType.name,
                  onChanged: (classroom) {
                    setState(() {
                      this.classroom = classroom;
                    });
                  },
                  decoration: textFieldDecoration(const Icon(Icons.people)),
                  validator: (classroomValue) {
                    if (classroomValue == null) {
                      return 'Class required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.0),
                  child: Text(
                    "Subject name",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                child: TextFormField(
                  initialValue: subject,
                  keyboardType: TextInputType.name,
                  onChanged: (subject) {
                    setState(() {
                      this.subject = subject;
                    });
                  },
                  decoration: textFieldDecoration(const Icon(Icons.class_)),
                  validator: (subjectValue) {
                    if (subjectValue == null) {
                      return 'Subjects name required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 150),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const MainScreen()),
                        (Route<dynamic> route) => false);
                    await createClassroom(state!, school!, classroom!, subject!);

                    await UserPreferences.setUserState(state!);
                    await UserPreferences.setUserSchool(school!);
                    await UserPreferences.setUserClassroom(classroom!);
                  },
                  child: const Text("Done"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
