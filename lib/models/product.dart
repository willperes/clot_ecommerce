class Product {
  final String title;
  final String subtitle;
  final String description;
  final List<String> images;
  final double price;
  final int categoryID;

  const Product({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.images,
    required this.price,
    required this.categoryID,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    final List<String> images = List<String>.from(data["images"]);
    final double price = data["price"] is int
        ? (data["price"] as int).toDouble()
        : data["price"];

    return Product(
      title: data["title"],
      subtitle: data["subtitle"],
      description: data["description"],
      images: images,
      price: price,
      categoryID: data["categoryID"],
    );
  }

  factory Product.empty() => const Product(
        title: "",
        subtitle: "",
        description: "",
        images: [],
        price: 0,
        categoryID: 0,
      );
}
