import 'package:flutter/cupertino.dart';
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

class _ListProductState extends State<ListProduct>
    with SingleTickerProviderStateMixin {
  String? search;
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (searchController.text != '') {
      Provider.of<ProductController>(context, listen: false)
          .getSearchProducts(search.toString());
    }
    final searchProducts =
        Provider.of<ProductController>(context).searchContetns;

    Provider.of<ProductController>(context).getProduct(widget.data.id!.toInt());
    final products = Provider.of<ProductController>(context)
        .productList(widget.data.id!.toInt());

    return Scaffold(appBar: appBar, body: body(products, searchProducts));
  }

  get appBar {
    return AppBar(
      centerTitle: true,
      title: Text(
        widget.data.name.toString() + "\t" + "Product",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
      ],
    );
  }

  body(List<ProductModel>? products, List<ProductModel>? searchProducts) {
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
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        search = value;
                      });
                    },
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
                ),
              ),
              Center(
                child: Container(
                  width: 35,
                  height: 35,
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
          child: ListView(
            children: [
              searchController.text == ''
                  ? GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: products!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.6,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (ctx, i) {
                        return SingleProductWidget(products[i]);
                      },
                    )
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: searchProducts!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.6,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (ctx, i) {
                        return SingleProductWidget(searchProducts[i]);
                      },
                    )
            ],
          ),
        ),
      ],
    );
  }
}

sort(BuildContext context) {
  return SimpleDialog(
    title: const Text(
      'Filter',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    ),
    children: <Widget>[
      SimpleDialogOption(
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sort),
                  SizedBox(width: 10),
                  Text(
                    'A-Z',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              onTap: () {
                print('a-z');
              },
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sort),
                  SizedBox(width: 10),
                  Text(
                    'Z-A',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              onTap: () {
                print('a-z');
              },
            ),
          ],
        ),
      ),
    ],
  );
}
