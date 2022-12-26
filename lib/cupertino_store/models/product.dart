import 'package:flutter_samples/cupertino_store/models/category.dart';

class Product {
  const Product({
    required this.id,
    required this.price,
    required this.name,
    required this.isFeatured,
    required this.category,
  });

  final int id;
  final int price;
  final String name;
  final bool isFeatured;
  final Category category;

  @override
  String toString() {
    return '$name {id:$id, price:$price, category:$category, isFeatured:$isFeatured}';
  }
}

extension ExProduct on Product {
  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';
}
