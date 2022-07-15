import 'package:flutter/material.dart';

import 'widgets/rounded_button.dart';
import 'phone_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor,
                         Theme.of(context).primaryColorLight],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 37,
                  height: 55,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/logo_small.png"),
                        fit: BoxFit.contain)
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 107,
                  height: 23,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/plato.png"),
                        fit: BoxFit.contain)
                  ),
                )
              ],
            ),
          ),

          Positioned(
            bottom: 0,

            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2 / 3,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
              ),

              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 30),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PhonePage()),
                        );
                      },
                      child: RoundedButton(
                        width: 274.0,
                        height: 49.0,
                        text: "Sign up",
                        color: Theme.of(context).primaryColorLight,
                        textColor: Colors.white
                      ),
                    ),

                    const SizedBox(height: 10.0),

                    Text("Already have an account?",
                        style: Theme.of(context).textTheme.labelMedium),

                    const SizedBox(height: 10.0),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PhonePage()),
                        );
                      },
                      child: RoundedButton(
                        width: 274.0,
                        height: 49.0,
                        text: "Login",
                        color: Colors.white,
                        textColor: Theme.of(context).primaryColorLight,
                        border: Border.all(color: Theme.of(context).primaryColorLight, width: 3)
                      ),
                    ),

                    Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 317.0,
                            height: 28.0,
                            child: Text(
                              "Lorem ipsum dolor sit amet, consecte. "
                                  "Lorem ipsum dolor sit amet, consecte adipiscing.",
                              style: Theme.of(context).textTheme.labelSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
