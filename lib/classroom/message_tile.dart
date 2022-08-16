import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    required this.message,
    required this.sender,
    required this.sentByMe,
  });

  final String message;
  final String sender;
  final bool sentByMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 4, bottom: 4, left: sentByMe ? 0 : 24, right: sentByMe ? 24 : 0),
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin:
            sentByMe ? const EdgeInsets.only(left: 30) : const EdgeInsets.only(right: 30),
        padding: const EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: sentByMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))
              : const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
          color: sentByMe ? Colors.blue[100] : Colors.grey[100],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(sender.toUpperCase(),
                textAlign: TextAlign.start,
                style: sentByMe
                    ? const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        letterSpacing: -0.5)
                    : const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        letterSpacing: -0.5)),
            const SizedBox(height: 7.0),
            Text(message,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 17.0, color: Colors.black))
          ],
        ),
      ),
    );
  }
}
