import 'package:flutter/material.dart';
import 'package:tarea2_u1/widgets/Calculadora2/ActionButton.dart';
import 'package:tarea2_u1/widgets/Calculadora2/CalculadoraInput.dart';
import 'package:tarea2_u1/widgets/Calculadora2/NumberInput.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController inputIzq = TextEditingController();
  final TextEditingController inputDer = TextEditingController();
  final TextEditingController inputRespuesta = TextEditingController();
  late TextEditingController inputSeleccionado;

  @override
  void initState() {
    super.initState();
    inputSeleccionado = inputIzq;
  }

  @override
  void dispose() {
    inputIzq.dispose();
    inputDer.dispose();
    inputRespuesta.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tarea 2 U2 Emiliano"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CalculadoraInput(
                      input: inputIzq,
                      labelText: "Input izq",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: CalculadoraInput(
                      input: inputDer,
                      labelText: "Input der",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Center(
                child: CalculadoraInput(
                  input: inputRespuesta,
                  labelText: "Input Respuesta",
                  readOnly: true,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          setState(() => inputSeleccionado = inputIzq),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: inputSeleccionado == inputIzq
                            ? Colors.green
                            : null,
                      ),
                      child: const Text("Usar input izq"),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          setState(() => inputSeleccionado = inputDer),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: inputSeleccionado == inputDer
                            ? Colors.green
                            : null,
                      ),
                      child: const Text("Usar input der"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: NumberInput(
                      input: inputSeleccionado,
                      labelNumber: "1",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputSeleccionado,
                      labelNumber: "2",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputSeleccionado,
                      labelNumber: "3",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: NumberInput(
                      input: inputSeleccionado,
                      labelNumber: "4",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputSeleccionado,
                      labelNumber: "5",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputSeleccionado,
                      labelNumber: "6",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: NumberInput(
                      input: inputSeleccionado,
                      labelNumber: "7",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputSeleccionado,
                      labelNumber: "8",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputSeleccionado,
                      labelNumber: "9",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: SizedBox(width: 16)),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputSeleccionado,
                      labelNumber: "0",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(child: SizedBox(width: 16)),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ActionButton(
                  inputIzq: inputIzq,
                  inputDer: inputDer,
                  inputRespuesta: inputRespuesta,
                  labelAction: "CLEAR",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ActionButton(
                      inputIzq: inputIzq,
                      inputDer: inputDer,
                      inputRespuesta: inputRespuesta,
                      labelAction: "+",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ActionButton(
                      inputIzq: inputIzq,
                      inputDer: inputDer,
                      inputRespuesta: inputRespuesta,
                      labelAction: "-",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ActionButton(
                      inputIzq: inputIzq,
                      inputDer: inputDer,
                      inputRespuesta: inputRespuesta,
                      labelAction: "*",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ActionButton(
                      inputIzq: inputIzq,
                      inputDer: inputDer,
                      inputRespuesta: inputRespuesta,
                      labelAction: "/",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
