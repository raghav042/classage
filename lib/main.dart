import 'package:classage/chat/ChatRoom.dart';
import 'package:classage/classroom/utils.dart';
import 'package:classage/mainScreen.dart';
import 'package:classage/userRegistration/Autheticate.dart';
import 'package:classage/userRegistration/createClassroom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'intro/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserPreferences.init();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(classage());
}

class classage extends StatelessWidget {
  static final String title = 'Firebase Chat';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.quicksandTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          elevation: 2,
          onPrimary: Colors.black,
          padding: EdgeInsets.all(10),
          primary: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          primary: Colors.black87,
          padding: EdgeInsets.all(18),
          side: BorderSide(color: Colors.blueGrey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        )),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          primary: Colors.lightBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        )),
        iconTheme: IconThemeData(
          color: Colors.blueGrey,
        ),
      ),
      home: Splashscreen(),
    );
  }
}

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

