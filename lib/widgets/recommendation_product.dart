import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_shopping_app/data/data.dart';
import 'package:sports_shopping_app/models/product_model.dart';
import 'package:sports_shopping_app/screens/detail_screen.dart';
import 'package:sports_shopping_app/widgets/single_product.dart';

import '../controllers/category_controller.dart';
import '../controllers/product_controller.dart';
import '../models/category_model.dart';

class RecommendationProduct extends StatefulWidget {
  // Data data;
  // RecommendationProduct(this.data);

  @override
  State<RecommendationProduct> createState() => _RecommendationProductState();
}

class _RecommendationProductState extends State<RecommendationProduct>  with SingleTickerProviderStateMixin{

   @override
  void didChangeDependencies() {
    Provider.of<CategoryController>(context).getCategory();
    super.didChangeDependencies();
  }

   @override
  void didUpdateWidget(covariant RecommendationProduct oldWidget) {
    Provider.of<CategoryController>(context).getCategory();
    super.didUpdateWidget(oldWidget);
  }
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
    final category = Provider.of<CategoryController>(context).categoryAll;
    return body(category);
    
  }
  body(List<Data>? category){
    return SingleChildScrollView(
      child: Container(
        height: 800,
        child: GridView.builder(
          itemCount: category!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
            crossAxisCount: 2,
          ),
          itemBuilder: (
            BuildContext context,
            index,
          ) {
            return GestureDetector(
      onTap: (){
        // Navigator.push(
        //   context,
        // MaterialPageRoute(builder: (context) => DetailScreen()
        // ),
        //);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    color: const Color.fromARGB(255, 223, 230, 243),
                    child: Container(
                      height: 150,
                      width: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(""),
                      )),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "FC Barcelona",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "\$${20}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
          },
        ),
      ),
    );
  }
}
