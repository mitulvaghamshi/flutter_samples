import 'package:flutter/material.dart';

@immutable
class FlutterAirFlightInfoStyles {
  const FlutterAirFlightInfoStyles({
    required this.labelSize,
    required this.primaryValueSize,
    required this.secondaryValueSize,
    required this.tertiaryValueSize,
    required this.flightIconSize,
    required this.seatBadgeIconSize,
    required this.seatBadgePaddingSize,
    required this.seatBadgeLabelSize,
    required this.flightLineSize,
    required this.flightLineEndRadiusSize,
    required this.secondaryIconSize,
    required this.minHeight,
  });

  final double labelSize;
  final double primaryValueSize;
  final double secondaryValueSize;
  final double tertiaryValueSize;
  final double flightIconSize;
  final double seatBadgePaddingSize;
  final double seatBadgeIconSize;
  final double seatBadgeLabelSize;
  final double flightLineSize;
  final double flightLineEndRadiusSize;
  final double secondaryIconSize;
  final double minHeight;
}
