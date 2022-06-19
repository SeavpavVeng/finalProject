import 'package:flutter/material.dart';

class BuildAmountDetail extends StatelessWidget {
  final String startName;
  final String endName;

  BuildAmountDetail({required this.startName, required this.endName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          startName,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,

          ),
        ),
        Text(
          endName,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
