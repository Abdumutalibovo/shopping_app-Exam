class CategoryItem {
  final int id;
  final String name;
  final String imageUrl;
  final String createdAt;

  CategoryItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.createdAt,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      createdAt: json['created_at'] as String? ??"",
    );
  }
}
