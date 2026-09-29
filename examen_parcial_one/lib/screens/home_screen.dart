import 'package:flutter/material.dart';

import '../api/store_api.dart';
import '../props/product.dart';
import 'carts_screen.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const _ProductsPage(),
    const CartsScreen(),
  ];

  void selectPage(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedIndex == 0 ? 'Productos' : 'Carritos de compra'),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: selectPage,
        selectedItemColor: const Color(0xFF2196F3),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Carritos',
          ),
        ],
      ),
    );
  }
}

class _ProductsPage extends StatelessWidget {
  const _ProductsPage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: FakeStoreApi.instance.getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('No se pudieron cargar los productos: ${snapshot.error}'),
          );
        }

        final products = snapshot.data ?? [];
        if (products.isEmpty) {
          return const Center(child: Text('No hay productos para mostrar'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: Image.network(
                  product.image,
                  width: 64,
                  height: 64,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.image_not_supported_outlined,
                    size: 40,
                  ),
                ),
                title: Text(product.title),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.category,
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2196F3),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProductDetailScreen(productId: product.id),
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
