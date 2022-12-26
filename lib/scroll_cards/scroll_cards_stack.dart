import 'dart:math';

import 'package:flutter/material.dart';

class ScrollCardStack extends StatelessWidget {
  ScrollCardStack({super.key, required this.count});

  final int count;

  final padding = 16;
  final verticalInsets = 16;
  final cardAspectRatio = 12.0 / 16.0;
  late final widgetAspectRatio = cardAspectRatio * 1.2;
  late final currentPage = ValueNotifier<double>(count - 1);
  late final PageController controller = PageController(initialPage: count - 1)
    ..addListener(() => currentPage.value = controller.page!);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ValueListenableBuilder(
        valueListenable: currentPage,
        builder: (_, value, __) {
          return AspectRatio(
            aspectRatio: widgetAspectRatio,
            child: LayoutBuilder(
              builder: (_, constraints) {
                final height = constraints.maxHeight;
                final width = constraints.maxWidth;
                final safeHeight = height - 2 * padding;
                final safeWidth = width - 2 * padding;
                final heightOfCard = safeHeight;
                final widthOfCard = heightOfCard * cardAspectRatio;
                final cardLeft = safeWidth - widthOfCard;
                final horizontalInsets = cardLeft / 2;
                final cardList = <Widget>[];
                for (var i = 1; i < count; i++) {
                  final delta = i - value;
                  final start = max(
                      cardLeft -
                          horizontalInsets * -delta * (delta > 0 ? 20 : 1),
                      0.0);
                  final cardItem = Positioned.directional(
                    textDirection: TextDirection.rtl,
                    start: padding + start,
                    top: padding + verticalInsets * max(-delta, 0.0),
                    bottom: padding + verticalInsets * max(-delta, 0.0),
                    child: AspectRatio(
                      aspectRatio: cardAspectRatio,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          '${i.toInt()}-0.jpg',
                          package: 'shrine_images',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                  cardList.add(cardItem);
                }
                return Stack(children: cardList);
              },
            ),
          );
        },
      ),
      Positioned.fill(
        child: PageView.builder(
          reverse: true,
          itemCount: count,
          controller: controller,
          itemBuilder: (_, __) => const SizedBox(),
        ),
      ),
    ]);
  }
}
