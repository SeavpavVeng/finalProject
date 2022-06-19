import 'package:flutter/material.dart';
import 'package:sports_shopping_app/widgets/build_qty_button.dart';
import 'package:sports_shopping_app/widgets/drop_button_widget.dart';

class BuildCheckOut extends StatefulWidget {
  BuildCheckOut({Key? key}) : super(key: key);

  @override
  State<BuildCheckOut> createState() => _BuildCheckOutState();
}

class _BuildCheckOutState extends State<BuildCheckOut> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
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
              height: 130,
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
                    child: Container(
                      child: const Text(
                        "FC Barcelona",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
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
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          "M",
                          style:
                              TextStyle(fontSize: 16, color: Colors.blueAccent),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          "Qty : ",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          "1",
                          style:
                              TextStyle(fontSize: 16, color: Colors.blueAccent),
                        )
                      ],
                    ),
                  ),
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
                ],
              )),
            ),
          ]),
        ]),
      ),
    );
  }
}
