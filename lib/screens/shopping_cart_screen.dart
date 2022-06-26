import 'package:flutter/material.dart';
import 'package:sports_shopping_app/widgets/build_amount_detail.dart';
import 'package:sports_shopping_app/widgets/build_button_buy.dart';
import 'package:sports_shopping_app/widgets/build_single_cart.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      title: Text("Cart Item"),
      actions: [
       IconButton(onPressed: (){}, icon: Icon(Icons.history)),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
      ],
      ),
      body:Column(
        children: [
          Expanded(
            
            child: Center(
              child: ListView(  
                children: [    
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        BuildSingleCart(),
                        BuildSingleCart(),
                        BuildSingleCart(),
                        BuildSingleCart(),
                      ],
                    ),
                  ),
                ]),
            ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BuildAmountDetail(
                    startName: "Your Price", endName: "\$ 245.0"),
                    BuildAmountDetail(startName: "Discount", endName: "\$ 0.0"),
                    const Divider(
                      color: Colors.black,
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuildAmountDetail(startName: "", endName: "\$ 245.0"),
                        BuildButtonBuy(name: "Check Out", sizeHeight: 40, sizeWidth: 150, onPressed: (){},)
                      ],
                    ),
                ],
              ),
            ),
          ),
        
      ]),
   );
  }
}
