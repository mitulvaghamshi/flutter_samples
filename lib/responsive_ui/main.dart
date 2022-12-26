import 'package:flutter/material.dart';
import 'package:flutter_samples/responsive_ui/models/flutter_air_flight_info_styles.dart';
import 'package:flutter_samples/responsive_ui/screens/flutter_air_appbar.dart';
import 'package:flutter_samples/responsive_ui/screens/flutter_air_flight_info.dart';
import 'package:flutter_samples/responsive_ui/screens/flutter_air_side_menu.dart';
import 'package:flutter_samples/responsive_ui/screens/flutter_air_sidebar.dart';
import 'package:flutter_samples/responsive_ui/utils/utils.dart';

void main() => runApp(const MyApp());

@immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Air',
      home: const FlutterAirApp(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

@immutable
class FlutterAirApp extends StatelessWidget {
  const FlutterAirApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterAirFlightInfoStyles flightInfoStyles =
        Utils.flightInfoStyles[Utils.getDeviceType(context)]
            as FlutterAirFlightInfoStyles;

    return Scaffold(
      appBar: const FlutterAirAppBar(),
      drawer: const Drawer(child: FlutterAirSideMenu()),
      body: Row(children: [
        const FlutterAirSideBar(),
        Expanded(
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              controller: ScrollController(),
              child: Container(
                height: constraints.maxHeight,
                constraints: BoxConstraints(
                  minHeight: constraints.minHeight < flightInfoStyles.minHeight
                      ? flightInfoStyles.minHeight
                      : constraints.minHeight,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(50),
                  child: FlutterAirFlightInfo(),
                ),
              ),
            );
          }),
        ),
      ]),
    );
  }
}
