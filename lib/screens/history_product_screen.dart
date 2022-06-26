import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sports_shopping_app/widgets/big_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> itemPerOrder = [1, 2, 3, 4];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart History"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: ListView(
                children: [
                  for (int i = 0; i < itemPerOrder.length; i++)
                    Container(
                      height: 120,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              color: Colors.black,
                              text: "05/05/2022",
                              size: 16,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                    direction: Axis.horizontal,
                                    children:
                                        List.generate(itemPerOrder[1], (index) {
                                      return index <= 2
                                          ? Card(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                            ),
                                            color: const Color.fromARGB(255, 223, 230, 243),
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                  image: AssetImage(
                                                      "asset/images/category/T_shirts.png"),
                                                )),
                                              ),
                                            )
                                          : Container();
                                    })),
                                Container(
                                  height: 80,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                          color: Colors.black,
                                          text: "Total",
                                          size: 14,
                                          overflow: TextOverflow.ellipsis),
                                      BigText(
                                          color: Colors.blueAccent,
                                          text:
                                              itemPerOrder.toString() + "Items",
                                          size: 16,
                                          overflow: TextOverflow.ellipsis),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.blueAccent),
                                        ),
                                        child: BigText(
                                          color: Colors.black,
                                          text: "One more",
                                          size: 14,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ]),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
