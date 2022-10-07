import 'package:flutter/material.dart';

class BuildQTYButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  Function onPressed;

  BuildQTYButton(
      {required this.icon, required this.iconColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 30,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            // padding: EdgeInsets.zero,
            backgroundColor: Colors.blueAccent,
            elevation: 20,
            minimumSize: Size(90, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
        onPressed: () {
          onPressed();
        },
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
