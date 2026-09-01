import 'package:flutter/material.dart';

class Numero extends StatelessWidget {
  final int num;

  const Numero({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Número: $num',
      style: const TextStyle(fontSize: 24),
    );
  }
}