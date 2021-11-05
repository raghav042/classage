import 'package:flutter/material.dart';

class TeacherDetails extends StatefulWidget {
  const TeacherDetails({Key key}) : super(key: key);

  @override
  _TeacherDetailsState createState() => _TeacherDetailsState();
}

class _TeacherDetailsState extends State<TeacherDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("teacher_name"),
        actions: [
          IconButton(icon: Icon(Icons.messenger_outline), onPressed: () {},),
          SizedBox(width: 10),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {},),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(radius: 55),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text("27",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Lectures",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600))
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text("3",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Subjects",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600))
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text("150",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Students",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600))
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("first last name", style: TextStyle(fontSize: 17)),
            Text("example@gmail.com", style: TextStyle(fontSize: 17)),
            Text("ABC Public School", style: TextStyle(fontSize: 17)),
            SizedBox(height: 20),
            Text("Classes",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            //Text("9 ", style: TextStyle(fontSize: 17)),
          ],
        ),
      ),
    );
  }
}
