import 'package:flutter/material.dart';

class PageDots extends StatelessWidget {
  final int pagesCount;
  final int activePageIndex;

  const PageDots({super.key, required this.pagesCount, required this.activePageIndex});

  @override
  Widget build(BuildContext context) {
    if (pagesCount <= 0) {
      throw const FormatException("Pages count must be positive!");
    }

    if (activePageIndex < 0 || activePageIndex >= pagesCount) {
      throw FormatException("Value for activePageIndex must be between 0 and ${pagesCount-1}!");
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for(int i = 0; i < pagesCount; i++)
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 10.09,
                height: 10.09,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/${i == activePageIndex ? "active_" : ""}page_dot.png"),
                    fit: BoxFit.contain)
                ),
              ),
          )
        ],
    );
  }
}
