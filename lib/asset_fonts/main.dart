import 'package:flutter/material.dart';
import 'package:flutter_samples/asset_fonts/data/data.dart';

void main() => runApp(const MyApp());

@immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asset Fonts',
      home: const AssetFontsApp(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

@immutable
class AssetFontsApp extends StatelessWidget {
  const AssetFontsApp({super.key});

  String get text => 'A Quick Brown Fox Jumps Over The Lazy Dog!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Asset Fonts')),
      body: ListView.builder(
        itemCount: fontList.length,
        itemBuilder: (context, index) {
          final font = fontList[index];
          var textStyle = TextStyle(fontFamily: font.name, fontSize: 30);
          return ExpansionTile(title: Text(font.title), children: [
            Text(text.toUpperCase(),
                style: textStyle, textAlign: TextAlign.center),
            Text(text.toLowerCase(),
                style: textStyle, textAlign: TextAlign.center),
            Text('1234567890', style: textStyle, textAlign: TextAlign.center),
          ]);
        },
      ),
    );
  }
}
