import 'package:flutter/material.dart';
import 'package:sports_shopping_app/widgets/app_icon.dart';
import 'package:sports_shopping_app/widgets/big_text.dart';

class ProfileWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText; 
  ProfileWidget({required this.appIcon, required this.bigText});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: 20,),
          bigText
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:[
          BoxShadow(
            blurRadius: 2,
          offset: Offset(0,5),
          color: Colors.grey.withOpacity(0.2),
        )
        ] 
      ),
    );
  }
}
