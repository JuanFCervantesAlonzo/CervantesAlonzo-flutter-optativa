import 'package:flutter/material.dart';

class Input2 extends StatefulWidget {
  final String labelText;
  final TextEditingController input;
  final bool readOnly;
  final FocusNode? focusNode;

  const Input2({
    super.key,
    required this.input,
    this.labelText = "",
    this.readOnly = false,
    this.focusNode,
  });

  @override
  State<Input2> createState() => _Input2State();
}

class _Input2State extends State<Input2> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.input,
      readOnly: widget.readOnly,
      focusNode: widget.focusNode,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
      ),
    );
  }
}