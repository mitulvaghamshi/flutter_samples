import 'package:flutter/material.dart';
import 'package:flutter_samples/sphere/planet.dart';
import 'package:flutter_samples/sphere/sphere.dart';

void main() => runApp(const MyApp());

@immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      title: 'Flutter Sphere',
      home: SphereViewApp(),
    );
  }
}

@immutable
class SphereViewApp extends StatefulWidget {
  const SphereViewApp({super.key});

  @override
  SphereViewAppState createState() => SphereViewAppState();
}

class SphereViewAppState extends State<SphereViewApp> {
  late Planet surface = Planet.values.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Planet.stars.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: <Widget>[
          Expanded(
            child: Sphere(
              latitude: 15,
              longitude: 0,
              surface: surface,
              key: ValueKey(surface),
              alignment: Alignment.center,
              radius: MediaQuery.of(context).size.width / 2.0 - 10.0,
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemExtent: 210,
              itemCount: Planet.values.length - 1, // Excluding Stars
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final planet = Planet.values[index];
                return Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(planet.thumb),
                  ),
                  ElevatedButton(
                    child: Text(planet.name),
                    onPressed: () => setState(() => surface = planet),
                  ),
                ]);
              },
            ),
          )
        ]),
      ),
    );
  }
}
