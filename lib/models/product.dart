class Product {
  final String title;
  final String subTitle;
  final List<String> image;
  final double price;
  final ProductCategory category;

  const Product({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.price,
    required this.category,
  });
}

enum ProductCategory {
  tShirts,
  hoodies,
  shorts,
  shoes,
  bags,
  accessories,
}
