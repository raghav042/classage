import 'package:classage/userRegistration/signUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class UserAgreement extends StatefulWidget {
  const UserAgreement({Key key}) : super(key: key);

  @override
  _UserAgreementState createState() => _UserAgreementState();
}

class _UserAgreementState extends State<UserAgreement> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Terms and Conditions",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            SizedBox(height: 25),
            Text(
              "We use class details to provide personalized user experience and improve the features, "
              "it automatically provide the notes and study material relevant to your class",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: " By continuing, you are agree to Classage  ",
                    style: new TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms of Service',
                    style: new TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        decoration: TextDecoration.underline),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        launch(
                            'https://docs.flutter.io/');
                      },
                  ),
                  TextSpan(
                    text: "  and  ",
                    style: new TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: new TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        decoration: TextDecoration.underline),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        launch(
                            'https://docs.flutter.io/');
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool value) {
                      setState(() {
                        isChecked = value;
                      });
                    }),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "I agree to terms and conditions",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                )
              ],
            ),
            SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isChecked ? () {Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()), (Route<dynamic> route) => false
                );} : null,
                child: Center(
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
                          Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          height: 350,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Terms and Conditions",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "We use class details to provide personalized user experience and improve the features, "
                                "it automatically provide the notes and study material relevant to your class",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "By continuing, you are agree to Classage Terms of Service and Privacy Policy",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 20),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [

                                    Text(
                                        "By continue you have to agree terms and privacy policy"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );

                      */
/*
Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool value) {
                    setState(() {
                      isChecked = value;
                    });
                  }),
              Text("I agree to terms and conditions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
            ],
          ),
          ElevatedButton(
              onPressed: isChecked ? (){} : null,
              child: Text("hello"))
 */
