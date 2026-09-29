class Cart {
  const Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    final productsJson = json['products'] as List<dynamic>? ?? [];

    return Cart(
      id: json['id'] as int,
      userId: json['userId'] as int,
      date: DateTime.parse(json['date'] as String),
      products: productsJson
          .map((item) => CartProduct.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  final int id;
  final int userId;
  final DateTime date;
  final List<CartProduct> products;
}

class CartProduct {
  const CartProduct({required this.productId, required this.quantity});

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
    );
  }

  final int productId;
  final int quantity;
}
