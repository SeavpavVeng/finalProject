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
          return SingleChildScrollView(
      child: Container(
        height: 800,
        child: GridView.builder(
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
            crossAxisCount: 2,
          ),
          itemBuilder: (
            BuildContext context,
            index,
          ) {
            return GestureDetector(
      onTap: (){
        // Navigator.push(
        //   context,
        // MaterialPageRoute(builder: (context) => DetailScreen()
        // ),
        //);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    color: const Color.fromARGB(255, 223, 230, 243),
                    child: Container(
                      height: 150,
                      width: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("asset/images/category/T_shirt.png"),
                      )),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "FC Barcelona",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "\$${20}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
          },
        ),
      ),
    );
           
        },
      ),
    );
  }
}
