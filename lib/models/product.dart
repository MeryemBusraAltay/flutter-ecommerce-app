class Product {
  final int id;
  final String name;
  final String tagline;
  final String price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      tagline: json['tagline'],
      price: json['price'],
      imageUrl: json['image'],
    );
  }
}
