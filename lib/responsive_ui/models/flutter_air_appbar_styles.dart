import 'package:flutter/material.dart';

@immutable
class FlutterAirAppBarStyles {
  const FlutterAirAppBarStyles({
    required this.leadingIconBackgroundColor,
    required this.leadingIconForegroundColor,
    required this.backgroundColor,
    required this.titleColor,
    required this.titleIconColor,
  });

  final Color leadingIconBackgroundColor;
  final Color leadingIconForegroundColor;
  final Color backgroundColor;
  final Color titleColor;
  final Color titleIconColor;
}
