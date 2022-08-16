import 'package:classage/classroom/teacher/teacherDetails.dart';
import 'package:classage/library/tests/pages/testPage.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  LibraryState createState() => LibraryState();
}

class LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topContainer(context),
            const SizedBox(height: 50),
            bottomContainer(context)
          ],
        ),
      ),
    );
  }
}

Widget bigButton(onPressed, color, text, width) {
  return Container(
    width: width,
    height: 160,
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
        ),
      ),
    ),
  );
}

Widget smallButton(onPressed, color, icon, text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 80,
      width: 80,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Icon(icon, size: 32), Text(text)],
        ),
      ),
    ),
  );
}

Widget topContainer(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 510,
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        bigButton(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TestPage()),
          );
        }, Colors.pink[50], "tests", double.infinity),
        bigButton(() {}, Colors.blue[50], "Assignments", double.infinity),
        SizedBox(
          height: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bigButton(() {}, Colors.blue[50], "Notes",
                  MediaQuery.of(context).size.width / 2 - 30),
              bigButton(() {}, Colors.amber[50], "Papers",
                  MediaQuery.of(context).size.width / 2 - 30),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget bottomContainer(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      smallButton((){Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TeacherDetails()),
      );}, Colors.blue[50], Icons.videocam, "video"),
      smallButton((){}, Colors.purple[50], Icons.graphic_eq, "graph"),
      smallButton((){}, Colors.teal[50], Icons.analytics_outlined, "statics"),
      smallButton((){}, Colors.deepOrange[50], Icons.art_track, "draw")
    ],
  );
}
