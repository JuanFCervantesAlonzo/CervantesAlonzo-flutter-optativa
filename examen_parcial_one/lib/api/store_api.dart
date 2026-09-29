import 'dart:convert';

import 'package:http/http.dart' as http;

import '../props/cart.dart';
import '../props/product.dart';

abstract class StoreApi {
  Future<List<Product>> getProducts();

  Future<Product> getProduct(int id);

  Future<List<Cart>> getCarts();

  Future<Cart> getCart(int id);
}

class FakeStoreApi implements StoreApi {
  FakeStoreApi._();

  static final FakeStoreApi instance = FakeStoreApi._();

  static const String _baseUrl = 'https://fakestoreapi.com';

  @override
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));

    if (response.statusCode != 200) {
      throw Exception('Error al cargar los productos');
    }

    final List<dynamic> decoded = jsonDecode(response.body);
    return decoded
        .map((item) => Product.fromJson(Map<String, dynamic>.from(item)))
        .toList();
  }

  @override
  Future<Product> getProduct(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));

    if (response.statusCode != 200) {
      throw Exception('Error al cargar el detalle del producto');
    }

    final decoded = jsonDecode(response.body);
    return Product.fromJson(Map<String, dynamic>.from(decoded));
  }

  @override
  Future<List<Cart>> getCarts() async {
    final response = await http.get(Uri.parse('$_baseUrl/carts'));

    if (response.statusCode != 200) {
      throw Exception('Error al cargar los carritos');
    }

    final List<dynamic> decoded = jsonDecode(response.body);
    return decoded
        .map((item) => Cart.fromJson(Map<String, dynamic>.from(item)))
        .toList();
  }

  @override
  Future<Cart> getCart(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/carts/$id'));

    if (response.statusCode != 200) {
      throw Exception('Error al cargar el detalle del carrito');
    }

    final decoded = jsonDecode(response.body);
    return Cart.fromJson(Map<String, dynamic>.from(decoded));
  }
}
