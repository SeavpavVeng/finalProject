import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sports_shopping_app/colors/colors.dart';
import 'package:sports_shopping_app/data/data.dart';
import 'package:sports_shopping_app/screens/favorite_screen.dart';
import 'package:sports_shopping_app/screens/shopping_cart_screen.dart';
import 'package:sports_shopping_app/widgets/category.dart';
import 'package:sports_shopping_app/widgets/recommendation_product.dart';
import 'package:sports_shopping_app/widgets/silder.dart';

class HomeScreen extends StatefulWidget {
 
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
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
                    Center(
                      child: Container(
                        width: 45,
                        height: 45,
                        child: Icon(Icons.search, color: Colors.white,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                              colors: [Color(0xff03a9f4), Color(0xff004ba0)],
                              begin: Alignment.centerRight,
                              end: Alignment(-1.0, -1.0),
                          
                          ),
                        ),
                      ),
                    ),          
                  ],
                ),
              ),
            ),
            Container(
              child: SliderContainer(),
            ),
            Container(
              child: Category(
                 
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0, ),
                child: Text("Recommended for you", style: TextStyle(fontSize: 18, color: Colors.blueAccent),),
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