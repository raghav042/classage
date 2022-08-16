import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  SettingsState createState() => SettingsState();
}
class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Settings",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: const Icon(
              Icons.account_box_outlined,
              color: Colors.blueGrey,
              size: 38,
            ),
            title: Text(
              "Account",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            subtitle: const Text("Privacy, Security"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Account()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings_display_outlined,
              color: Colors.amber,
              size: 38,
            ),
            title: Text(
              "Display",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            subtitle: const Text("Wallpaper, dark theme "),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Display()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.videocam_outlined,
              color: Colors.red[300],
              size: 40,
            ),
            title: Text(
              "Meetings",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            subtitle: const Text("Time Limit, Recording"),
            onTap: () {
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Meetings()),
              );*/
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.sd_storage_outlined,
              color: Colors.purple,
              size: 38,
            ),
            title: Text(
              "Storage",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            subtitle: const Text("Location, "),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Storage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.group_outlined, color: Colors.teal, size: 38),
            title: Text(
              "Class",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            subtitle: const Text("Add member, Import contacts"),
            onTap: () {/*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Classes()),
              );*/
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.help_center_outlined,
              color: Colors.black54,
              size: 38,
            ),
            title: Text(
              "Help",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            subtitle: const Text("Privacy, Security"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Help()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.margin, color: Colors.lime[600], size: 38),
            title: Text(
              "About Us",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            subtitle: const Text("Legal Information, "),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const About()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  AccountState createState() => AccountState();
}
class AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("privacy"),
        ],
      ),
    );
  }
}

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  DisplayState createState() => DisplayState();
}
class DisplayState extends State<Display> {
  int radioValue = 0;
  void radioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          ExpansionTile(
            title: Text("Privacy"),
          )
        ],
      ),
    );
  }
}

/*
class Meetings extends StatefulWidget {
  @override
  MeetingsState createState() => MeetingsState();
}
class MeetingsState extends State<Meetings> {
  int radioValue = 0;
  void radioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ExpansionTile(
            title: Text("Privacy"),
            children: <Widget>[
              for (int index = 0; index < 3; ++index)
                Radio<int>(
                    value: index,
                    groupValue: radioValue,
                    onChanged: radioValueChanged),
            ],
          )
        ],
      ),
    );
  }
}
 */

class Storage extends StatefulWidget {
  const Storage({Key? key}) : super(key: key);

  @override
  StorageState createState() => StorageState();
}
class StorageState extends State<Storage> {
  int radioValue = 0;
  void radioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          ExpansionTile(
            title: Text("Privacy"),

          )
        ],
      ),
    );
  }
}

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  HelpState createState() => HelpState();
}
class HelpState extends State<Help> {
  int radioValue = 0;
  void radioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          ExpansionTile(
            title: Text("Privacy"),

          )
        ],
      ),
    );
  }
}

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  AboutState createState() => AboutState();
}
class AboutState extends State<About> {
  int radioValue = 0;
  void radioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          ExpansionTile(
            title: Text("Privacy"),

          )
        ],
      ),
    );
  }
}
