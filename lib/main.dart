import 'package:commuter/Widget/homescreen.dart';
import 'package:flutter/material.dart';

void main() {

  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fitlog V1.0",
        home: Homescreen()
        );
      
  }
}
     