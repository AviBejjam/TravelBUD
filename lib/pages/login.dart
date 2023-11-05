import 'package:demtrav/pages/chat/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.purple.withOpacity(0.5),
            Colors.cyan.withOpacity(0.5),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(0, 106, 187, 228),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "TRAVELBUD",
                style: TextStyle(
                  color: Color.fromARGB(255, 106, 217, 236),
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "LOGIN",
                style: TextStyle(
                  color: const Color.fromARGB(255, 234, 229, 229),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 44.0,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "User Email",
                  prefixIcon: Icon(Icons.mail, color: Color.fromARGB(255, 204, 197, 197)),
                ),
              ),
              SizedBox(
                height: 26.0,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "User Password",
                  prefixIcon: Icon(Icons.security, color: Color.fromARGB(255, 230, 226, 226)),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(
                height: 88.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await _auth
                          .signInWithEmailAndPassword(
                              email: email, password: password)
                          .then((value) {
                        setState(() {
                          showSpinner = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                        print('Successfully Created');
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 48, 207, 210),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
