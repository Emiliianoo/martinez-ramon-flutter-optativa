import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final TextEditingController inputIzq;
  final TextEditingController inputDer;
  final TextEditingController inputRespuesta;
  final String labelAction;

  const ActionButton({
    super.key,
    required this.inputIzq,
    required this.inputDer,
    required this.inputRespuesta,
    required this.labelAction,
  });

  @override
  State<ActionButton> createState() => _ActionButton();
}

class _ActionButton extends State<ActionButton> {
  void setAction() {
    if (widget.labelAction == "CLEAR") {
      widget.inputIzq.text = "";
      widget.inputDer.text = "";
      widget.inputRespuesta.text = "";
      return;
    }

    final double? inputIzq = double.tryParse(widget.inputIzq.text);
    final double? inputDer = double.tryParse(widget.inputDer.text);

    if (inputIzq == null || inputDer == null) {
      widget.inputRespuesta.text = "Entrada invalida";
      return;
    }

    double resultado;
    switch (widget.labelAction) {
      case "+":
        resultado = inputIzq + inputDer;
        break;
      case "-":
        resultado = inputIzq - inputDer;
        break;
      case "*":
        resultado = inputIzq * inputDer;
        break;
      case "/":
        if (inputDer == 0) {
          widget.inputRespuesta.text = "No se puede dividir entre 0";
          return;
        }
        resultado = inputIzq / inputDer;
        break;
      default:
        return;
    }

    widget.inputRespuesta.text = resultado.toString();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: setAction,
      child: Text(widget.labelAction),
    );
  }
}
