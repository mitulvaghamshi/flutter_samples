import 'package:flutter/material.dart';
import 'package:flutter_samples/responsive_ui/models/flutter_air_appbar_styles.dart';
import 'package:flutter_samples/responsive_ui/screens/flutter_air_app_header_title.dart';
import 'package:flutter_samples/responsive_ui/utils/utils.dart';

@immutable
class FlutterAirAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlutterAirAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    FlutterAirAppBarStyles appBarStyles = Utils
        .appBarStyles[Utils.getDeviceType(context)] as FlutterAirAppBarStyles;

    return AppBar(
      elevation: 0,
      title: const FlutterAirAppHeaderTitle(),
      backgroundColor: appBarStyles.backgroundColor,
      leading: Builder(builder: (context) {
        return Material(
          color: appBarStyles.leadingIconBackgroundColor,
          child: InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Icon(
                Icons.menu,
                color: appBarStyles.leadingIconForegroundColor,
              ),
            ),
          ),
        );
      }),
    );
  }
}
