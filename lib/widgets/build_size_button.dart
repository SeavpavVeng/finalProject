import 'package:flutter/material.dart';

class BuildSizeButton extends StatelessWidget {
  final String title;
  final bool isSelected;
 

  BuildSizeButton(
      {required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){},
      height: 40,
      minWidth: 40,
      elevation: 0,
      color: isSelected ? Colors.blueAccent : Color(0xffe8e8e8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xff727274),
          ),
        ),
      ),
    );
  }
}
