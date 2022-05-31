import 'package:flutter/material.dart';
import 'package:sports_shopping_app/data/data.dart';
import 'package:sports_shopping_app/widgets/brend_type.dart';

class FavoiteScreen extends StatefulWidget {
  const FavoiteScreen({ Key? key }) : super(key: key);

  @override
  State<FavoiteScreen> createState() => _FavoiteScreenState();
}

class _FavoiteScreenState extends State<FavoiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favorite Item"),
      ),
      body:  Padding(
       padding: EdgeInsets.only(top: 16),
          child: BrendType(
            productData: Tshirt_products,
          ),
    ),
    );
  }
}