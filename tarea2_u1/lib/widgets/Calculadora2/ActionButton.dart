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
  void SetAction() {
    if (widget.labelAction == "CLEAR") {
      widget.inputIzq.text = "";
      widget.inputDer.text = "";
      widget.inputRespuesta.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: SetAction,
      child: Text(widget.labelAction),
    );
  }
}
