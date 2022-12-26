import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/cupertino_store/models/app_state.dart';
import 'package:flutter_samples/cupertino_store/models/product.dart';
import 'package:flutter_samples/cupertino_store/utils/styles.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.index,
    required this.product,
    required this.lastItem,
    required this.quantity,
    required this.formatter,
  });

  final Product product;
  final int index;
  final bool lastItem;
  final int quantity;
  final NumberFormat formatter;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(children: <Widget>[
          CupertinoButton(
            onPressed: () {
              final AppState model =
                  Provider.of<AppState>(context, listen: false);
              model.removeItemFromCart(product.id);
            },
            child: const Icon(
              CupertinoIcons.minus_circle,
              semanticLabel: 'Remove',
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: Styles.productRowItemName,
                      ),
                      Text(
                        formatter.format(quantity * product.price),
                        style: Styles.productRowItemName,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${quantity > 1 ? '$quantity x ' : ''}'
                    '${formatter.format(product.price)}',
                    style: Styles.productRowItemPrice,
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
