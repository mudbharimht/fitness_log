import 'package:commuter/Widget/WorkoutPage.dart';
import 'package:flutter/material.dart';

class LowerPage extends StatefulWidget {
  const LowerPage({super.key});

  @override
  State<LowerPage> createState() => _LowerPage();
}

class _LowerPage extends State<LowerPage> {
  String date = DateTime.now().toIso8601String();
  final String _bodyGroup = "Lower";
  String _workoutType = "asd";

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Card(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                _workoutType = "Machine";
                debugPrint('Card tapped.');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutPage(
                      bodyGroup: _bodyGroup,
                      workoutType: _workoutType,
                    ),
                  ),
                );
              },
              child: const SizedBox(
                width: 300,
                height: 200,
                child: Text('Machine'),
              ),
            ),
          ),
          Card(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: const SizedBox(
                width: 300,
                height: 200,
                child: Text('FreeBody'),
              ),
            ),
          ),
          Card(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: const SizedBox(
                width: 300,
                height: 200,
                child: Text('Weights'),
              ),
            ),
          ),
        ],
    
    );
  }
}
