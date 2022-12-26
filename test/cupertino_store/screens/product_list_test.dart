import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/cupertino_store/models/app_state.dart';
import 'package:flutter_samples/cupertino_store/tabs/product_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget _createProductListScreen() {
  return ChangeNotifierProvider<AppState>(
    create: (_) => AppState()..loadProducts(),
    child: const CupertinoApp(home: ProductList()),
  );
}

void main() {
  group('ProductList widget test', () {
    testWidgets('Test is CustomScrollView shows up', (tester) async {
      await tester.pumpWidget(_createProductListScreen());
      expect(find.byType(CustomScrollView), findsOneWidget);
    });
  });
}
