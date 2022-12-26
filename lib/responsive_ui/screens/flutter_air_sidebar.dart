import 'package:flutter/material.dart';
import 'package:flutter_samples/responsive_ui/models/flutter_air_sidebar_item_style.dart';
import 'package:flutter_samples/responsive_ui/utils/device_type.dart';
import 'package:flutter_samples/responsive_ui/utils/utils.dart';

@immutable
class FlutterAirSideBar extends StatelessWidget {
  const FlutterAirSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = Utils.getDeviceType(context);

    FlutterAirSideBarItemStyles sideBarItemStyles =
        Utils.sideBarItemStyles[deviceType] as FlutterAirSideBarItemStyles;

    return Visibility(
      visible: MediaQuery.of(context).size.width > Utils.mobileMaxWidth,
      child: Material(
        color: Utils.secondaryThemeColor,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            const SizedBox(height: 20),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  controller: ScrollController(),
                  child: Container(
                    height: constraints.maxHeight,
                    constraints: BoxConstraints(
                      minHeight:
                          constraints.minHeight < sideBarItemStyles.minHeight
                              ? sideBarItemStyles.minHeight
                              : constraints.minHeight,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          List.generate(Utils.sideBarItems.length, (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              color: Utils.secondaryThemeColor,
                              splashColor:
                                  Utils.mainThemeColor.withOpacity(0.2),
                              highlightColor:
                                  Utils.mainThemeColor.withOpacity(0.2),
                              onPressed: () {},
                              icon: Icon(
                                Utils.sideBarItems[index].icon,
                                color: Colors.white,
                                size: sideBarItemStyles.iconSize,
                              ),
                            ),
                            Visibility(
                              visible: MediaQuery.of(context).size.width >
                                  Utils.tabletMaxWidth,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 10,
                                  right: 20,
                                  bottom: 10,
                                ),
                                child: Text(
                                  Utils.sideBarItems[index].label,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: sideBarItemStyles.labelSize,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                );
              }),
            ),
            const Spacer(),
          ]),
        ),
      ),
    );
  }
}
