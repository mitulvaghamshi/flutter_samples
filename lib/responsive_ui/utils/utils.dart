import 'package:flutter/material.dart';
import 'package:flutter_samples/responsive_ui/models/flutter_air_appbar_styles.dart';
import 'package:flutter_samples/responsive_ui/models/flutter_air_flight_info_styles.dart';
import 'package:flutter_samples/responsive_ui/models/flutter_air_menu_side_styles.dart';
import 'package:flutter_samples/responsive_ui/models/flutter_air_sidebar_item.dart';
import 'package:flutter_samples/responsive_ui/models/flutter_air_sidebar_item_style.dart';
import 'package:flutter_samples/responsive_ui/utils/device_type.dart';

@immutable
class Utils {
  static const int mobileMaxWidth = 480;
  static const int tabletMaxWidth = 768;
  static const int laptopMaxWidth = 1024;

  static const int twoColumnLayoutWidth = 600;

  static const Color mainThemeColor = Color(0xFF5C1896);
  static const Color secondaryThemeColor = Color(0xFFA677FF);
  static const Color darkThemeColor = Color(0xFF44146E);
  static const Color normalLabelColor = Color(0xFF6C6C6C);
  static const Color lightPurpleColor = Color(0xFFC5ABF6);

  static Map<DeviceType, FlutterAirAppBarStyles> appBarStyles = {
    DeviceType.mobile: const FlutterAirAppBarStyles(
      leadingIconBackgroundColor: Colors.transparent,
      leadingIconForegroundColor: Utils.mainThemeColor,
      backgroundColor: Colors.transparent,
      titleColor: Utils.mainThemeColor,
      titleIconColor: Colors.white,
    ),
    DeviceType.tablet: const FlutterAirAppBarStyles(
      leadingIconBackgroundColor: Utils.darkThemeColor,
      leadingIconForegroundColor: Colors.white,
      backgroundColor: Utils.mainThemeColor,
      titleColor: Colors.white,
      titleIconColor: Utils.mainThemeColor,
    ),
    DeviceType.laptop: const FlutterAirAppBarStyles(
      leadingIconBackgroundColor: Utils.darkThemeColor,
      leadingIconForegroundColor: Colors.white,
      backgroundColor: Utils.mainThemeColor,
      titleColor: Colors.white,
      titleIconColor: Utils.mainThemeColor,
    )
  };

  static Map<DeviceType, FlutterAirFlightInfoStyles> flightInfoStyles = {
    DeviceType.mobile: const FlutterAirFlightInfoStyles(
      labelSize: 15,
      primaryValueSize: 60,
      secondaryValueSize: 40,
      tertiaryValueSize: 30,
      flightIconSize: 50,
      seatBadgePaddingSize: 15,
      seatBadgeIconSize: 25,
      seatBadgeLabelSize: 25,
      flightLineSize: 3,
      flightLineEndRadiusSize: 10,
      secondaryIconSize: 30,
      minHeight: 500,
    ),
    DeviceType.tablet: const FlutterAirFlightInfoStyles(
      labelSize: 20,
      primaryValueSize: 60,
      secondaryValueSize: 50,
      tertiaryValueSize: 30,
      flightIconSize: 60,
      seatBadgePaddingSize: 20,
      seatBadgeIconSize: 30,
      seatBadgeLabelSize: 30,
      flightLineSize: 4,
      flightLineEndRadiusSize: 15,
      secondaryIconSize: 30,
      minHeight: 500,
    ),
    DeviceType.laptop: const FlutterAirFlightInfoStyles(
      labelSize: 20,
      primaryValueSize: 70,
      secondaryValueSize: 60,
      tertiaryValueSize: 40,
      flightIconSize: 60,
      seatBadgePaddingSize: 30,
      seatBadgeIconSize: 35,
      seatBadgeLabelSize: 35,
      flightLineSize: 4,
      flightLineEndRadiusSize: 15,
      secondaryIconSize: 30,
      minHeight: 500,
    )
  };

  static Map<DeviceType, FlutterAirSideMenuStyles> sideMenuStyles = {
    DeviceType.mobile: const FlutterAirSideMenuStyles(
      backgroundColor: Utils.secondaryThemeColor,
      labelColor: Colors.white,
      iconSize: 20,
      labelSize: 20,
      iconBgColor: Utils.mainThemeColor,
    ),
    DeviceType.tablet: const FlutterAirSideMenuStyles(
      backgroundColor: Colors.white,
      labelColor: Utils.darkThemeColor,
      iconSize: 30,
      labelSize: 20,
      iconBgColor: Utils.secondaryThemeColor,
    ),
    DeviceType.laptop: const FlutterAirSideMenuStyles(
      backgroundColor: Colors.white,
      labelColor: Utils.darkThemeColor,
      iconSize: 30,
      labelSize: 20,
      iconBgColor: Utils.secondaryThemeColor,
    )
  };

  static List<FlutterAirSideBarItem> sideBarItems = [
    const FlutterAirSideBarItem(icon: Icons.home, label: 'Home'),
    const FlutterAirSideBarItem(icon: Icons.face, label: 'Passengers'),
    const FlutterAirSideBarItem(
        icon: Icons.airplane_ticket, label: 'Flight Info'),
    const FlutterAirSideBarItem(
        icon: Icons.airline_seat_recline_normal, label: 'Reserve Seat')
  ];

  static List<FlutterAirSideBarItem> sideMenuItems = [
    const FlutterAirSideBarItem(icon: Icons.settings, label: 'Settings'),
    const FlutterAirSideBarItem(icon: Icons.qr_code, label: 'Boarding Pass')
  ];

  static Map<DeviceType, FlutterAirSideBarItemStyles> sideBarItemStyles = {
    DeviceType.mobile: const FlutterAirSideBarItemStyles(
        iconSize: 30, labelSize: 15, minHeight: 200),
    DeviceType.tablet: const FlutterAirSideBarItemStyles(
        iconSize: 30, labelSize: 15, minHeight: 200),
    DeviceType.laptop: const FlutterAirSideBarItemStyles(
        iconSize: 25, labelSize: 15, minHeight: 200)
  };

  static DeviceType getDeviceType(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    DeviceType type = DeviceType.mobile;
    if (data.size.width > Utils.mobileMaxWidth &&
        data.size.width <= Utils.tabletMaxWidth) {
      type = DeviceType.tablet;
    } else if (data.size.width > Utils.tabletMaxWidth) {
      type = DeviceType.laptop;
    }
    return type;
  }
}
