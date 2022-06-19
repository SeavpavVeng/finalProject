import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double sizeIcon;
  final VoidCallback onPressed;

  AppIcon(
      {required this.icon,
      required this.backgroundColor,
      required this.iconColor,
      required this.size,
      required this.sizeIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: sizeIcon,
        ),
      ),
    );
  }
}
