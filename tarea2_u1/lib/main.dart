import 'package:flutter/material.dart';
import 'package:tarea2_u1/widgets/Calculadora2/ActionButton.dart';
import 'package:tarea2_u1/widgets/Calculadora2/CalculadoraInput.dart';
import 'package:tarea2_u1/widgets/Calculadora2/NumberInput.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController inputIzq = TextEditingController();
    TextEditingController inputDer = TextEditingController();
    TextEditingController inputRespuesta = TextEditingController();

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
                    child: NumberInput(
                      input: inputIzq,
                      input2: inputDer,
                      labelNumber: "1",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputIzq,
                      input2: inputDer,
                      labelNumber: "2",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputIzq,
                      input2: inputDer,
                      labelNumber: "3",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: NumberInput(
                      input: inputIzq,
                      input2: inputDer,
                      labelNumber: "4",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputIzq,
                      input2: inputDer,
                      labelNumber: "5",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputIzq,
                      input2: inputDer,
                      labelNumber: "6",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: NumberInput(
                      input: inputIzq,
                      input2: inputDer,
                      labelNumber: "7",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputIzq,
                      input2: inputDer,
                      labelNumber: "8",
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberInput(
                      input: inputIzq,
                      input2: inputDer,
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
                      input: inputIzq,
                      input2: inputDer,
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
            ],
          ),
        ),
      ),
    );
  }
}
