import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  final double result;
  final String action;

  const ResultText({super.key, required this.result, required this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Resultado: $result'),
        Text('Acción: $action'),
      ]
    );
  }
}