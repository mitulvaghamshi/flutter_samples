import 'package:flutter/material.dart';
import 'package:flutter_samples/responsive_ui/models/flutter_air_appbar_styles.dart';
import 'package:flutter_samples/responsive_ui/utils/utils.dart';

@immutable
class FlutterAirAppHeaderTitle extends StatelessWidget {
  const FlutterAirAppHeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterAirAppBarStyles appBarStyles = Utils
        .appBarStyles[Utils.getDeviceType(context)] as FlutterAirAppBarStyles;

    return Row(children: [
      Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Utils.secondaryThemeColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          Icons.flight_takeoff,
          color: appBarStyles.titleIconColor,
          size: 20,
        ),
      ),
      const SizedBox(width: 10),
      Text(
        'Welcome',
        style: TextStyle(fontSize: 18, color: appBarStyles.titleColor),
      )
    ]);
  }
}
