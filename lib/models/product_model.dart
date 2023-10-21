import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final List<String> images;
  final double price;
  final int categoryID;
  final List<String> sizes;

  const ProductModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.images,
    required this.price,
    required this.categoryID,
    required this.sizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    final List<String> images = List<String>.from(data["images"]);
    final List<String> sizes = List<String>.from(data["sizes"]);
    final double price = data["price"] is int
        ? (data["price"] as int).toDouble()
        : data["price"];

    return ProductModel(
      id: data["id"],
      title: data["title"],
      subtitle: data["subtitle"],
      description: data["description"],
      images: images,
      price: price,
      categoryID: data["categoryID"],
      sizes: sizes,
    );
  }

  factory ProductModel.empty() => const ProductModel(
        id: 0,
        title: "",
        subtitle: "",
        description: "",
        images: [],
        price: 0,
        categoryID: 0,
        sizes: [],
      );

  @override
  List<Object> get props =>
      [id, title, subtitle, description, images, price, categoryID, sizes];
}
