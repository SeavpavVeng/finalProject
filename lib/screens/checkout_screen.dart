import 'package:flutter/material.dart';
import 'package:sports_shopping_app/widgets/build_amount_detail.dart';
import 'package:sports_shopping_app/widgets/build_button_buy.dart';
import 'package:sports_shopping_app/widgets/build_checkout.dart';
import 'package:sports_shopping_app/widgets/build_single_cart.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CheckOut Item"),
      ),
      body:Column(
        children: [
          Container(
            height: 380,
            child: ListView(  
              children: [    
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      BuildCheckOut(),
                      BuildCheckOut(),
                      BuildCheckOut(),
                      BuildCheckOut(),
                    ],
                  ),
                ),
              ]),
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
                    BuildAmountDetail(startName: "Total", endName: "\$ 245.0"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: BuildButtonBuy(name: 'Place Order',),
          ),
      ]),
   );
  }
}
