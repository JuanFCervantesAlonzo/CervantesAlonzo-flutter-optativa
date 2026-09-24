import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/theme_button.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    required this.currentIndex,
    required this.onNavigate,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'CATÁLOGO / 2026',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.accent,
            letterSpacing: 1.8,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Text(
                'Calculadora',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: AppColors.background,
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            Expanded(
              child: ThemeButton(
                label: 'Calculadora',
                selected: currentIndex == 0,
                onPressed: () => onNavigate(0),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ThemeButton(
                label: 'Pantalla 2',
                selected: currentIndex == 1,
                onPressed: () => onNavigate(1),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ThemeButton(
                label: 'Pantalla 3',
                selected: currentIndex == 2,
                onPressed: () => onNavigate(2),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
