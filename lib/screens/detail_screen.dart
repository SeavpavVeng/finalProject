import 'package:flutter/material.dart';
import 'package:sports_shopping_app/models/category_product.dart';
import 'package:sports_shopping_app/models/single_product.dart';
import 'package:sports_shopping_app/widgets/app_icon.dart';
import 'package:sports_shopping_app/widgets/big_text.dart';
import 'package:sports_shopping_app/widgets/build_button_buy.dart';
import 'package:sports_shopping_app/widgets/build_qty_button.dart';
import 'package:sports_shopping_app/widgets/build_size_button.dart';
import 'package:sports_shopping_app/widgets/single_product.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({required this.detailData,required this.name, required this.image, required this.price});
   List<SingleProduct> detailData;
   final String name;
   final String price;
   final String image;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              child: Stack(children: [

                Positioned(
                  top: 45,
                  left: 0,
                  right: 0,
                  child: Container(
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage(widget.image),
                  )),
                )),
                
                Positioned(
                    top: 45,
                    left: 30,
                    right: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppIcon(
                          onPressed: () => Navigator.pop(context),
                            icon: Icons.arrow_back_ios,
                            backgroundColor: Colors.blueAccent,
                            iconColor: Colors.white,
                            sizeIcon: 20,
                            size: 40),
                        AppIcon(
                          onPressed: (){},
                            icon: Icons.shopping_cart_outlined,
                            backgroundColor: Colors.blueAccent,
                            iconColor: Colors.white,
                            sizeIcon: 20,
                            size: 40)
                      ],
                    )),
                  ]),
               ),
                Container(
                  padding: EdgeInsets.only(left: 24),
                
                    child: Row(   
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: BigText(
                                color: Colors.blueAccent,
                                text: widget.name,
                                size: 30,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  BigText(
                                    color: Colors.orange,
                                    text: "Brend :" ,
                                    size: 18,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  BigText(
                                    color: Colors.orange,
                                    text:  "Nike",
                                    size: 18,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 40),
                          child: BigText(
                            color: Colors.orange,
                            text: "\$${widget.price}",
                            size: 30,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 12, left: 8),
                        child: BigText(
                          color: Colors.blueAccent,
                          text: "Size",
                          size: 24,
                          overflow: TextOverflow.ellipsis,
                        ),
                     ),
                     Container(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                            BuildSizeButton(
                              title: "S",
                              isSelected: false,
                            ),
                            BuildSizeButton(
                              title: "M",
                              isSelected: true,
                            ),
                            BuildSizeButton(
                              title: "L",
                              isSelected: false,
                            ),
                            BuildSizeButton(
                              title: "XL",
                              isSelected: false,
                            ),
                                  
                         ],
                       ),
                     ),
                     Container(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          Container(
                            padding: EdgeInsets.only(top: 12, left: 8),
                            child: BigText(
                              color: Colors.blueAccent,
                              text: "Quantity",
                              size: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 4, left: 8),
                            child: Row(
                              children: [
                                BuildQTYButton(icon: Icons.remove, iconColor: Colors.white, onPressed: (){}),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical:4 ),
                                  child: Text("01", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, ),),
                                ),
                                BuildQTYButton(icon: Icons.add, iconColor: Colors.white, onPressed: (){},)
                              ],
                            ),
                          )
                        ],
                       ),
                     ),
                     Container(
                       padding: EdgeInsets.only(top: 12),
                       child:ExpansionTile(
                              title: Text("Description", style: TextStyle(fontSize: 24, color: Colors.blueAccent, fontWeight: FontWeight.bold ),),
                              children: [
                                ListTile(
                                  title: Text("hehvfhvfglkrrrrrggggggggggggggggggggggggggggggglksdihgfjitgfkhbjjkhjbfcewfihbgjtprhgvergbnl.verfiijgp;vtjhgtrphbfsijegrihpjrt",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),   
                          
                     ),
                            
                     Container(
                       padding: EdgeInsets.only(top: 30, bottom: 16),
                        child: BuildButtonBuy(name: "Add to Cart")
                     ),
                    ],
                  )
                ),
                
              
            
          ],
        ),
      ),
    );
  }
}
