import 'package:flutter/material.dart';

class BuildSingleCart extends StatelessWidget {
  const BuildSingleCart({ Key? key }) : super(key: key);

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
                width: 145,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("asset/images/category/T_shirts.png"),
                )),
              ),
              Container(
                height: 120,
                width: 180,
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4.0,
                          left: 8,
                          bottom: 2.0,
                        ),
                        child: Text(
                          "FC Barcelona",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 4.0, left: 8.0, top: 2.0),
                        child: Row(
                          children: [
                            Text(
                              "Size : ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Text("M",style:
                                  TextStyle(fontSize: 16, color: Colors.blueAccent), )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 4.0, left: 8.0, top: 2.0),
                        child: Row(
                          children: [
                            Text(
                              "Qty : ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Text("1",style:
                                  TextStyle(fontSize: 16, color: Colors.blueAccent), )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          top: 4.0,
                        ),
                        child: Text(
                          "\$${120}",
                          style: const TextStyle(
                              fontSize: 26,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.blueAccent,
                  ),
                 onPressed: (){}
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}