class FruitModel {
  final String image;
  final String name;
  final double price;

  FruitModel({
    required this.image,
    required this.name,
    required this.price,
  });

  FruitModel copyWith({
    String? image,
    String? name,
    double? price,
  }) {
    return FruitModel(
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }
}
