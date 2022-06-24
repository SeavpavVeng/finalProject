import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_shopping_app/controllers/auth_controller.dart';
import 'package:sports_shopping_app/controllers/product_controller.dart';
import 'package:sports_shopping_app/controllers/recommended_product.dart';
import 'package:sports_shopping_app/data/api/api_client.dart';
import 'package:sports_shopping_app/data/repository/auth_repo.dart';
import 'package:sports_shopping_app/data/repository/product_repo.dart';
import 'package:sports_shopping_app/data/repository/recommended_product_repo.dart';
import 'package:sports_shopping_app/utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //apiClient
  Get.lazyPut(
      () => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // repos
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  //Get.lazyPut(() => ProductController(productRepo: Get.find()));
}
