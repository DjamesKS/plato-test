import 'package:flutter/material.dart';

import 'ui/home_page.dart';

void main() {
  runApp(const PlatoApp());
}

class PlatoApp extends StatelessWidget {
  const PlatoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plato',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway'
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
