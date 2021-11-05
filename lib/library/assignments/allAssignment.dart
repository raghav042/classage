import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'assignmentClassRoom.dart';
/*
class AllAssignment extends StatefulWidget {
  @override
  _AllAssignmentState createState() => _AllAssignmentState();
}

class _AllAssignmentState extends State<AllAssignment> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 58,
          child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            children: aClass.map(_aClass).toList(),
          ),
        ),
      ),
    );
  }

  Widget _aClass(user) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 2),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AssignmentClassRoom()),
          );
        },
        onLongPress: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.folder,
                        color: Colors.amber,
                      ),
                      title: Text(
                        "${user.domain}",
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.upload_file),
                      title: Text("Upload File"),
                    ),
                    ListTile( 
                      leading: Icon(Icons.link),
                      title: Text("Share link"),
                    ),
                    ListTile(
                      leading: Icon(Icons.delete),
                      title: Text("Delete Class"),
                    ),
                    ListTile(
                      leading: Icon(Icons.people),
                      title: Text("Classmates"),
                    ),

                  ],
                ),
              );
            },
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
    );
  }
}
 */
