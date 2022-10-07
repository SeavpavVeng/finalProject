import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_shopping_app/controllers/product_controller.dart';
import 'package:sports_shopping_app/models/product_model.dart';
import 'package:sports_shopping_app/screens/favorite_screen.dart';
import 'package:sports_shopping_app/screens/home_screen.dart';
import 'package:sports_shopping_app/screens/profile_screen.dart';
import 'package:sports_shopping_app/screens/shopping_cart_screen.dart';

class MainScreen extends StatefulWidget {


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List _pageOption = [
    HomeScreen(),
    FavoiteScreen(),
    ShoppingCartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    //  Get.find<ProductController>().getProductList();
    return Scaffold(
      body: _pageOption[selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        top: -20,
        height: 40,
        items: const [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.favorite, title: "Favorite"),
          TabItem(icon: Icons.shopping_cart, title: "Shopping Cart"),
          TabItem(icon: Icons.person, title: "Profile"),
        ],
        initialActiveIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
      ),
    );
  }
}
