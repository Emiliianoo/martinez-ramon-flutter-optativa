import 'package:flutter/material.dart';

import 'CalculadoraButton.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String resultado = '';
  String accion = '';

  void _calcular(String operacion) {
    final num1 = double.tryParse(num1Controller.text);
    final num2 = double.tryParse(num2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        resultado = 'ERROR Ingresa números válidos';
        accion = _getOperacionNombre(operacion);
      });
      return;
    }

    double res = 0;
    switch (operacion) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          setState(() {
            resultado = 'ERROR No se puede dividir por 0';
            accion = _getOperacionNombre(operacion);
          });
          return;
        }
        res = num1 / num2;
        break;
    }

    setState(() {
      resultado = res.toStringAsFixed(2);
      accion = _getOperacionNombre(operacion);
    });
  }

  String _getOperacionNombre(String operacion) {
    switch (operacion) {
      case '+':
        return 'Suma';
      case '-':
        return 'Resta';
      case '*':
        return 'Multiplicación';
      case '/':
        return 'División';
      default:
        return '';
    }
  }

  void _borrar() {
    setState(() {
      num1Controller.clear();
      num2Controller.clear();
      resultado = '';
      accion = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarea 2 U2 Emiliano"),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'CALCULADORA',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30),
              Text(
                'Resultado: $resultado',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                'Acción: $accion',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: num1Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Primer número',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: num2Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Segundo número',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculadoraButton(
                    label: '+',
                    onPressed: () => _calcular('+'),
                  ),
                  CalculadoraButton(
                    label: '-',
                    onPressed: () => _calcular('-'),
                  ),
                  CalculadoraButton(
                    label: '*',
                    onPressed: () => _calcular('*'),
                  ),
                  CalculadoraButton(
                    label: '/',
                    onPressed: () => _calcular('/'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Botón Borrar
              SizedBox(
                width: double.infinity,
                child: CalculadoraButton(label: 'BORRAR', onPressed: _borrar),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
