import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/cupertino_store/models/app_state.dart';
import 'package:flutter_samples/cupertino_store/models/product.dart';
import 'package:flutter_samples/cupertino_store/utils/styles.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.lastItem,
  });

  final Product product;
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    final Widget row = SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8),
      child: Row(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            product.assetName,
            package: product.assetPackage,
            fit: BoxFit.cover,
            width: 76,
            height: 76,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(product.name, style: Styles.productRowItemName),
                Text('\$${product.price}', style: Styles.productRowItemPrice),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            final AppState model =
                Provider.of<AppState>(context, listen: false);
            model.addProductToCart(product.id);
          },
          child: const Icon(CupertinoIcons.add_circled, semanticLabel: 'Add'),
        ),
      ]),
    );

    if (lastItem) return row;

    return Column(children: <Widget>[
      row,
      const Divider(
        indent: 100,
        endIndent: 16,
        thickness: 1.5,
        color: Styles.productRowDivider,
      ),
    ]);
  }
}
