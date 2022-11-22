class ProductItem {
  final int id;
  final int categoryId;
  final String name;
  final int price;
  final String imageUrl;
  final String description;

  ProductItem({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json['id'] as int? ?? 0,
      categoryId: json['category_id'] as int? ??0,
      name: json['name'] as String? ?? "",
      price: json['price'] as int? ??0,
      imageUrl: json['image_url'] as String? ?? "",
      description: json['description'] as String? ??"",
    );
  }
}

// "id":1,
// "category_id":1,
// "name":"Macbook",
// "price":1200,
// "image_url":"https://e7.pngegg.com/pngimages/765/477/png-clipart-macbook-macbook.png",
// "description":"Bu description bo'ladi"
