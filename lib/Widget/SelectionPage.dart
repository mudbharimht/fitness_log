import 'package:commuter/Widget/WorkoutPage.dart';
import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  final int selection;
  const SelectionPage({super.key, required this.selection});

  @override
  State<SelectionPage> createState() => _SelectionPage();
}

class _SelectionPage extends State<SelectionPage> {
  String date = DateTime.now().toIso8601String();
  String _bodyGroup = "Null";
  String _workoutType= "Null";

void workoutStarter(){
  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkoutPage(
                    bodyGroup: _bodyGroup,
                    workoutType: _workoutType,
                  ),
                ),
              );
}
  @override
  Widget build(BuildContext context) {
    switch (widget.selection) {
      case 0:
        _bodyGroup = "Lower";
        break;
      case 1:
        _bodyGroup = "Upper";
        break;
      case 2:
        _bodyGroup = "FreeForm";
        break;
      default:
        break;
    }
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
              debugPrint('Card tapped.');
              _workoutType = "Machine";
              workoutStarter();
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
              _workoutType = "Freebody";
              workoutStarter();
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
              _workoutType = "Weights";
              workoutStarter();
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
