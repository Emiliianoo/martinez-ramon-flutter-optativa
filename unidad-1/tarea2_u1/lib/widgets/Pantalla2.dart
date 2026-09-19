import 'package:flutter/material.dart';
import 'package:tarea2_u1/widgets/Pantalla2/CustomButton.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantalla 2")),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            const CustomButton(texto: "Botón 1", readOnly: true),
            const SizedBox(height: 16.0),
            const CustomButton(texto: "Botón 2", readOnly: true),
            const SizedBox(height: 16.0),
            const CustomButton(texto: "Botón 3", readOnly: true),
            const SizedBox(height: 16.0),
            const CustomButton(texto: "Botón 4", readOnly: true),
            const SizedBox(height: 16.0),
            const CustomButton(texto: "Botón 5", readOnly: true),
          ],
        ),
      ),
    );
  }
}
