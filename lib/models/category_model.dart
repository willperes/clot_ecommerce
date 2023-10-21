class CategoryModel {
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
}
