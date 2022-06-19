import 'package:get/get.dart';
import 'package:sports_shopping_app/data/repository/product_repo.dart';
import 'package:sports_shopping_app/models/category_model.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;
  ProductController({required this.productRepo});

  List<CategoryModel> _productList = [];
  List<CategoryModel> get productList => _productList;

  Future<void> getProductList() async {
    Response response = await productRepo.getProductList();
    if (response.statusCode == 200) {
      print("got products");
      _productList = [];
      _productList.addAll(Category.fromJson(response.body).data );
      print(_productList);
      // _recommendedProductList.addAll();
      update();
    } else {}
  }
}
