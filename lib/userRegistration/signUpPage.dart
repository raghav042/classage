import 'package:classage/classroom/utils.dart';
import 'package:classage/userRegistration/firebaseServices.dart';
import 'package:classage/userRegistration/professionPage.dart';
import 'package:flutter/material.dart';
import '../mainScreen.dart';
import 'helper.dart';
import 'signInPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  //bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              topProgressIndicator(MediaQuery.of(context).size.width / 3),
              SizedBox(height: 20),
              Text(
                "Create an account",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              registrationForm(),
              SizedBox(height: 80),
              Container(
                width: 300,
                height: 72,
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_name.text.isNotEmpty &&
                        _email.text.isNotEmpty &&
                        _password.text.isNotEmpty) {
                      await signUp(_name.text, _email.text, _password.text);
                      Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => ProfessionPage()),
                              (Route<dynamic> route) => false)
                          /*await UserPreferences.setUserName(_name.text);
                              await UserPreferences.setUserEmail(_email.text)*/
                          .then((user) {
                        if (user != null) {
                          return ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                                  duration: Duration(microseconds: 300),
                                  backgroundColor: Colors.lightBlueAccent,
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('Created Successfully'),
                                    ],
                                  )));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.lightBlueAccent,
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Oops login Failed'),
                                ],
                              )));
                        }
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.lightBlueAccent,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Please enter fields'),
                            ],
                          )));
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 280,
                height: 58,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => ProfessionPage()),
                        (Route<dynamic> route) => false);
                    await signInWithGoogle();

                    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(microseconds: 300),
                        backgroundColor: Colors.lightBlueAccent,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Created Successfully'),
                          ],
                        )));
                  },
                  child: Text(
                    "Continue with Google",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                color: Colors.white30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already registered? "),
                    TextButton(
                      child: Text(
                        "Login Here",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()),
                            (Route<dynamic> route) => false);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget registrationForm() {
    return SizedBox(
      width: 320,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          TextFormField(
            controller: _name,
            keyboardType: TextInputType.name,
            decoration: textFieldDecoration(Icon(Icons.person)),
            validator: (_nameValue) {
              if (_nameValue == null) {
                return 'name required';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          TextFormField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            decoration: textFieldDecoration(Icon(Icons.mail)),
            validator: (_emailValue) {
              RegExp regex = RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
              if (!regex.hasMatch(_emailValue)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          TextFormField(
            controller: _password,
            decoration: textFieldDecoration(Icon(Icons.lock)),
            obscureText: true,
            validator: (_passwordValue) {
              if (_passwordValue.isEmpty || _passwordValue == null) {
                return 'Password is Required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
