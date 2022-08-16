import 'package:flutter/material.dart';

class Style extends StatefulWidget {
  const Style({Key? key}) : super(key: key);

  @override
  StyleState createState() => StyleState();
}

class StyleState extends State<Style> {
  final List<String> myColor = <String>[
    'Colors.red',
    'Colors.green',
    'Colors.purple',
    'Colors.grey',
    'Colors.yellow',
    'Colors.orange',
  ];
  late final String? primaryColor;

  // @override
  // void initState() {
  //   primaryColor = 'Colors.indigo';
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('user preferences')),
      body: Column(
        children: <Widget>[
          const Text("select primary color"),
          const SizedBox(height: 50),
          DropdownButton(
            items: myColor.map<DropdownMenuItem<String>>((String newColor) {
              return DropdownMenuItem<String>(
                value: newColor,
                child: Text(newColor),
              );
            }).toList(),
            onChanged: (String? newColor) {
              setState(() {
                primaryColor = newColor!;
              });
            },
          )
        ],
      ),
    );
  }
}
