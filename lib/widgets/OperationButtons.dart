import 'package:flutter/material.dart';

class OperationButtons extends StatelessWidget {
  final void Function(String operation) onOperation;

  const OperationButtons({super.key, required this.onOperation});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(onPressed: () => onOperation('suma'), child: const Text('+')),
        ElevatedButton(onPressed: () => onOperation('resta'), child: const Text('-')),
        ElevatedButton(onPressed: () => onOperation('multiplicacion'), child: const Text('*')),
        ElevatedButton(onPressed: () => onOperation('division'), child: const Text('/')),   
      ],);
  }
}