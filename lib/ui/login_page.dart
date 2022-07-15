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
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xffff634f), Color(0xffff9d29)],
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
                      child: const RoundedButton(
                        width: 274.0,
                        height: 49.0,
                        text: "Sign up",
                        color: Color(0xffff9d29),
                        textColor: Colors.white
                      ),
                    ),

                    const SizedBox(height: 10.0),

                    const Text("Already have an account?",
                      style: TextStyle(
                        color: Color(0xff939393),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    ),

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
                        textColor: const Color(0xffff9d29),
                        border: Border.all(color: const Color(0xffff9d29), width: 3)
                      ),
                    ),

                    const Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 317.0,
                            height: 28.0,
                            child: Text(
                              "Lorem ipsum dolor sit amet, consecte. "
                                  "Lorem ipsum dolor sit amet, consecte adipiscing.",
                              style: TextStyle(
                                color: Color(0xff939393),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
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
