import 'package:flutter/material.dart';
import 'package:sports_shopping_app/screens/invoice_screen.dart';
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
      height: 130,
      width: double.infinity,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: const Color.fromARGB(255, 223, 230, 243),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Container(
                    height: 90,
                    width: 70,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          "asset/images/real_madrid_home.png"),
                    )),
                  ),
                ),
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
                        padding: const EdgeInsets.only(top: 4, bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: const Text(
                                "Real Madrid",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w400),
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
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "M",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueAccent),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 2.0,
                            ),
                            child: Text(
                              "\$${16.0}",
                              style: TextStyle(
                                  fontSize: 24,
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
                                  "1",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              BuildQTYButton(
                                icon: Icons.add,
                                iconColor: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => InvoiceScreen()));
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
    );
  }
}
