import 'package:flutter/material.dart';

@immutable
class FlutterAirSideMenuStyles {
  const FlutterAirSideMenuStyles({
    required this.backgroundColor,
    required this.labelColor,
    required this.iconSize,
    required this.labelSize,
    required this.iconBgColor,
  });

  final Color backgroundColor;
  final Color labelColor;
  final Color iconBgColor;
  final double iconSize;
  final double labelSize;
}
