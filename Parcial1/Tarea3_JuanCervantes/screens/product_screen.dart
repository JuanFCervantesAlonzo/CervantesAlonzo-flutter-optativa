import 'package:flutter/material.dart';

import '../props/product.dart';
import '../widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({required this.quantity, required this.onAdd, super.key});

  final int quantity;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return ProductCard(product: demoProduct, quantity: quantity, onAdd: onAdd);
  }
}
