import 'dart:convert';

import 'package:commuter/noname/WorkoutItem.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutPage extends StatefulWidget {
  final String bodyGroup;
  final String workoutType;
  const WorkoutPage({
    super.key,
    required this.bodyGroup,
    required this.workoutType,
  });

  @override
  State<WorkoutPage> createState() => _WorkoutPage();
}

class _WorkoutPage extends State<WorkoutPage> {
  int workoutTime = 0;
  int breakTime = 0;
  int warmUpTime = 0;

  Future<void> saveData(String workoutString) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> workoutList = prefs.getStringList('workouts') ?? [];

    workoutList.add(workoutString);

    await prefs.setStringList('workouts', workoutList);

    print("Success");
  }

  bool _isResting = false;
  Stopwatch warmUpWatch = Stopwatch();
  Stopwatch breakWatch = Stopwatch();
  Stopwatch workoutWatch = Stopwatch();
  String buttonName = "Start Workout";

Widget iconSelection() {
  switch (widget.workoutType) {
  case "Machine":
  return Icon(Icons.roller_shades);
  case "Weights":
  return Icon(Icons.fitness_center);
  default:
  return Icon(Icons.sports_gymnastics);

  }
}

  @override
  Widget build(BuildContext context) {
    warmUpWatch.start();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Page'),
        leading: IconButton(
            icon: Row(
              children: [ iconSelection()]),
            tooltip: 'WorkoutType',
            onPressed: () => Navigator.pop(context))),
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: SizedBox(
              width: 100,
              height: 100,
              child: InkWell(
                onTap: () {
                  if (_isResting) {
                    breakWatch.start();
                    workoutWatch.stop();
                    _isResting = false;
                    setState(() {
                      buttonName = "Continue";
                    });
                  } else {
                    breakWatch.stop();
                    warmUpWatch.stop();
                    workoutWatch.start();
                    _isResting = true;
                    setState(() {
                      buttonName = "Rest";
                    });
                  }
                },
                child: Center(child: Text(buttonName)),
              ),
            ),
          ),
          Card(
            child: SizedBox(
              width: 100,
              height: 100,
              child: InkWell(
                onTap: () {
                  breakWatch.stop();
                  workoutWatch.stop();
                  workoutTime = workoutWatch.elapsed.inSeconds;
                  breakTime = breakWatch.elapsed.inSeconds;
                  warmUpTime = warmUpWatch.elapsed.inSeconds;
                  if (workoutTime > 3) {
                    Workout workoutInstance = Workout(
                      date: DateTime.now().toIso8601String(),
                      bodyGroup: widget.bodyGroup,
                      workoutType: widget.workoutType,
                      workoutMins: (workoutTime / 60.0),
                      breakMins: (breakTime / 60.0),
                    );

                    saveData(jsonEncode(workoutInstance.toJson()));
                    setState(() {});
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Workout Not Long Enough. No Data Saved'),
                      ),
                    );
                    setState(() {});
                  }
                },
                child: Center(child: Text("End Session")),
              ),
            ),
          ),
          Text(widget.workoutType),
          Text(widget.bodyGroup),
          Text(workoutTime.toString()),
          Text(breakTime.toString()),
          Text(warmUpTime.toString()),
        ],
      ),
    );
  }
}
