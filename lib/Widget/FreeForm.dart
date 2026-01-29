import 'package:flutter/material.dart';

class FreeForm extends StatefulWidget {
  const FreeForm({super.key});

@override

State<FreeForm> createState() => _FreeForm();
}

class _FreeForm extends State<FreeForm> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Text("Hello Lower"),
    );
  }
}