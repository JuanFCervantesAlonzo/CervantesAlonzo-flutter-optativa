import 'package:flutter/material.dart';

import '../api/store_api.dart';
import '../props/cart.dart';
import 'cart_detail_screen.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>>(
      future: FakeStoreApi.instance.getCarts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('No se pudieron cargar los carritos: ${snapshot.error}'),
          );
        }

        final carts = snapshot.data ?? [];
        if (carts.isEmpty) {
          return const Center(child: Text('No hay carritos de compra para mostrar'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: carts.length,
          itemBuilder: (context, index) {
            final cart = carts[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: const Icon(Icons.shopping_cart_outlined, size: 40),
                title: Text('Cliente - ${cart.userId}'),
                subtitle: const Text('Click para ver detalles'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CartDetailScreen(cartId: cart.id),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
