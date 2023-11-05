import 'package:flutter/material.dart';

class activites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ItineraryPage(),
    );
  }
}

class ItineraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itinerary'),
        backgroundColor: const Color.fromARGB(255, 109, 73, 170),
      ),
      body: Container(
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
        child: ItineraryList(),
      ),
    );
  }
}

class ItineraryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DayTile(
          day: 'Day 1',
          details:
              'Visit to the Birla Science Museum, Visit to the Gravity Adventure Park',
          timings: 'Timings for Day 1: 9:00 AM - 5:00 PM',
        ),
        DayTile(
          day: 'Day 2',
          details: 'Visit to the Wonderla',
          timings: 'Timings for Day 2: 10:00 AM - 6:00 PM',
        ),
        DayTile(
          day: 'Day 3',
          details: 'Visit to the Golconda Fort , Visit to Ramoji Film City',
          timings: 'Timings for Day 3: 11:00 AM - 8:00 PM',
        ),
      ],
    );
  }
}

class DayTile extends StatefulWidget {
  final String day;
  final String details;
  final String timings;

  DayTile({required this.day, required this.details, required this.timings});

  @override
  _DayTileState createState() => _DayTileState();
}

class _DayTileState extends State<DayTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            widget.day,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          trailing: isExpanded
              ? Icon(Icons.keyboard_arrow_up)
              : Icon(Icons.keyboard_arrow_down),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.details,
                  style: TextStyle(color: Colors.blue),
                ),
                Text(
                  widget.timings,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
