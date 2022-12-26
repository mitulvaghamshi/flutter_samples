import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/cupertino_store/app.dart';
import 'package:flutter_samples/cupertino_store/models/app_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState()..loadProducts(),
      child: const CupertinoApp(
        title: 'Cupertino Store',
        home: CupertinoStoreApp(),
      ),
    );
  }
}
