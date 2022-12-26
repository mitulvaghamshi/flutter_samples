import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/cupertino_store/tabs/product_list.dart';
import 'package:flutter_samples/cupertino_store/tabs/search_list.dart';
import 'package:flutter_samples/cupertino_store/tabs/shopping_cart.dart';

class CupertinoStoreApp extends StatelessWidget {
  const CupertinoStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Products',
          icon: Icon(CupertinoIcons.home),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(CupertinoIcons.search),
        ),
        BottomNavigationBarItem(
          label: 'Shopping Cart',
          icon: Icon(CupertinoIcons.shopping_cart),
        ),
      ]),
      tabBuilder: (_, int index) => CupertinoTabView(builder: (_) {
        return CupertinoPageScaffold(child: getPage(index));
      }),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 1:
        return const SearchList();
      case 2:
        return const ShoppingCart();
      case 0:
      default:
        return const ProductList();
    }
  }
}
