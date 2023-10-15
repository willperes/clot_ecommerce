class Category {
  final int id;
  final String title;
  final String image;

  const Category({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  factory Category.empty() => const Category(
        id: 0,
        title: "",
        image: "",
      );
}
