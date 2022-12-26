import 'package:flutter/material.dart';

@immutable
class Entity {
  const Entity({
    required this.ns,
    required this.title,
    required this.pageId,
    required this.size,
    required this.wordCount,
    required this.snippet,
    required this.timestamp,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      ns: json['ns'],
      title: json['title'],
      pageId: json['pageid'],
      size: json['size'],
      wordCount: json['wordcount'],
      snippet: json['snippet'],
      timestamp: json['timestamp'],
    );
  }

  final int ns;
  final String title;
  final int pageId;
  final int size;
  final int wordCount;
  final String snippet;
  final String timestamp;
}
