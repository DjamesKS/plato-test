import 'dart:async';

import 'package:flutter/material.dart';

import 'welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomePage())
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.cover)
      ),
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/logo_full.png"), fit: BoxFit.contain)
          ),
        ),
      ),
    );
  }
}
