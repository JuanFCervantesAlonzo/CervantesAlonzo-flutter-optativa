import 'package:flutter/material.dart';

import '../widgets/readonly_option.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const options = ['Botón 1', 'Botón 2', 'Botón 3', 'Botón 4', 'Botón 5'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Pantalla 2', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(
          'Opciones de ejemplo listas para recibir parámetros de texto.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        for (final option in options) ...[
          ReadonlyOption(label: option),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}
