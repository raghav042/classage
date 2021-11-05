import 'package:classage/mainScreen.dart';
import 'package:classage/userRegistration/helper.dart';
import 'package:classage/userRegistration/signUpPage.dart';
import 'package:classage/userRegistration/firebaseServices.dart';
import 'package:flutter/material.dart';
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        //backgroundColor: Colors.white,
        body: isLoading
            ? Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    Text("Processing Data"),
                  ],
                ),
            )
            : SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40),
                      Text(
                        "Login to continue",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40.0),
                                child: Text(
                                  "email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 18),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 26),
                              child: TextFormField(
                                controller: _email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: textFieldDecoration(Icon(Icons.mail)),
                              ),
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40.0),
                                child: Text(
                                  "password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 18),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 26),
                              child: TextFormField(
                                controller: _password,
                                decoration: textFieldDecoration(Icon(Icons.lock)),
                                obscureText: true,
                              ),
                            ),
                            SizedBox(height: 100),
                            Container(
                              width: 300,
                              height: 72,
                              padding: EdgeInsets.all(8),
                              child: ElevatedButton(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    if (_email.text.isNotEmpty &&
                                        _password.text.isNotEmpty) {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      logIn(_email.text, _password.text)
                                          .then((user) {
                                        if (user != null) {
                                          print('login Successfull');
                                          setState(() {
                                            isLoading = false;
                                          });
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => MainScreen()),
                                              (Route<dynamic> route) => false);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor:
                                                      Colors.lightBlueAccent,
                                                  content: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text('oops login failed'),
                                                    ],
                                                  )));
                                          setState(() {
                                            isLoading = false;
                                          });
                                        }
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                              backgroundColor:
                                                  Colors.lightBlueAccent,
                                              content: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      'email or password are incorrect'),
                                                ],
                                              )));
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 250,
                        color: Colors.white30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                // send to login screen
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) => SignUpPage()),
                                    (Route<dynamic> route) => false);
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ),

    );
  }
}
