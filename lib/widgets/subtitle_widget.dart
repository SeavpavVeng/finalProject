import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  final String subTitleText;
  SubTitle({
    required this.subTitleText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 4),
      child: Text(
        subTitleText,
        textAlign: TextAlign.center,
        style: TextStyle(
           fontSize: 18.0,
           color: Colors.blueAccent,
        ),
      ),
    );
  }
}
