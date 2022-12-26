import 'package:flutter/material.dart';
import 'package:flutter_samples/inherited_widget/models/server.dart';
import 'package:flutter_samples/inherited_widget/provider/app_state.dart';
import 'package:flutter_samples/inherited_widget/provider/app_state_scope.dart';

class AppStateWidget extends StatefulWidget {
  const AppStateWidget({super.key, required this.child});

  final Widget child;

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  AppStateWidgetState createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  AppState _data = AppState(productList: Server.getProductList());

  void setProductList(List<String> newProductList) {
    if (newProductList != _data.productList) {
      setState(() {
        _data = _data.copyWith(productList: newProductList);
      });
    }
  }

  void addToCart(String id) {
    if (!_data.itemsInCart.contains(id)) {
      final Set<String> newItemsInCart = Set<String>.from(_data.itemsInCart);
      newItemsInCart.add(id);
      setState(() {
        _data = _data.copyWith(itemsInCart: newItemsInCart);
      });
    }
  }

  void removeFromCart(String id) {
    if (_data.itemsInCart.contains(id)) {
      final Set<String> newItemsInCart = Set<String>.from(_data.itemsInCart);
      newItemsInCart.remove(id);
      setState(() {
        _data = _data.copyWith(itemsInCart: newItemsInCart);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(_data, child: widget.child);
  }
}
