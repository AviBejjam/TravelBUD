import 'package:demtrav/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demtrav/pages/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "Registration_screen";

  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  String email = '';
  String password = '';
  String name = ''; // Add this line to capture user's name
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set the background color to transparent
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.cyan,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email '),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value; // Capture user's name
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your name '),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password '),
              ),
              const SizedBox(
                height: 24.0,
              ),
              ElevatedButton(
                child: showSpinner
                    ? const CircularProgressIndicator() // Show loading spinner
                    : const Text('Register'),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  try {
                    // Create new Account
                    await _auth
                        .createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    )
                        .then((value) async {
                      // Set display name immediately after user creation
                      await value.user?.updateDisplayName(name);

                      setState(() {
                        showSpinner = false;
                      });

                      // Update Firestore
                      await _firestore
                          .collection('users')
                          .doc(value.user!.uid)
                          .set({
                        "name": name,
                        "email": email,
                        "status": "Unavailable",
                        "uid": value.user!.uid,
                      });

                      // Navigate to the home page and replace the current page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TwoPushButtons(),
                        ),
                      );
                      print('Successfully Created');
                    });
                  } catch (e) {
                    // Handle registration error
                    setState(() {
                      showSpinner = false;
                    });
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Registration failed. Please try again.'),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
