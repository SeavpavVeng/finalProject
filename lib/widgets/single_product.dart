import 'package:flutter/material.dart';
import 'package:sports_shopping_app/models/single_product.dart';

class SingleProductWidget extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final VoidCallback onPressed;

  SingleProductWidget(
      {required this.name,
      required this.price,
      required this.image,
      required this.onPressed,
    });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(image),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Text(
                          "\$${price}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.blueAccent),
                        ),
                        Text(
                          name,
                          style: const TextStyle(fontSize: 17),
                        )
                      ]),
                      Container(
                        child: Icon(
                          Icons.favorite,
                          color: Colors.orange,
                        ),
                      )
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
