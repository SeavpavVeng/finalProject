import 'package:flutter/material.dart';

class BuildQTYButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Function onPressed;

  BuildQTYButton({required this.icon, required this.iconColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.blueAccent,
            elevation: 20,
            minimumSize: Size(100, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
        onPressed: () {},
        child: Icon(icon, color: iconColor,),
      ),
    );
  }
}
