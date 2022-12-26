import 'package:flutter/material.dart';
import 'package:flutter_samples/scroll_cards/scroll_cards_stack.dart';

void main() => runApp(const MyApp());

@immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll Cards',
      home: const ScrollCardsApp(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class ScrollCardsApp extends StatelessWidget {
  const ScrollCardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScrollCardStack(count: 10),
      ),
    );
  }
}
