import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Calculadora', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(
          'Elige una sección para comenzar a explorar el catálogo.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 28),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.outline),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.calculate_outlined,
                size: 56,
                color: AppColors.accent,
              ),
              const SizedBox(height: 18),
              Text(
                'Diseño de calculadora',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Esta pantalla es el inicio de la aplicación y conserva el espacio para la lógica de cálculo.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
