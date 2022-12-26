import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/cupertino_store/models/app_state.dart';
import 'package:flutter_samples/cupertino_store/models/product.dart';
import 'package:flutter_samples/cupertino_store/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, AppState value, Widget? child) {
        final List<Product> products = value.getProducts();
        return CustomScrollView(
          semanticChildCount: products.length,
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Cupertino Store'),
            ),
            SliverSafeArea(
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((_, int index) {
                  if (index < products.length) {
                    return ProductItem(
                      product: products[index],
                      lastItem: index == products.length - 1,
                    );
                  }
                  return null;
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
