import 'package:flutter/material.dart';

import 'middle_page.dart';
import 'widgets/rounded_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xffff634f), Color(0xffff9d29)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 115.81,
                height: 115.81,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/waving_hand.png"),
                        fit: BoxFit.contain)
                ),
              ),
              const SizedBox(height: 35),
              const Text(
                "Welcome to Plato!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 15),
              const SizedBox(
                width: 285,
                child: Text(
                  "Your registration has been successful, it's time to start using Plato",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MiddlePage(pageIndex: 0)),
                  );
                },
                child: const RoundedButton(
                  width: 188.0,
                  height: 54.0,
                  text: "Start",
                  color: Color(0xffff634f),
                  textColor: Colors.white
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
