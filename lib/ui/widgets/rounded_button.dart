import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final BoxBorder? border;

  const RoundedButton({super.key, required this.text, required this.width,
    required this.height, required this.color, required this.textColor, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
        border: border
      ),
      child: Text(text,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w700)
      ),
    );
  }
}
