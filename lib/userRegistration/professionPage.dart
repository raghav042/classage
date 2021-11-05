import 'package:classage/userRegistration/firebaseServices.dart';
import 'package:flutter/material.dart';
import '../mainScreen.dart';
import 'createClassroom.dart';
import 'helper.dart';

class ProfessionPage extends StatefulWidget {
  const ProfessionPage({Key key}) : super(key: key);

  @override
  _ProfessionPageState createState() => _ProfessionPageState();
}

class _ProfessionPageState extends State<ProfessionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                topProgressIndicator(MediaQuery.of(context).size.width / 1.7),
                SizedBox(height: 100),
                Text("Please select one",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 155,
                          height: 172,
                          color: Colors.white,
                          child: Image(
                            image: AssetImage('assets/teacher.jpeg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: 140,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CreateClassroomPage()),
                                    (Route<dynamic> route) => false);
                              },
                              child: Text(
                                "Teacher",
                                style: Theme.of(context).textTheme.button,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 155,
                          height: 172,
                          color: Colors.white,
                          child: Image(
                            image: AssetImage('assets/student.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: 140,
                          child: ElevatedButton(
                              onPressed: () {
                                updateStudent();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => MainScreen()),
                                    (Route<dynamic> route) => false);
                              },
                              child: Text(
                                "Student",
                                style: Theme.of(context).textTheme.button,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
