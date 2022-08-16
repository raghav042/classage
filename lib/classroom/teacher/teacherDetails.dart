import 'package:flutter/material.dart';

class TeacherDetails extends StatefulWidget {
  const TeacherDetails({Key? key}) : super(key: key);

  @override
  TeacherDetailsState createState() => TeacherDetailsState();
}

class TeacherDetailsState extends State<TeacherDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("teacher_name"),
        actions: [
          IconButton(icon: const Icon(Icons.messenger_outline), onPressed: () {},),
          const SizedBox(width: 10),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {},),
          const SizedBox(width: 10),
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
                const CircleAvatar(radius: 55),
                const SizedBox(width: 10),
                Column(
                  children: const [
                    Text("27",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Lectures",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600))
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  children: const [
                    Text("3",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Subjects",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600))
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  children: const [
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
            const SizedBox(height: 10),
            const Text("first last name", style: TextStyle(fontSize: 17)),
            const Text("example@gmail.com", style: TextStyle(fontSize: 17)),
            const Text("ABC Public School", style: TextStyle(fontSize: 17)),
            const SizedBox(height: 20),
            const Text("Classes",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            //Text("9 ", style: TextStyle(fontSize: 17)),
          ],
        ),
      ),
    );
  }
}
