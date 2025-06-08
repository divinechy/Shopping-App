class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final String description;
  final bool inStock;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    this.inStock = true,
  });
}
