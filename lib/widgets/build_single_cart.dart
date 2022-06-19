import 'package:flutter/material.dart';
import 'package:sports_shopping_app/widgets/build_qty_button.dart';
import 'package:sports_shopping_app/widgets/drop_button_widget.dart';

class BuildSingleCart extends StatefulWidget {
  BuildSingleCart({Key? key}) : super(key: key);


  @override
  State<BuildSingleCart> createState() => _BuildSingleCartState();
}

class _BuildSingleCartState extends State<BuildSingleCart> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      child: Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Container(
                height: 130,
                width: 135,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("asset/images/category/T_shirts.png"),
                )),
              ),
              Container(
                height: 120,
                width: 250,
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4.0,
                          bottom: 2.0,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: const Text(
                                "FC Barcelona",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {}),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 4.0,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Size : ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                         
                            Text("M",style:
                                  TextStyle(fontSize: 20, color: Colors.blueAccent), )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4.0,
                            ),
                            child: Text(
                              "\$${120}",
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              BuildQTYButton(
                                  icon: Icons.remove,
                                  iconColor: Colors.white,
                                  onPressed: () {}),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                child: Text(
                                  "01",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              BuildQTYButton(
                                icon: Icons.add,
                                iconColor: Colors.white,
                                onPressed: () {},
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
    );
  }
}
