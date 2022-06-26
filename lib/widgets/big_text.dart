import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText(
      {required this.color,
      required this.text,
      required this.size ,
      required this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(text, overflow: overflow, style: TextStyle(color: color, fontWeight: FontWeight.w400, fontSize: size),);
  }
}
