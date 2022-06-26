import 'package:flutter/material.dart';
import 'package:sports_shopping_app/models/product_model.dart';
import 'package:sports_shopping_app/screens/list_product.dart';

import '../models/category_model.dart';

class CategoryCard extends StatefulWidget {
  Data data;

  CategoryCard(this.data);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  // CategoryCard(
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListProduct(widget.data)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.blueGrey,
                ),
              ]),
          padding: const EdgeInsets.all(8.0),
          width: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Image.network(widget.data.image.toString()),
                flex: 75,
              ),
              Expanded(
                  flex: 25,
                  child: Text(
                    widget.data.name.toString(),
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
