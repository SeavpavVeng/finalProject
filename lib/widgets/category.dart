import 'package:flutter/material.dart';
import 'package:sports_shopping_app/data/data.dart';
import 'package:sports_shopping_app/models/single_product.dart';
import 'package:sports_shopping_app/route/routepage.dart';
import 'package:sports_shopping_app/screens/detail_screen.dart';
import 'package:sports_shopping_app/screens/list_product.dart';

import 'package:sports_shopping_app/models/category_product.dart';
import 'package:sports_shopping_app/widgets/category_card.dart';

class Category extends StatelessWidget {
  // final List<CategoryProduct> cardData;
  
  // Category({required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category_products.length,
          itemBuilder: (_, index) {
            var data = category_products[index];
            return CategoryCard(
                onPressed: () {
                  if(index == 0 ){
                     PageRouting.goToNextPage(
                    context: context,
                    navigateTo: ListProduct(
                       productData: Tshirt_products, 
                       image: Tshirt_products[index].images, 
                       name: Tshirt_products[index].names, 
                       price: Tshirt_products[index].prices,
                    ),
                  );
                  }
                  else if(index ==1){
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: ListProduct(
                        productData: ballproducts, 
                        image: ballproducts[index].images, 
                        name: ballproducts[index].names, 
                        price: ballproducts[index].prices,
                      ),
                    );
                  }
                  else if(index == 2){
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: ListProduct(
                        productData: bootsproducts, 
                        image: bootsproducts[index].images, 
                        name: bootsproducts[index].names, 
                        price: bootsproducts[index].prices,
                      ),
                    );
                  }
                  else if(index ==3){
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: ListProduct(
                        productData: glovesproducts, 
                        image: glovesproducts[index].images, 
                        name: glovesproducts[index].names, 
                        price: glovesproducts[index].prices,
                      ),
                    );
                  }
                  else if(index ==4){
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: ListProduct(
                        productData: socksproducts, 
                        image: socksproducts[index].images, 
                        name: socksproducts[index].names, 
                        price: socksproducts[index].prices,
                      ),
                    );
                  }
                 
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => ListProduct()));
                },
                image: data.image,
                name: data.name);
          }),
      // ListView(
      //   scrollDirection: Axis.horizontal,
      //   children: [
      //     GestureDetector(
      //      // onTap: () => Navigator.push(context,  MaterialPageRoute(builder: (context) =>  FashionProduct())),
      //       child: CategoryCard(
      //         image: Image.asset(
      //           "asset/images/category/T_shirts.png",
      //         ),
      //         name: "Jersey",
      //       ),
      //     ),
      //     CategoryCard(
      //       image: Image.asset(
      //         "asset/images/addias_ball_3.jpg",
      //       ),
      //       name: "Ball",
      //     ),
      //     CategoryCard(
      //       image: Image.asset(
      //         "asset/images/category/boots.jpg",
      //       ),
      //       name: "Boots",
      //     ),
      //     CategoryCard(
      //       image: Image.asset(
      //         "asset/images/category/gloves.png",
      //       ),
      //       name: "Gloves",
      //     ),
      //     CategoryCard(
      //       image: Image.asset(
      //         "asset/images/category/socks.png",
      //       ),
      //       name: "Socks",
      //     ),
      //   ],
      // ),
    );
  }
}
