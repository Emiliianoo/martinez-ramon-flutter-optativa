import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String texto;
  final bool readOnly;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.texto,
    required this.readOnly,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: readOnly ? null : onPressed,
      child: Text(texto),
    );
  }
}