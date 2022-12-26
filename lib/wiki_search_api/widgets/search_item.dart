import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_samples/wiki_search_api/models/entity.dart';

@immutable
class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.entity});

  final Entity entity;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(entity.title, style: textStyle),
      Html(data: entity.snippet, style: {
        'body': Style(
          color: textStyle.color?.withOpacity(0.6),
          margin: const EdgeInsets.symmetric(vertical: 10),
        ),
      }),
    ]);
  }
}
