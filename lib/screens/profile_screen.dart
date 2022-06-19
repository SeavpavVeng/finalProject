import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sports_shopping_app/widgets/app_icon.dart';
import 'package:sports_shopping_app/widgets/big_text.dart';
import 'package:sports_shopping_app/widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
 
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BigText(
          text: "Profile",
          size: 24, 
          color: Colors.white, 
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body:  Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            AppIcon(icon: Icons.person, sizeIcon: 70, backgroundColor: Colors.blueAccent, iconColor: Colors.white, size: 120, onPressed: (){}),
            SizedBox(height: 20,),
            ProfileWidget(
              appIcon: AppIcon(
                icon: Icons.person, 
                sizeIcon: 30, 
                backgroundColor: Colors.blueAccent, 
                iconColor: Colors.white, 
                onPressed: () {}, 
                size: 40, 
              ),
              bigText: BigText(
                text: "Name", 
                color: Colors.black, 
                overflow:TextOverflow.ellipsis, 
                size: 25,
              ),
            ),
            SizedBox(height: 20,),
            ProfileWidget(
              appIcon: AppIcon(
                icon: Icons.phone, 
                sizeIcon: 30, 
                backgroundColor: Colors.blueAccent, 
                iconColor: Colors.white, 
                onPressed: () {  }, 
                size: 40, 
              ),
              bigText: BigText(
                text: "070123456", 
                color: Colors.black, 
                overflow:TextOverflow.ellipsis, 
                size: 25,
              ),
            ),
            SizedBox(height: 20,),
            ProfileWidget(
              appIcon: AppIcon(
                icon: Icons.location_on, 
                sizeIcon: 30, 
                backgroundColor: Colors.blueAccent, 
                iconColor: Colors.white, 
                onPressed: () {  }, 
                size: 40, 
              ),
              bigText: BigText(
                text: "Phnom Penh", 
                color: Colors.black, 
                overflow:TextOverflow.ellipsis, 
                size: 25,
              ),
            ),
            SizedBox(height: 20,),
            ProfileWidget(
              appIcon: AppIcon(
                icon: Icons.logout, 
                sizeIcon: 30, 
                backgroundColor: Colors.blueAccent, 
                iconColor: Colors.white, 
                onPressed: () {  }, 
                size: 40, 
              ),
              bigText: BigText(
                text: "Sign out", 
                color: Colors.black, 
                overflow:TextOverflow.ellipsis, 
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
