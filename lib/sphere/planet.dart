enum Planet {
  sun(name: 'Sun'),
  mercury(name: 'Mercury'),
  venus(name: 'Venus'),
  earth(name: 'Earth'),
  moon(name: 'Moon'),
  mars(name: 'Mars'),
  jupiter(name: 'Jupiter'),
  saturn(name: 'Saturn'),
  uranus(name: 'Uranus'),
  neptune(name: 'Neptune'),
  custom(name: 'Custom'),
  stars(name: 'Stars');

  const Planet({required this.name});

  final String name;

  String get image => 'assets/images/${name.toLowerCase()}.webp';
  String get thumb => 'assets/images/thumb/${name.toLowerCase()}.webp';
}
