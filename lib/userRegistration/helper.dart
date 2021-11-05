import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget offPage(){
  return Container(
    height: 8,
    width: 24,
    padding: EdgeInsets.all(8),
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
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(12)
    ),
  );
}

Widget topProgressIndicator(_width){
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      height: 5,
      width: _width,
      color: Colors.blue,
    ),
  );
}

InputDecoration textFieldDecoration(Icon prefixIcon){
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