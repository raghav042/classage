import 'package:flutter/material.dart';

Widget offPage(){
  return Container(
    height: 8,
    width: 24,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12)
    ),
  );
}

Widget onPage(){
  return Container(
    height: 10,
    width: 30,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(12)
    ),
  );
}

Widget topProgressIndicator(width){
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      height: 5,
      width: width,
      color: Colors.blue,
    ),
  );
}

InputDecoration textFieldDecoration(Icon prefixIcon) {
  return InputDecoration(
    prefixIcon: prefixIcon,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)),
    // focusedBorder: OutlineInputBorder(
    //     borderSide:
    //     BorderSide(color: Colors.blue, width: 2),
    //     borderRadius: BorderRadius.circular(12)),
  );
}

mySnackBar(BuildContext context, content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.lightBlueAccent,
      content: content,
    ),
  );
}