import 'package:get/get.dart';
import 'package:sports_shopping_app/data/api/api_client.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData("https/www.sportdhop.com/api/product");
  }
}
