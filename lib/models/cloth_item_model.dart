class WardrobeItem {
  final String name;
  final String? category;
  final List<String> color;
  final double? price;
  String brand;
  String imageUrl;
  final String id;
  final bool? isFavorite;
  final String uploadedBy;

  WardrobeItem({
    this.isFavorite,
    required this.id,
    required this.name,
    this.category,
    required this.color,
    required this.price,
    this.brand = "Generic",
    this.imageUrl = "https://picsum.photos/300",
    required this.uploadedBy,
  });

  factory WardrobeItem.fromMap(Map<String, dynamic> map) {
    return WardrobeItem(
      id: map['id'],
      name: map['name'],
      category: map['category'] ?? "Other",
      color: List<String>.from(map['color']),
      price: (map['price'] as int).toDouble(),
      brand: map['brand'],
      imageUrl: map['imageUrl'] ?? "https://picsum.photos/300",
      uploadedBy: map['uploadedBy'],
      isFavorite: map['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'favorited': isFavorite,
      'color': color,
      'price': price,
      'brand': brand,
      'imageUrl': imageUrl,
      'uploadedBy': uploadedBy,
    };
  }
}
