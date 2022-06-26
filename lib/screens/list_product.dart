import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_shopping_app/controllers/product_controller.dart';
import 'package:sports_shopping_app/models/product_model.dart';
import 'package:sports_shopping_app/screens/detail_screen.dart';
import '../models/category_model.dart';
import '../widgets/single_product.dart';

class ListProduct extends StatefulWidget {


  Data data;
  ListProduct(this.data);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {

    Provider.of<ProductController>(context).getProduct(widget.data.id!.toInt());
    final products = Provider.of<ProductController>(context).productList(widget.data.id!.toInt());

    return Scaffold(appBar: appBar, body: body(products));
  }

  get appBar {
    return AppBar(
      centerTitle: true,
      title: Text(widget.data.name.toString()),
      actions: [
        // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
      ],
    );
  }

  body(List<ProductModel>? products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [  
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.blueAccent,
                      ),
                      hintText: "Search for Products",
                      hintStyle: const TextStyle(
                        color: Color(0xffb3a5de),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: const PhysicalShape(
                          color: Colors.blueAccent,
                          shadowColor: Colors.black,
                          elevation: 3,
                          clipper: ShapeBorderClipper(
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: BorderSide.none,
                      )),
                ),
              )),
              Center(
                child: Container(
                  width: 45,
                  height: 45,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Color(0xff03a9f4), Color(0xff004ba0)],
                      begin: Alignment.centerRight,
                      end: Alignment(-1.0, -1.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: products!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
              crossAxisCount: 2,
            ),
            itemBuilder: (ctx, i) {
              return SingleProductWidget(products[i]);
            },
          ),
        ),
      ],
    );
  }
}
