import 'package:flutter/material.dart';

import '../api/store_api.dart';
import '../props/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({this.product, this.productId, super.key});

  final Product? product;
  final int? productId;

  Future<Product> _loadProduct() {
    if (product != null) {
      return Future.value(product!);
    }

    if (productId == null) {
      throw Exception('No se proporcionó un producto');
    }

    return FakeStoreApi.instance.getProduct(productId!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product>(
      future: _loadProduct(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Detalle del producto')),
            body: Center(
              child: Text('No se pudo cargar el producto: ${snapshot.error}'),
            ),
          );
        }

        final currentProduct = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            title: const Text('Detalle del producto'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentProduct.title,
                  style: const TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 30),
                Image.network(
                  currentProduct.image,
                  height: 240,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.image_not_supported_outlined,
                    size: 120,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  currentProduct.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 28),
                Text(
                  'Precio: \$${currentProduct.price.toStringAsFixed(2)}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF2196F3),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
