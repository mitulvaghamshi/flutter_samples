import 'package:flutter/material.dart';

@immutable
class FlutterAirSideBarItemStyles {
  const FlutterAirSideBarItemStyles({
    required this.iconSize,
    required this.labelSize,
    required this.minHeight,
  });

  final double iconSize;
  final double labelSize;
  final double minHeight;
}
