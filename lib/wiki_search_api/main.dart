import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/wiki_search_api/models/entity.dart';
import 'package:flutter_samples/wiki_search_api/models/request.dart';
import 'package:flutter_samples/wiki_search_api/widgets/search_bar.dart';
import 'package:flutter_samples/wiki_search_api/widgets/search_item.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Wiki Search API',
      home: WikiSearchApp(),
    );
  }
}

@immutable
class WikiSearchApp extends StatefulWidget {
  const WikiSearchApp({super.key});

  @override
  WikiSearchAppState createState() => WikiSearchAppState();
}

class WikiSearchAppState extends State<WikiSearchApp> {
  final _searchCtrl = TextEditingController();
  List<Entity> searchList = [];

  void _search() async {
    final query = _searchCtrl.text;
    final response = await Request.query(query);
    setState(() => searchList = response!.query.search);
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        semanticChildCount: searchList.length,
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Wiki Search Api'),
          ),
          SliverSafeArea(
            top: false,
            minimum: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((_, int index) {
                if (index == 0) {
                  return SearchBar(onSearch: _search, controller: _searchCtrl);
                } else if (index <= searchList.length) {
                  return SearchItem(entity: searchList[index - 1]);
                }
                return null;
              }),
            ),
          ),
        ],
      ),
    );
  }
}
