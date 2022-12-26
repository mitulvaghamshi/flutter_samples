import 'package:flutter/material.dart';
import 'package:flutter_samples/inherited_widget/data/data.dart';
import 'package:flutter_samples/inherited_widget/models/product.dart';

@immutable
class Server {
  static Product getProductById(String id) => kDummyData[id]!;

  static List<String> getProductList({String? filter}) {
    if (filter == null) return kDummyData.keys.toList();
    final List<String> ids = <String>[];
    for (final Product product in kDummyData.values) {
      if (product.title.toLowerCase().contains(filter.toLowerCase())) {
        ids.add(product.id);
      }
    }
    return ids;
  }
}
