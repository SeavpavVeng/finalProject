import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_shopping_app/colors/colors.dart';
import 'package:sports_shopping_app/data/data.dart';
import 'package:sports_shopping_app/screens/favorite_screen.dart';
import 'package:sports_shopping_app/screens/list_product.dart';
import 'package:sports_shopping_app/screens/shopping_cart_screen.dart';
import 'package:sports_shopping_app/widgets/category.dart';
import 'package:sports_shopping_app/widgets/recommendation_product.dart';
import 'package:sports_shopping_app/widgets/silder.dart';

import '../controllers/product_controller.dart';
import '../route/routepage.dart';
import '../widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
 
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    //Get.find<ProductController>().getProductList();
    return Scaffold(
    
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 45,) ,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      width: 145,
                      decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                      // color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("asset/images/logo_2.png"),
                        fit: BoxFit.cover,
                      ))
                    ),
                    // Container(
                    //   child: Text("User", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.grey),),
                    // ),
                    Center(
                      child: Container(
                        width: 45,
                        height: 45,
                        child: Icon(Icons.filter_list, color: Colors.white,),
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(15),
                        //   gradient: const LinearGradient(
                        //       colors: [Color(0xff03a9f4), Color(0xff004ba0)],
                        //       begin: Alignment.centerRight,
                        //       end: Alignment(-1.0, -1.0),
                    
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: const SliderContainer(),
            ),
            Container(
              child: Center(child:  Category()),
            ),
       
            
            Container(
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, top: 8.0, ),
                child: Text("Latest Product", style: TextStyle(fontSize: 18, color: Colors.blueAccent),),
              ),
            ),
            Container(
              child: RecommendationProduct(),
            )
          ],
        ),
      ),
      
      
      
    //  _pageOption[selectedpage],
      
    );
  }
}