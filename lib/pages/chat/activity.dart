import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ActivitySelectionModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ActivityPage(),
      ),
    );
  }
}

class ActivitySelectionModel with ChangeNotifier {
  Map<String, bool> selectedActivities = {
    'Activity 1: Visit to the Birla Science Museum': false,
    'Activity 2: Visit to the Gravity Adventure Park': false,
    'Activity 3: Visit to the Wonderla': false,
    'Activity 4: Visit to the Golconda Fort': false,
    'Activity 5: Visit to Ramoji Film City': false,
  };

  Map<String, double> activityPrices = {
    'Activity 1: Visit to the Birla Science Museum': 150.0,
    'Activity 2: Visit to the Gravity Adventure Park': 2000.0,
    'Activity 3: Visit to the Wonderla': 2500.0,
    'Activity 4: Visit to the Golconda Fort': 200.0,
    'Activity 5: Visit to Ramoji Film City': 1500.0,
  };

  double calculateTotalCost() {
    double totalCost = 0.0;
    selectedActivities.forEach((activity, selected) {
      if (selected) {
        totalCost += activityPrices[activity]!;
      }
    });
    return totalCost;
  }

  void toggleActivitySelection(String activity) {
    selectedActivities[activity] = !selectedActivities[activity]!;
    notifyListeners();
  }
}

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.purple, Colors.blue],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Activity Selection',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ActivityList(),
            ),
            Consumer<ActivitySelectionModel>(
              builder: (context, model, child) {
                return Column(
                  children: model.selectedActivities.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '${entry.key}: ${entry.value ? 'Selected' : 'Not Selected'}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            Consumer<ActivitySelectionModel>(
              builder: (context, model, child) {
                return Text(
                  'Total Amount: \$${model.calculateTotalCost().toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activitySelectionModel = Provider.of<ActivitySelectionModel>(context);
    return ListView(
      children: activitySelectionModel.selectedActivities.keys.map((activity) {
        return ListTile(
          title: Text(activity),
          trailing: Checkbox(
            value: activitySelectionModel.selectedActivities[activity],
            onChanged: (value) {
              activitySelectionModel.toggleActivitySelection(activity);
            },
          ),
        );
      }).toList(),
    );
  }
}
