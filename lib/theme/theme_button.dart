import 'package:flutter/material.dart';

import 'app_theme.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    required this.label,
    required this.onPressed,
    this.selected = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: selected ? AppColors.background : AppColors.text,
          backgroundColor: selected ? AppColors.accent : Colors.transparent,
          side: BorderSide(
            color: selected ? AppColors.accent : AppColors.outline,
            width: 1.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Georgia',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
