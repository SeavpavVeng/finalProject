import 'package:get/get.dart';
import 'package:sports_shopping_app/data/api/api_client.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});

  Future<Response> getProductList() async {
    return await apiClient.getData("/api/category/");
  }
}
