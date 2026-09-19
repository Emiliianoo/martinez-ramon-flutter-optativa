import 'package:flutter/material.dart';
import 'package:tarea2_u1/app_theme.dart';
import 'package:tarea2_u1/widgets/CalculatorPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.themeData, home: const CalculatorPage());
  }
}
