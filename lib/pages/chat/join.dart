// ignore_for_file: must_be_immutable

import 'package:demtrav/pages/chat/budget_chat.dart';
import 'package:demtrav/pages/chat/places.dart';
import 'package:flutter/material.dart';

class Joinpage extends StatefulWidget {
  const Joinpage({super.key});

  @override
  State<Joinpage> createState() => _JoinpageState();
}

class _JoinpageState extends State<Joinpage> {
  final _codeText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [
            Colors.cyan,
            Colors.yellow,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // title: const Text('Join User Page'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Enter the Code to Join a Group: ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
              const Text('\n'),
              TextField(
                controller: _codeText,
                decoration: InputDecoration(
                  hintText: 'Enter the Group Code',
                  border: const OutlineInputBorder(),
                  suffix: IconButton(
                    onPressed: () {
                      // clear the current text in it
                      _codeText.clear();
                    },
                    icon: const Icon(Icons.clear),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FourthPage(),
                      ),
                    );
                  },
                  color: Colors.black,
                  child: const Text('JOIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              const Text('\n'),
              const Text('\n'),
              const Text('------------OR------------',
              style: TextStyle(
                fontSize:20,
              ),),
              const Text('\n'),
              const Text('\n'),
              const Text('If You want to Explore Open Groups',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 10),
              const Text("(Click the button below)"),
              const Text('\n'),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:  MaterialStatePropertyAll(Colors.black),
                  foregroundColor:  MaterialStatePropertyAll(Colors.black),
                ),
                onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlacesPage(),
                    ),
                  );
                },
                child: const Text('Click Here',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                  // backgroundColor: Colors.black
                ),),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}