import 'package:flutter/material.dart';

class UpperPage extends StatefulWidget {
  const UpperPage({super.key});

@override

State<UpperPage> createState() => _UpperPage();
}

class _UpperPage extends State<UpperPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Text("Hello Lower"),
    );
  }
}