import 'dart:convert';

import 'package:flutter/material.dart';
import 'SelectionPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:commuter/noname/WorkoutItem.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return NavBar();
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});
  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  Future<List<Workout>> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> workoutList = prefs.getStringList('workouts') ?? [];

    List<Workout> workouts = workoutList
        .map((w) => Workout.fromJson(jsonDecode(w)))
        .toList();
    return workouts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Workout App'),

            Text(
              "${DateTime.now().day} || ${DateTime.now().month}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.border_bottom),
            tooltip: 'SnackBar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snacknnbar')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.line_weight),
            tooltip: 'Show Workout Logs',
            onPressed: () async {
              List<Workout> workouts = await loadData();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(title: const Text('Workout Logbook')),
                    body: SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Table might overflow
                      child: Table(
                        border: TableBorder.all(),
                        defaultColumnWidth: IntrinsicColumnWidth(),
                        children: [
                          TableRow(
                            children: [
                              Text(' Date '),
                              Text(' Body Group '),
                              Text(' Type '),
                              Text(' Workout Mins '),
                              Text(' Break Mins '),
                            ],
                          ),
                          for (var w in workouts)
                            TableRow(
                              children: [
                                Text("  ${w.date.substring(0, 10)}  "),
                                Text("  ${w.bodyGroup}  "),
                                Text("  ${w.workoutType}  "),
                                Text("  ${w.workoutMins.toStringAsFixed(1)}  "),
                                Text("  ${w.breakMins.toStringAsFixed(1)}  "),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SideRail(),
    );
  }
}

class SideRail extends StatefulWidget {
  const SideRail({super.key});

  @override
  State<SideRail> createState() => _SideRail();
}

class _SideRail extends State<SideRail> {
  int _selectedIndex = 0;

  int _selection = 0;

  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        //color: Color.fromARGB(200, 0, 200, 150),
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          spacing: 10,
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                  if (index == 0) {
                    _selection = 0;
                  } else if (index == 1) {
                    _selection = 1;
                  }
                  if (index == 2) {
                    _selection = 2;
                  }
                });
              },
              labelType: labelType,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Badge(
                    isLabelVisible: (_selection == 0),
                    child: Icon(Icons.keyboard_arrow_up),
                  ),
                  selectedIcon: Icon(Icons.keyboard_arrow_up),
                  label: Text("Upper"),
                ),

                NavigationRailDestination(
                  icon: Badge(
                    isLabelVisible: (_selection == 1),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                  ),
                  selectedIcon: Icon(Icons.keyboard_arrow_down),
                  label: Text("Lower"),
                ),

                NavigationRailDestination(
                  icon: Badge(
                    isLabelVisible: (_selection == 2),
                    child: Icon(
                      Icons.star_border,
                    ),
                  ),
                  selectedIcon: Badge(child: Icon(Icons.star)),
                  label: Text("Freeform"),
                ),
              ],
            ),

            Expanded(child: SelectionPage(selection: _selection)),
         
          ],

        ),
      ),
    );
  }
}
