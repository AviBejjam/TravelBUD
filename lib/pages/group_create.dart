import 'package:demtrav/pages/chat/create/addm.dart';
import 'package:flutter/material.dart';

class Creategroup extends StatefulWidget {
  @override
  State<Creategroup> createState() => _CreategroupState();
}

class _CreategroupState extends State<Creategroup> {
  List<String> items = [
    'Paris',
    'Hyderabad',
    'Delhi',
    'NewYork',
    'Italy',
    'Shimla',
    'Kerala'
  ];
  String? selectedplace = 'Paris';

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Planning Destination?!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 184, 33, 204), // Adjusted text color
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButton<String>(
                  value: selectedplace,
                  items: items
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child:
                              Text(item, style: const TextStyle(fontSize: 24)),
                        ),
                      )
                      .toList(),
                  onChanged: (item) => setState(() => selectedplace = item),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddMembersInGroup(),
                      ),
                    );
                  },
                  child: const Text('Create Group'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
