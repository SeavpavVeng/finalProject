import 'package:flutter/material.dart';
import 'package:sports_shopping_app/data/data.dart';
import 'package:sports_shopping_app/models/category_product.dart';
import 'package:sports_shopping_app/models/single_product.dart';
import 'package:sports_shopping_app/route/routepage.dart';
import 'package:sports_shopping_app/screens/main_screens.dart';
import 'package:sports_shopping_app/widgets/brend_type.dart';
import 'package:sports_shopping_app/widgets/category_card.dart';
import 'package:sports_shopping_app/widgets/single_product.dart';

import 'detail_screen.dart';

class ListProduct extends StatefulWidget {
  // final SingleProduct data;
  // ListProduct({required this.data});
  ListProduct({required this.productData,required this.name, required this.image, required this.price});
   List<SingleProduct> productData;
   final String name;
   final String price;
   final String image;

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
  
  get appBar {
    return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      )),
      centerTitle: true,
      // leading: IconButton(
      //   onPressed: () {
      //     // Navigator.push(
      //     //     context, MaterialPageRoute(builder: (ctx) => MainScreen()));
      //   },
      //   icon: Icon(Icons.arrow_back),
      // ),
      title: Text("List Product"),
      actions: [
       // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
      ],
      // title: Text("My Product"),
      // bottom: TabBar(
      //   unselectedLabelColor: Colors.orange,
      //   unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      //   labelStyle: TextStyle(fontWeight: FontWeight.bold),
      //   indicatorWeight: 3,
      //   tabs: [
      //     Tab(
      //       child: Text("Addias"),
      //     ),
      //     Tab(
      //       child: Text("Nike"),
      //     )
      //   ],
      // ),
    );
  }

  get body {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Container(
      height: 800,
      child: GridView.builder(
        itemCount: widget.productData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          childAspectRatio: 0.9,
          crossAxisCount: 2,
        ),
        itemBuilder: (
          BuildContext context,
          index,
        ) {
          final data = widget.productData[index];
          return SingleProductWidget(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => DetailScreen(detailData: data)));
              
                if(index == 0){
                     PageRouting.goToNextPage(
                    context: context,
                    navigateTo: DetailScreen(
                       detailData: widget.productData, 
                       image: Tshirt_products[index].images, 
                       name: Tshirt_products[index].names, 
                       price: Tshirt_products[index].prices,
                    ),
                  );
                  }
                  else if(index ==1){
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: DetailScreen(
                        detailData: ballproducts, 
                        image: ballproducts[index].images, 
                        name: ballproducts[index].names, 
                        price: ballproducts[index].prices,
                      ),
                    );
                  }
                  else if(index == bootsproducts){
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: DetailScreen(
                        detailData: bootsproducts, 
                        image: bootsproducts[index].images, 
                        name: bootsproducts[index].names, 
                        price: bootsproducts[index].prices,
                      ),
                    );
                  }
                  else if(index ==3){
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: DetailScreen(
                        detailData: glovesproducts, 
                        image: glovesproducts[index].images, 
                        name: glovesproducts[index].names, 
                        price: glovesproducts[index].prices,
                      ),
                    );
                  }
                  else if(index ==4){
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: DetailScreen(
                        detailData: socksproducts, 
                        image: socksproducts[index].images, 
                        name: socksproducts[index].names, 
                        price: socksproducts[index].prices,
                      ),
                    );
                  }
              },
              name: data.names,
              price: data.prices,
              image: data.images,
            );
        },
      ),
    ),
      
      
      // BrendType(
        
      //     productData: bootsproducts, image: '',
        
          
      // ),
    );
  }
}
