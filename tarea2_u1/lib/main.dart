import 'package:flutter/material.dart';
import 'package:tarea2_u1/widgets/CalculadoraPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CalculadoraPage());
  }
}
