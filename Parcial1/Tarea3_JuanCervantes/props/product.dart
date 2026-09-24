class Product {
  const Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imageLabel,
  });

  final String name;
  final double price;
  final String description;
  final String imageLabel;
}

const demoProduct = Product(
  name: 'Audífonos inalámbricos',
  price: 1000,
  description: 'Disfruta tu música con sonido claro, diseño cómodo y batería para todo el día.',
  imageLabel: 'Imagen del producto',
);
