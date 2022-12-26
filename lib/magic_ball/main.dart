import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_samples/magic_ball/data/data.dart';
import 'package:flutter_samples/magic_ball/widgets/bottom_shadow.dart';
import 'package:flutter_samples/magic_ball/widgets/inner_circle.dart';
import 'package:flutter_samples/magic_ball/widgets/inner_triangle.dart';
import 'package:flutter_samples/magic_ball/widgets/the_sphere.dart';

void main() => runApp(const MyApp());

@immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic 8 Ball',
      home: const MagicBallApp(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class MagicBallApp extends StatefulWidget {
  const MagicBallApp({super.key});

  static const route = '/magicBall';

  @override
  MagicBallAppState createState() => MagicBallAppState();
}

class MagicBallAppState extends State<MagicBallApp>
    with SingleTickerProviderStateMixin {
  static const restPosition = Offset(0, -0.15);
  static const lightSource = Offset(0, -0.75);

  late AnimationController controller;
  late Animation<double> animation;

  String prediction = 'The\nMAGIC\nBall';
  Offset tapPosition = Offset.zero;
  double wobble = 0;

  void _setState(VoidCallback action) => setState(action);

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 1500),
    );

    controller.addListener(() => setState(() {}));

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
      reverseCurve: Curves.elasticIn,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final position = Offset.lerp(restPosition, tapPosition, animation.value)!;
    final size = Size.square(MediaQuery.of(context).size.shortestSide);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              BottomShadow(diameter: size.shortestSide),
              GestureDetector(
                onPanStart: (details) => _start(details.localPosition, size),
                onPanEnd: (_) => _end(),
                onPanUpdate: (details) => _update(details.localPosition, size),
                child: TheSphere(
                  lightSource: lightSource,
                  diameter: size.shortestSide,
                  child: Transform(
                    origin: size.center(Offset.zero),
                    transform: Matrix4.identity()
                      ..translate(
                        position.dx * size.width / 2,
                        position.dy * size.height / 2,
                      )
                      ..rotateZ(position.direction)
                      ..rotateY(position.distance * math.pi / 2)
                      ..rotateZ(-position.direction)
                      ..scale(0.5 - 0.15 * position.distance),
                    child: InnerCircle(
                      lightSource: lightSource - position,
                      child: Opacity(
                        opacity: 1 - controller.value,
                        child: Transform.rotate(
                          angle: wobble,
                          child: InnerTriangle(text: prediction),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on MagicBallAppState {
  void _start(Offset position, Size size) {
    controller.forward(from: 0);
    _update(position, size);
  }

  void _end() {
    final rand = math.Random();
    wobble = rand.nextDouble() * (wobble.isNegative ? 0.5 : -0.5);
    prediction = predictions[rand.nextInt(predictions.length)];
    controller.reverse(from: 1);
  }

  void _update(Offset position, Size size) {
    var tapPosition = Offset(
      (2 * position.dx / size.width) - 1,
      (2 * position.dy / size.height) - 1,
    );
    if (tapPosition.distance > 0.8) {
      tapPosition = Offset.fromDirection(tapPosition.direction, 0.8);
    }
    _setState(() => this.tapPosition = tapPosition);
  }
}
