import 'package:flutter/material.dart';

class Mycustomeinput extends StatelessWidget {
  
  final bool read;
  
  final String text;

  const Mycustomeinput({super.key, required this.text, this.read = false});
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: read,
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder()
      ),
    );
  }
}