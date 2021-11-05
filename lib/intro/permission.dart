import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({Key key,}) : super(key: key);

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

/// This is the private State class that goes with Permissions.
class _PermissionPageState extends State<PermissionPage> {
  bool _isStorage = false;
  bool _isCamera = false;
  bool _isMicrophone = false;
  bool _isInternet = false;
  bool _isNotification = false;
  bool _isContact = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/edu.png',
                    height: 70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Get access to all features",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Classage needs some permissions to provide a better user experience, here is why we ask for permissions",
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(thickness: 1,),
                ),
                SizedBox(
                  height: 20,
                ),
                SwitchListTile(
                    contentPadding: EdgeInsets.all(6),
                    title: Text(
                      "Storage",
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      'classage will be able to upload and save douments to device',
                    ),
                    secondary: Icon(Icons.sd_storage),
                    value: _isStorage,
                    onChanged: (bool value) {
                      setState(() {
                        _isStorage = value;
                      });
                    }),
                SwitchListTile(
                    contentPadding: EdgeInsets.all(6),
                    title: Text(
                      "Camera",
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      'create pdf from images or share images by capturing photos',
                    ),
                    secondary: Icon(Icons.camera_alt),
                    value: _isCamera,
                    onChanged: (bool value) {
                      setState(() {
                        _isCamera = value;
                      });
                    }),
                SwitchListTile(
                    contentPadding: EdgeInsets.all(6),
                    title: Text(
                      "Microphone",
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      'microphone is needed for calling and video conferencing feature',
                    ),
                    secondary: Icon(Icons.mic),
                    value: _isMicrophone,
                    onChanged: (bool value) {
                      setState(() {
                        _isMicrophone = value;
                      });
                    }),
                SwitchListTile(
                    contentPadding: EdgeInsets.all(6),
                    title: Text(
                      "Internet",
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      'Internet is required to video conferencing, messaging and share content with teachers or classmates',
                    ),
                    secondary: Icon(Icons.wifi),
                    value: _isInternet,
                    onChanged: (bool value) {
                      setState(() {
                        _isInternet = value;
                      });
                    }),
                SwitchListTile(
                    contentPadding: EdgeInsets.all(6),
                    title: Text(
                      "Notifications",
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      'never miss important assignments or class by enabling the notification permission',
                    ),
                    secondary: Icon(Icons.notifications_active),
                    value: _isNotification,
                    onChanged: (bool value) {
                      setState(() {
                        _isNotification = value;
                      });
                    }),
                SwitchListTile(
                    contentPadding: EdgeInsets.all(6),
                    title: Text(
                      "Contacts",
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      'you will able to find teachers/students/classmates in search by enabling this',
                    ),
                    secondary: Icon(Icons.person),
                    value: _isContact,
                    onChanged: (bool value) {
                      setState(() {
                        _isContact = value;
                      });
                    }),
              ],
            ),
          )

          /*LabeledSwitch(
          label: 'This is the label text',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: _isSelected,
          onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
        ),*/
          ),
    );
  }
}




/*
class LabeledSwitch extends StatelessWidget {
  const LabeledSwitch({
    Key key,
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Switch(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

 */