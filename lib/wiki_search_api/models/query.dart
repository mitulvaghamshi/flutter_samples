import 'package:flutter/material.dart';
import 'package:flutter_samples/wiki_search_api/models/search.dart';

@immutable
class Query {
  const Query({required this.query});

  final Search query;

  factory Query.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> map = json['query'];
    return Query(query: Search.fromJson(map));
  }
}
