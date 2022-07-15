import 'package:flutter/material.dart';

import 'login_page.dart';
import 'widgets/page_dots.dart';
import 'widgets/rounded_button.dart';

class MiddlePage extends StatelessWidget {
  static const imageNames = ["table", "restaurant", "dine_token", "new_seats", "wine_glasses"];
  static const messages = ["Buy NFT Table from Plato App",
                           "Go eat at a restaurant with Plato App",
                           "App tracks your dining activities, you earn\nDINE token",
                           "Levelup by adding\nnew Seats",
                           "Invite a friend to eat with you at a restaurant.\nYou earn \$DINE tokens."];

  final int pageIndex;

  const MiddlePage({Key? key, required this.pageIndex}) : super(key: key);

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
          child: Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 10),
            child: Column(
              children: [
                Container(
                  width: 244,
                  height: 210,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/${imageNames[pageIndex]}.png"),
                          fit: BoxFit.contain)
                  ),
                ),

                const SizedBox(height: 50.0),

                PageDots(pagesCount: imageNames.length, activePageIndex: pageIndex),

                const SizedBox(height: 70.0),

                SizedBox(
                  width: 270,
                  child: Text(
                    messages[pageIndex],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium
                  ),
                ),

                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        if (pageIndex < imageNames.length - 1) {
                          int newPageIndex = pageIndex + 1;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MiddlePage(pageIndex: newPageIndex)),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        }
                      },
                      child: RoundedButton(
                        width: 332.0,
                        height: 54.0,
                        text: pageIndex < imageNames.length - 1 ? "Next" : "START",
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
