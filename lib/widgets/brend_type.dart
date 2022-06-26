import 'package:flutter/material.dart';
import 'package:sports_shopping_app/data/data.dart';
import 'package:sports_shopping_app/models/single_product.dart';
import 'package:sports_shopping_app/route/routepage.dart';
import 'package:sports_shopping_app/route/routepage.dart';
import 'package:sports_shopping_app/screens/detail_screen.dart';
import 'package:sports_shopping_app/widgets/single_product.dart';

class BrendType extends StatelessWidget {
  // final List<SingleProduct> products;

  BrendType({required this.productData});
  List<SingleProduct> productData;
  // final String name;
  // final String price;
  // final String image;
  // BrendType({required this.productData, required this.name, required this.image, required this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: GridView.builder(
        itemCount: productData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          childAspectRatio: 0.9,
          crossAxisCount: 2,
        ),
        itemBuilder: (
          BuildContext context,
          index,
        ) {
          final data = productData[index];
          return Text("Hello");
          // SingleProductWidget(
        },
      ),
    );
  }
}
