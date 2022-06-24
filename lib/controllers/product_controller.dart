// import 'dart:convert';

// import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
// import 'package:sports_shopping_app/data/api/api_client.dart';
// import 'package:sports_shopping_app/data/repository/product_repo.dart';
// // import 'package:sports_shopping_app/models/category_model.dart';
// import 'package:sports_shopping_app/utils/app_constants.dart';

// import '../models/category_model.dart';

 class ProductController extends GetxController {
//   final ProductRepo productRepo;
//   ProductController({required this.productRepo});

//   // List<Category> _productList = [];
//   // List<Category> get productList => _productList;

//   List<CategoryModel> _productList = [];
//   List<CategoryModel> get productList => _productList;
//   Future<void> getProductList() async {
//     Response response = await productRepo.getProductList();
//     //   var response = await ApiClient(appBaseUrl: AppConstants.BASE_URL).getData("/api/category", );

//     try {
//       if (response.statusCode == 200) {
//         print("got products");
//         // _productList = [];
//         print("hello");
//         print(response);
//         // _productList.addAll(response.body);
//         //  String jsonsDataString = await response.body.toString();
//         //  var _product = json.decode(response.body);
//         // toString of Response's body is assigned to jsonDataString
//        // print(response.body);
//         var data = json.decode(response.body) as List;
//         print(data);
//         List<CategoryModel> temp = [];
//         for (var element in data) {
//           CategoryModel content = CategoryModel.fromJson(element);
//           temp.add(content);
//         }
//         _productList = temp;

//         // _recommendedProductList.addAll();
//         update();
//       } else {
//         print("Error occurred and the error is " + response.body);
//       }
//     } catch (e) {
//       print("Error in the controller is " + e.toString());
//     }
//   }
}
