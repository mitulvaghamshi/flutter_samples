import 'package:flutter/material.dart';
import 'package:flutter_samples/inherited_widget/models/server.dart';
import 'package:flutter_samples/inherited_widget/provider/app_state_scope.dart';
import 'package:flutter_samples/inherited_widget/provider/app_state_widget.dart';
import 'package:flutter_samples/inherited_widget/widgets/product_tile.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  void _handleAddToCart(String id, BuildContext context) {
    AppStateWidget.of(context).addToCart(id);
  }

  void _handleRemoveFromCart(String id, BuildContext context) {
    AppStateWidget.of(context).removeFromCart(id);
  }

  Widget _buildProductTile(String id, BuildContext context) {
    return ProductTile(
      product: Server.getProductById(id),
      purchased: AppStateScope.of(context).itemsInCart.contains(id),
      onAddToCart: () => _handleAddToCart(id, context),
      onRemoveFromCart: () => _handleRemoveFromCart(id, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> productList = AppStateScope.of(context).productList;
    return Column(
      children: productList
          .map((String id) => _buildProductTile(id, context))
          .toList(),
    );
  }
}
