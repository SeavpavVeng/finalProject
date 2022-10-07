import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_shopping_app/models/product_model.dart';
import 'package:sports_shopping_app/screens/detail_screen.dart';

import '../controllers/product_controller.dart';
import '../models/category_model.dart';

class SingleProductWidget extends StatefulWidget {
  ProductModel? productModel;
  SingleProductWidget(this.productModel);

  @override
  State<SingleProductWidget> createState() => _SingleProductWidgetState();
}

class _SingleProductWidgetState extends State<SingleProductWidget> {
  // final String name;
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductController>(context)
        .getProduct(widget.productModel!.categoryId!.toInt());
    final products = Provider.of<ProductController>(context)
        .productList(widget.productModel!.categoryId!.toInt());

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(widget.productModel)),
        );
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
                        image:
                            NetworkImage(widget.productModel!.image.toString()),
                      )),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    widget.productModel!.name.toString(),
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
                            widget.productModel!.price.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          print(widget.productModel!.id!.toInt());
                          Provider.of<ProductController>(context, listen: false)
                              .addlike(widget.productModel!.id!.toInt());
                        },
                        child: widget.productModel!.isFavorite == false ? Icon(Icons.favorite_border, color: Colors.grey, size: 27,):Icon(Icons.favorite, color: Colors.red, size: 27,),
                        // child: Icon(
                        //   Icons.favorite,
                        //   color: Colors.orange,
                        // ),
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
  }
}
