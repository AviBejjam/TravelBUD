import 'package:demtrav/pages/chat/join.dart';
import 'package:flutter/material.dart';
import 'package:demtrav/pages/group_create.dart';

class TwoPushButtons extends StatefulWidget {
  const TwoPushButtons({Key? key}) : super(key: key);

  @override
  State<TwoPushButtons> createState() => _TwoPushButtonsState();
}

class _TwoPushButtonsState extends State<TwoPushButtons> {
  // Create two buttons
  Widget getButton1() {
    return ElevatedButton(
      onPressed: () {
        // Do something when the button is pressed.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Creategroup(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.black, // Background color
        onPrimary: Colors.white, // Text color
        minimumSize: Size(200, 50), // Adjust button size
      ),
      child: Text(
        'Create Your Own Group',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget getButton2() {
    return ElevatedButton(
      onPressed: () {
        // Do something when the button is pressed.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Joinpage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.black, // Background color
        onPrimary: Colors.white, // Text color
        minimumSize: Size(200, 50), // Adjust button size
      ),
      child: Text(
        'Join a Group',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Colors.cyan,
            Colors.yellow,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Choose Your Preference',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Create A Group And Add Your Friends',
                style: TextStyle(),
              ),
              SizedBox(height: 30),
              getButton1(),
              SizedBox(height: 10), // Adjust spacing
              Text(
                'OR',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10), // Adjust spacing
              getButton2(),
              Spacer(),
              Spacer(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
