import 'package:flutter/material.dart';

class BuildButtonBuy extends StatelessWidget {
  final String name;
  final double sizeWidth;
  final double sizeHeight;
  VoidCallback onPressed;
  BuildButtonBuy(
      {required this.name, required this.sizeWidth, required this.sizeHeight, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Center(
        child: Container(
          height: sizeHeight,
          width: sizeWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              colors: [Color(0xff03a9f4), Color(0xff004ba0)],
              begin: Alignment.centerRight,
              end: Alignment(-1.0, -1.0),
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
