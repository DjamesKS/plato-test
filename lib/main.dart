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
        primarySwatch: Colors.red,
        primaryColor: const Color(0xffff634f),
        primaryColorLight: const Color(0xffff9d29),

        fontFamily: 'Raleway',

        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(
            color: Colors.white,
            height: 1.7,
            fontSize: 24,
            fontWeight: FontWeight.w700),
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400),
          labelMedium: TextStyle(
            color: Color(0xff939393),
            fontSize: 14,
            fontWeight: FontWeight.w400),
          labelSmall: TextStyle(
            color: Color(0xff9e9e9e),
            fontSize: 12,
            fontWeight: FontWeight.w500),
          headlineMedium: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w700)
        )
      ),

      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
