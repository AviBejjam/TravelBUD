import 'package:demtrav/pages/chat/activity.dart';
import 'package:demtrav/pages/chat/budget.dart';
import 'package:demtrav/pages/chat/grp_cht_screen.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  // Create two buttons
  Widget getButton1() {
    return ElevatedButton(
      onPressed: () {
        // Do something when the button is pressed.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupChatHomeScreen()
          ),
        );
      },
      child: const Text('Group Chat'),
    );
  }

  Widget getButton2() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => activity(),
          ),
        );
      },
      child: const Text('View Budget'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.red,
            Colors.blue,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getButton1(),
              const SizedBox(height: 20),
              getButton2(),
            ],
          ),
        ),
      ),
    );
  }
}