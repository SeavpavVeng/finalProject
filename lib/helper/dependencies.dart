import 'package:get/get.dart';
import 'package:sports_shopping_app/controllers/recommended_product.dart';
import 'package:sports_shopping_app/data/api/api_client.dart';
import 'package:sports_shopping_app/data/repository/recommended_product_repo.dart';

Future<void> init() async {
  //apiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://www.sportshop.com"));

  // repos
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  // Controller
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
