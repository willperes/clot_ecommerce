import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int id;
  final String title;
  final String image;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  factory CategoryModel.empty() => const CategoryModel(
        id: 0,
        title: "",
        image: "",
      );

  @override
  List<Object> get props => [id, title, image];
}
