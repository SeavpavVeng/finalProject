import 'package:flutter/material.dart';
import 'package:sports_shopping_app/screens/invoice_screen.dart';
import 'package:sports_shopping_app/widgets/build_amount_detail.dart';
import 'package:sports_shopping_app/widgets/build_button_buy.dart';
import 'package:sports_shopping_app/widgets/build_single_cart.dart';

import '../widgets/build_qty_button.dart';

class ShoppingCartScreen extends StatefulWidget {
  // ProductModel? productModel;
  // ShoppingCartScreen(this.productModel);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
 
  @override
  Widget build(BuildContext context) {
    // final cardproduct = Provider.of<CartController>(context)
    //     .productListCart(widget.productModel!.categoryId!.toInt());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Shopping Cart",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.history)),
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: body);
  }

  get body {
    return Column(children: [
      Expanded(
        child: Center(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Card(
                                    color: const Color.fromARGB(
                                        255, 223, 230, 243),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Container(
                                      height: 90,
                                      width: 70,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage("asset/images/real_madrid_home.png"),
                                      )),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width: 250,
                                  child: ListTile(
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, bottom: 16.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: const Text(
                                                  "Real Madrid",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.blueAccent,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 2.0,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Size : ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blueAccent,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Text(
                                                "M",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.blueAccent),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                top: 2.0,
                                              ),
                                              child: Text(
                                                "\$${16.0}",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.orange,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          Spacer(),
                                            Row(
                                              children: [
                                                BuildQTYButton(
                                                    icon: Icons.remove,
                                                    iconColor: Colors.white,
                                                    onPressed: () {}),
                                                const Padding(
                                                  padding: EdgeInsets
                                                          .symmetric(
                                                      horizontal: 6,
                                                      vertical: 2),
                                                  child: Text(
                                                    "1",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                BuildQTYButton(
                                                  icon: Icons.add,
                                                  iconColor: Colors.white,
                                                  onPressed: () {
                                                   
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
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
              BuildAmountDetail(startName: "SubTotal", endName: "\$ 16.0"),
              BuildAmountDetail(startName: "Discount", endName: "\$ 0.0"),
              const Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BuildAmountDetail(startName: "", endName: "\$ 16.0"),
                  BuildButtonBuy(
                    name: "Check Out",
                    sizeHeight: 40,
                    sizeWidth: 150,
                    onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                             builder: (ctx) =>
                                  InvoiceScreen()));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
