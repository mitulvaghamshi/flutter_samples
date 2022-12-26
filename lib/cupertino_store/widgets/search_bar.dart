import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/cupertino_store/utils/styles.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Styles.searchBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Row(children: <Widget>[
          const Icon(CupertinoIcons.search, color: Styles.searchIconColor),
          Expanded(
            child: CupertinoTextField(
              decoration: null,
              focusNode: focusNode,
              controller: controller,
              style: Styles.searchText,
              cursorColor: Styles.searchCursorColor,
            ),
          ),
          GestureDetector(
            onTap: controller.clear,
            child: const Icon(
              CupertinoIcons.clear_thick_circled,
              color: Styles.searchIconColor,
            ),
          ),
        ]),
      ),
    );
  }
}
