import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_shopping_app/controllers/category_controller.dart';
import 'package:sports_shopping_app/models/category_model.dart';
import 'package:sports_shopping_app/widgets/category_card.dart';


class Category extends StatefulWidget {
   bool isLoading = true;
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> with SingleTickerProviderStateMixin{
  // final List<CategoryProduct> cardData;
  @override
  void didChangeDependencies() {
    Provider.of<CategoryController>(context).getCategory();
    super.didChangeDependencies();
  }

  //  @override
  // void didUpdateWidget(covariant Category oldWidget) {
  //   Provider.of<CategoryController>(context).getCategory();
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
     final category = Provider.of<CategoryController>(context).categoryAll;
      return Container(
        height: 80,
        child:body(category),

      );
    //});
  }
  body(List<Data> category){
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (_, index) {
          return CategoryCard(
            category[index]        
          );
        });
}
}
