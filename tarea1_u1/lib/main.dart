import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tarea1_u1/widgets/MyButtonState.dart';
import 'package:tarea1_u1/widgets/MyCustomInput.dart';
import 'package:tarea1_u1/widgets/MyForm.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mi primera app"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              MyCustomInput(text: "Enter your name"),
              MyButtonState(),
              MyForm(),
            ],
          ),
        ),
      ),
    );
  }
}
