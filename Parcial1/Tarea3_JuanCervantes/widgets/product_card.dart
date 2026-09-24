import 'package:flutter/material.dart';

import '../props/product.dart';
import '../theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    required this.quantity,
    required this.onAdd,
    super.key,
  });

  final Product product;
  final int quantity;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(product.name, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 14),
        Container(
          height: 190,
          decoration: BoxDecoration(
            color: AppColors.surfaceRaised,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.outline),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.headphones_outlined,
                size: 72,
                color: AppColors.accent,
              ),
              const SizedBox(height: 10),
              Text(
                product.imageLabel,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Text(
          '\$${product.price.toStringAsFixed(0)}',
          style: Theme.of(context).textTheme.headlineMedium
              ?.copyWith(color: AppColors.accent),
        ),
        const SizedBox(height: 8),
        Text('Descripción', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 5),
        Text(
          product.description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Container(
              width: 54,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.outline),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$quantity',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Spacer(),
            IconButton.filled(
              onPressed: onAdd,
              tooltip: 'Agregar producto',
              icon: const Icon(Icons.add),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: AppColors.background,
                fixedSize: const Size(54, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
