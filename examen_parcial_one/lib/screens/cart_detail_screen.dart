import 'package:flutter/material.dart';

import '../api/store_api.dart';
import '../props/cart.dart';

class _CartItemRow {
  const _CartItemRow({
    required this.title,
    required this.price,
    required this.quantity,
    required this.image,
  });

  final String title;
  final double price;
  final int quantity;
  final String image;

  double get lineTotal => price * quantity;
}

class CartDetailScreen extends StatelessWidget {
  const CartDetailScreen({this.cart, this.cartId, super.key});

  final Cart? cart;
  final int? cartId;

  Future<Cart> _loadCart() {
    if (cart != null) {
      return Future.value(cart!);
    }

    if (cartId == null) {
      throw Exception('No se proporcionó el carrito');
    }

    return FakeStoreApi.instance.getCart(cartId!);
  }

  Future<List<_CartItemRow>> _loadCartItems(Cart cart) async {
    final rows = <_CartItemRow>[];

    for (final item in cart.products) {
      final product = await FakeStoreApi.instance.getProduct(item.productId);
      rows.add(
        _CartItemRow(
          title: product.title,
          price: product.price,
          quantity: item.quantity,
          image: product.image,
        ),
      );
    }

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Cart>(
      future: _loadCart(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Detalle del carrito')),
            body: Center(
              child: Text('No se pudo cargar el carrito: ${snapshot.error}'),
            ),
          );
        }

        final currentCart = snapshot.data!;

        return FutureBuilder<List<_CartItemRow>>(
          future: _loadCartItems(currentCart),
          builder: (context, itemsSnapshot) {
            if (itemsSnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            final rows = itemsSnapshot.data ?? const <_CartItemRow>[];
            final total = rows.fold<double>(
              0,
              (sum, item) => sum + item.lineTotal,
            );

            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                  children: [
                    Container(
                      color: const Color(0xFF2196F3),
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 18),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
                          ),
                          const Expanded(
                            child: Text(
                              'Carrito #3',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.fromLTRB(24, 22, 24, 32),
                        children: [
                          const Text(
                            'Cliente',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Nombre: david morrison',
                            style: const TextStyle(fontSize: 22, color: Colors.black87),
                          ),
                          Text(
                            'Correo: morrison@gmail.com',
                            style: const TextStyle(fontSize: 22, color: Colors.black87),
                          ),
                          const SizedBox(height: 28),
                          const Text(
                            'Productos',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ...rows.map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        item.image,
                                        fit: BoxFit.contain,
                                        errorBuilder: (context, error, stackTrace) => const Icon(
                                          Icons.image_not_supported_outlined,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                        Text(
                                          '\$${item.price.toStringAsFixed(2)} x ${item.quantity}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '\$${item.lineTotal.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(height: 24, thickness: 1.2),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Total: \$${total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
