import 'package:flutter/material.dart';
import 'package:flutter_samples/responsive_ui/utils/device_type.dart';
import 'package:flutter_samples/responsive_ui/utils/utils.dart';

enum DeviceSize {
  // Mobile
  mobileSmall(320, DeviceType.mobile),
  mobileMedium(375, DeviceType.mobile),
  mobileLarge(425, DeviceType.mobile),
  mobileXLarge(600, DeviceType.mobile),
  // Tablet
  tabletSmall(720, DeviceType.tablet),
  tabletMedium(768, DeviceType.tablet),
  tabletLarge(840, DeviceType.tablet),
  tabletXLarge(960, DeviceType.tablet),
  // Desktop
  desktopSmall(1024, DeviceType.laptop),
  desktopMedium(1280, DeviceType.laptop),
  desktopLarge(1440, DeviceType.laptop),
  desktopXLarge(1600, DeviceType.laptop),
  desktopXXLarge(1920, DeviceType.laptop),
  desktopXXXLarge(2560, DeviceType.laptop),
  desktopUltraWide(6000, DeviceType.laptop);

  const DeviceSize(this.width, this.type);

  final int width;
  final DeviceType type;

  static DeviceSize getDeviceSize(context) {
    final width = MediaQuery.of(context).size.width;
    final type = Utils.getDeviceType(context);
    return values.firstWhere((e) => e.type == type && e.width <= width);
  }

  @override
  String toString() => '$name (${width}px)';
}
