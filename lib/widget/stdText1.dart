import 'package:flutter/material.dart';

class stdText1 extends StatelessWidget {
  final String strText;
  final double intFontSize;
  stdText1(this.strText,
      this.intFontSize);

  @override
  Widget build(BuildContext context) {
    return Text(
        strText,
        style: TextStyle(
        color: Colors.white,
        fontSize: intFontSize,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
    ),
    );
  }
}
