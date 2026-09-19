import 'package:flutter/material.dart';
import 'package:tarea2_u1/app_theme.dart';
import 'package:tarea2_u1/widgets/CalculatorPage.dart';
import 'package:tarea2_u1/widgets/Pantalla2.dart';
import 'package:tarea2_u1/widgets/Pantalla3.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      home: Scaffold(
        appBar: AppBar(title: const Text("Tarea 2 U1")),
        body: Center(
          child: Builder(
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalculatorPage(),
                      ),
                    );
                  },
                  child: const Text("Calculadora"),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Pantalla2(),
                      ),
                    );
                  },
                  child: const Text("Pantalla 2"),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Pantalla3(),
                      ),
                    );
                  },
                  child: const Text("Pantalla 3"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
