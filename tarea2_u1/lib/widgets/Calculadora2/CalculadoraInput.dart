import 'package:flutter/material.dart';

class CalculadoraInput extends StatefulWidget {
  final TextEditingController input;
  final String labelText;
  final bool readOnly;

  const CalculadoraInput({
    super.key,
    required this.input,
    this.labelText = "",
    this.readOnly = false,
  });

  @override
  State<CalculadoraInput> createState() => _CalculadoraInputState();
}

class _CalculadoraInputState extends State<CalculadoraInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.input,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.labelText,
      ),
      readOnly: widget.readOnly,
    );
  }
}
