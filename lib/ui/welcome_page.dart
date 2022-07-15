import 'package:flutter/material.dart';

import 'middle_page.dart';
import 'widgets/rounded_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor,
                     Theme.of(context).primaryColorLight],
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
              Text(
                "Welcome to Plato!",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 285,
                child: Text(
                  "Your registration has been successful, it's time to start using Plato",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
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
                child: RoundedButton(
                  width: 188.0,
                  height: 54.0,
                  text: "Start",
                  color: Theme.of(context).primaryColor,
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
