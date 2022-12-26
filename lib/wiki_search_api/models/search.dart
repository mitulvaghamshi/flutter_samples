import 'package:flutter/material.dart';
import 'package:flutter_samples/wiki_search_api/models/entity.dart';

@immutable
class Search {
  const Search({required this.search});

  final List<Entity> search;

  factory Search.fromJson(Map<String, dynamic> json) {
    final List<Map<String, dynamic>> list = List.from(json['search']);
    final search = list.map(Entity.fromJson).toList(growable: false);
    return Search(search: search);
  }
}
