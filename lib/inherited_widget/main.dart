import 'package:flutter/material.dart';
import 'package:flutter_samples/inherited_widget/data/data.dart';
import 'package:flutter_samples/inherited_widget/models/server.dart';
import 'package:flutter_samples/inherited_widget/provider/app_state_widget.dart';
import 'package:flutter_samples/inherited_widget/widgets/product_list.dart';
import 'package:flutter_samples/inherited_widget/widgets/shopping_cart_icon.dart';

void main() => runApp(const MyApp());

@immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Widget',
      home: const InheritedWidgetApp(),
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}

class InheritedWidgetApp extends StatelessWidget {
  const InheritedWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppStateWidget(
      child: MyStorePage(),
    );
  }
}

class MyStorePage extends StatefulWidget {
  const MyStorePage({Key? key}) : super(key: key);

  @override
  MyStorePageState createState() => MyStorePageState();
}

class MyStorePageState extends State<MyStorePage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _inSearch = false;

  void _toggleSearch(BuildContext context) {
    setState(() => _inSearch = !_inSearch);

    AppStateWidget.of(context).setProductList(Server.getProductList());

    _controller.clear();
  }

  void _handleSearch(BuildContext context) {
    _focusNode.unfocus();
    final String filter = _controller.text;
    AppStateWidget.of(context).setProductList(
      Server.getProductList(filter: filter),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xFFF8F8F8),
            leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network('$baseAssetURL/google-logo.png'),
            ),
            title: _inSearch
                ? TextField(
                    autofocus: true,
                    focusNode: _focusNode,
                    controller: _controller,
                    onSubmitted: (_) => _handleSearch(context),
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Search Google Store',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () => _handleSearch(context)),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => _toggleSearch(context)),
                    ))
                : null,
            actions: [
              if (!_inSearch)
                IconButton(
                  onPressed: () => _toggleSearch(context),
                  icon: const Icon(Icons.search, color: Colors.black),
                ),
              const ShoppingCartIcon(),
            ],
          ),
          const SliverToBoxAdapter(child: ProductList()),
        ],
      ),
    );
  }
}
