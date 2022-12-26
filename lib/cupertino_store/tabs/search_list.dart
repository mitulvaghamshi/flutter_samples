import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/cupertino_store/models/app_state.dart';
import 'package:flutter_samples/cupertino_store/models/product.dart';
import 'package:flutter_samples/cupertino_store/utils/styles.dart';
import 'package:flutter_samples/cupertino_store/widgets/product_item.dart';
import 'package:flutter_samples/cupertino_store/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  SearchListState createState() => SearchListState();
}

class SearchListState extends State<SearchList> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  String _terms = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(() => setState(() => _terms = _controller.text));
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppState model = Provider.of<AppState>(context, listen: false);
    final List<Product> results = model.search(_terms);
    return DecoratedBox(
      decoration: const BoxDecoration(color: Styles.scaffoldBackground),
      child: SafeArea(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchBar(controller: _controller, focusNode: _focusNode),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (_, int index) => ProductItem(
                product: results[index],
                lastItem: index == results.length - 1,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
