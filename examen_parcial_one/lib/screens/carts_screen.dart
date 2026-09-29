import 'package:flutter/material.dart';

import '../widgets/empty_state.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyState(
      message: 'No hay carritos de compra para mostrar',
    );
  }
}
