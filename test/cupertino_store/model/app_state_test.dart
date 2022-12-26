import 'package:flutter_samples/cupertino_store/models/app_state.dart';
import 'package:flutter_samples/cupertino_store/models/category.dart';
import 'package:flutter_samples/cupertino_store/models/product.dart';
import 'package:test/test.dart';

void main() {
  group('Testing AppState Provider', () {
    final model = AppState();

    test('Test is loadProducts method loads the data', () {
      var list = model.getProducts(); // A list of products
      expect(list.isEmpty, true); // Should be empty initially

      model.loadProducts(); // load all the products
      list = model.getProducts(); // retrieve newly loaded products
      expect(list.length, 38); // total items should be 38

      // Sample product item
      const product = Product(
        id: 0,
        price: 120,
        isFeatured: true,
        name: 'Vagabond sack',
        category: Category.accessories,
      );

      // Match all properties of first product
      expect(list.first.id, product.id);
      expect(list.first.name, product.name);
      expect(list.first.price, product.price);
      expect(list.first.category, product.category);
      expect(list.first.isFeatured, product.isFeatured);
    });
  });
}
