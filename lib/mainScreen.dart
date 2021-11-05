import 'package:classage/chat/chatPage.dart';
import 'package:classage/chat/searchPage.dart';
import 'package:classage/classroom/ClassroomList.dart';
import 'package:classage/drawer/dashboard.dart';
import 'package:classage/drawer/settings.dart';
import 'package:classage/library/Library.dart';
import 'package:classage/main.dart';
import 'package:classage/userRegistration/firebaseServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'meetings/Meeting.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        toolbarHeight: 90,
        title: Text(
          "classage",
          style: GoogleFonts.quicksand(
              color: Colors.lightBlue,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.blue
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.lightBlue,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.lightBlue,
          tabs: <Widget>[
            Tab(
              text: 'Chats',
            ),
            Tab(text: 'Meetings'),
            Tab(text: 'Library'),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SearchPage()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Text(
                  'Profile Pic',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            SizedBox(height: 5),
            ListTile(
              title: Text(
                'Dashboard',
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              leading: Icon(
                Icons.dashboard,
                color: Colors.cyan[300],
                size: 28,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
            SizedBox(height: 5),
            ListTile(
              title: Text(
                'Files',
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              leading: Icon(
                Icons.folder,
                color: Colors.amber,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
            SizedBox(height: 5),
            ListTile(
              title: Text(
                'Notifications',
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              leading: Icon(
                Icons.notifications,
                color: Colors.pink[200],
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
            SizedBox(height: 5),
            ListTile(
              title: Text(
                'Settings',
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              leading: Icon(
                Icons.settings,
                color: Colors.blueGrey,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
            SizedBox(height: 5),
            ListTile(
                title: Text(
                  'Logout',
                  style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                leading: Icon(
                  Icons.logout,
                  color: Colors.cyan,
                  size: 30,
                ),
                onTap: () {
                  logOut(context);
                }),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [ClassroomListPage(), Meeting(), Library()],
      ),
    );
  }
}
