import 'package:flutter/material.dart';

class NumberInput extends StatefulWidget {
  final TextEditingController input;
  final TextEditingController input2;
  final String labelNumber;

  const NumberInput({
    super.key,
    required this.input,
    required this.input2,
    required this.labelNumber,
  });

  @override
  State<NumberInput> createState() => _NumberInput();
}

class _NumberInput extends State<NumberInput> {
  @override
  Widget build(BuildContext context) {
    void setNumber() {
      widget.input.text += widget.labelNumber;
    }

    return ElevatedButton(
      onPressed: setNumber,
      child: Text(widget.labelNumber),
    );
  }
}
