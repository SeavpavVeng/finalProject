import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_shopping_app/models/product_model.dart';
import 'package:sports_shopping_app/models/category_model.dart';
import 'package:sports_shopping_app/widgets/app_icon.dart';
import 'package:sports_shopping_app/widgets/big_text.dart';
import 'package:sports_shopping_app/widgets/build_button_buy.dart';
import 'package:sports_shopping_app/widgets/build_qty_button.dart';
import 'package:sports_shopping_app/widgets/build_size_button.dart';

import '../controllers/product_controller.dart';

class DetailScreen extends StatefulWidget {

  ProductModel? productModel;
  DetailScreen(this.productModel);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    
    Provider.of<ProductController>(context)
        .getProduct(widget.productModel!.id!.toInt());
    final products = Provider.of<ProductController>(context)
        .productList(widget.productModel!.categoryId!.toInt());

    return Scaffold(
      body: body(products),
    );
  }

  body(List<ProductModel>? products) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 380,
            child: Stack(children: [
              Positioned(
                  top: 90,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Card(
                      color: Color.fromARGB(255, 234, 238, 245),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 280,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(widget.productModel!.image.toString()),
                        )),
                      ),
                    ),
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
                      Container(
                        child: Text(
                          "Product Detail",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                      ),
                      AppIcon(
                          onPressed: () {},
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
            padding: EdgeInsets.only(left: 24, top: 24),
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
                        text: widget.productModel!.name.toString(),
                        size: 28,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          BigText(
                            color: Colors.orange,
                            text: "Brend :",
                            size: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                          BigText(
                            color: Colors.orange,
                            text: widget.productModel!.brandId.toString(),
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
                    text: widget.productModel!.price.toString(),
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
                  // Size ball
                  //  Container(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       BuildSizeButton(
                  //         title: "3",
                  //         isSelected: false,
                  //       ),
                  //       BuildSizeButton(
                  //         title: "4",
                  //         isSelected: true,
                  //       ),
                  //       BuildSizeButton(
                  //         title: "5",
                  //         isSelected: false,
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // *Size Boots*
                  //  Container(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       BuildSizeButton(
                  //         title: "38",
                  //         isSelected: false,
                  //       ),
                  //       BuildSizeButton(
                  //         title: "39",
                  //         isSelected: true,
                  //       ),
                  //       BuildSizeButton(
                  //         title: "40",
                  //         isSelected: false,
                  //       ),
                  //       BuildSizeButton(
                  //         title: "41",
                  //         isSelected: false,
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // Size Socks
                  //  Container(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       BuildSizeButton(
                  //         title: "Small",
                  //         isSelected: false,
                  //       ),
                  //       BuildSizeButton(
                  //         title: "Medium",
                  //         isSelected: true,
                  //       ),
                  //       BuildSizeButton(
                  //         title: "Large",
                  //         isSelected: false,
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                              BuildQTYButton(
                                  icon: Icons.remove,
                                  iconColor: Colors.white,
                                  onPressed: () {}),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: Text(
                                  "01",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              BuildQTYButton(
                                icon: Icons.add,
                                iconColor: Colors.white,
                                onPressed: () {},
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 12),
                    child: ExpansionTile(
                      title: const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      children: [
                        ListTile(
                          title: Text(
                            widget.productModel!.desc.toString(),
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
                      child: BuildButtonBuy(
                        name: "Add to Cart",
                        sizeHeight: 50,
                        sizeWidth: 300,
                        onPressed: () {},
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
