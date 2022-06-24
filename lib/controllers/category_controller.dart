import 'package:get/get.dart';
import 'package:sports_shopping_app/models/category.dart';

import '../data/api/remote_service.dart';


class CategoryController extends GetxController {
  var isLoading = true.obs;
  var productList = <Categories>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
