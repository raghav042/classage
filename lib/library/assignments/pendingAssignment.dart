import 'package:flutter/material.dart';
import 'assignmentClassRoom.dart';
/*
class PendingAssignment extends StatefulWidget {
  @override
  _PendingAssignmentState createState() => _PendingAssignmentState();
}

class _PendingAssignmentState extends State<PendingAssignment> {
  List<User> aClass = user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlue[100],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 58,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: aClass.map(_aClass).toList(),
          ),
        ),
      ),
    );
  }

  Widget _aClass(User user) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      margin: EdgeInsets.all(8),
      child: ExpansionTile(
        title: Text(
          "${user.domain}",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${user.by}",
                style: TextStyle(fontSize: 20, color: Colors.lightBlue)),
            Text("${user.score}",
                style: TextStyle(fontSize: 20, color: Colors.lightBlue)),
          ],
        ),
        leading: Icon(
          Icons.article,
          size: 40,
          color: Colors.orange[200],
        ),
      ),
    );
  }
}

/*
RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 2),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AssignmentClassRoom()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text("${user.score}",
                    style: TextStyle(fontSize: 20, color: Colors.lightBlue))
              ]),
              Container(
                child: Text(
                  "Class",
                  style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                ),
              ),
              Text(
                "${user.domain}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 0,
              )
            ],
          ),
        ),
 */
*/


