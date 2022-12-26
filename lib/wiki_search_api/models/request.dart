import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/wiki_search_api/models/query.dart';
import 'package:http/http.dart' as http;

@immutable
class Request {
  static Uri _uri(String term) => Uri.parse(
      'https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=$term&format=json');

  static Future<Query?> query(String term) async {
    if (kDebugMode) {
      final jsonData = await rootBundle.loadString('assets/sample.json');
      final Map<String, dynamic> map = json.decode(jsonData);
      return Query.fromJson(map);
    }
    final response = await http.get(_uri(term));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> map = json.decode(response.body);
      return Query.fromJson(map);
    }
    if (kDebugMode) debugPrint(response.toString());
    return null;
  }
}
