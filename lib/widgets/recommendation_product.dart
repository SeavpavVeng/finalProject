import 'package:flutter/material.dart';
import 'package:sports_shopping_app/data/data.dart';
import 'package:sports_shopping_app/screens/detail_screen.dart';
import 'package:sports_shopping_app/widgets/single_product.dart';

class RecommendationProduct extends StatefulWidget {
  const RecommendationProduct({ Key? key }) : super(key: key);

  @override
  State<RecommendationProduct> createState() => _RecommendationProductState();
}

class _RecommendationProductState extends State<RecommendationProduct> {
  //   Widget buildFeatureProduct({
  //     required String name,
  //     required String price,
  //     required String image,
  //   }) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
  //     child: Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(15)),
  //       ),
  //       child: Container(
  //         child: Column(
  //           children: [
  //             Container(
  //               height: 160,
  //               width: 160,
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                 image: AssetImage(image),
  //               )),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 16, right: 16),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [  
  //                   Column(
  //                     children: [
  //                       Text(
  //                         "\$${price}",
  //                         style: const TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 17,
  //                           color: Colors.blueAccent),
  //                       ),
  //                       Text(
  //                         name,
  //                         style: const TextStyle(fontSize: 17),
  //                       )
  //                     ]
  //                   ),
  //                   Container(
  //                     child: Icon(Icons.favorite, color: Colors.orange,),
  //                   )
                   
  //                 ],
  //               ),
  //             )
             
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
         height: 800,
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          childAspectRatio: 0.9,
          crossAxisCount: 2,
        ),
        itemBuilder: (
          BuildContext context,
          index,
        ) {
          var data = products[index];
          return SingleProductWidget(
            onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(
               builder: (context) => DetailScreen(
                 detailData: Tshirt_products, 
                 image: Tshirt_products[index].images, 
                 name: Tshirt_products[index].names,  
                 price: Tshirt_products[index].prices, 
                 )));
            },
            name: data.names, 
            price: data.prices, 
            image: data.images,
        );
        },
        //   children: [
        //     buildFeatureProduct(
        //         name: "Bayern Minuch",
        //         price: "379",
        //         image: "asset/images/category/T_shirts.png"
        //     ),
        //       buildFeatureProduct(
        //         image: "asset/images/category/T_shirts.png",
        //         price: "379",
        //         name: "Bayern Minuch",
        //       ),
        //       buildFeatureProduct(
        //         image: "asset/images/category/T_shirts.png",
        //         price: "379",
        //         name: "Bayern Minuch",
        //       ),
        //       buildFeatureProduct(
        //         image: "asset/images/category/T_shirts.png",
        //         price: "379",
        //         name: "Bayern Minuch",
        //       ),
        //       buildFeatureProduct(
        //         image: "asset/images/category/T_shirts.png",
        //         price: "379",
        //         name: "Bayern Minuch",
        //       ),
        //       buildFeatureProduct(
        //         image: "asset/images/category/T_shirts.png",
        //         price: "379",
        //         name: "Acer Aspire3",
        //       ),
        //       buildFeatureProduct(
        //         image: "asset/images/category/T_shirts.png",
        //         price: "379",
        //         name: "Bayern Minuch",
        //       ),
        //       buildFeatureProduct(
        //         image: "asset/images/category/T_shirts.png",
        //         price: "379",
        //         name: "Bayern Minuch",
        //       ),
        //       buildFeatureProduct(
        //         image: "asset/images/category/T_shirts.png",
        //         price: "379",
        //         name: "Bayern Minuch",
        //       ),
        //  ],
        ),
      ),
    );
  }
}
