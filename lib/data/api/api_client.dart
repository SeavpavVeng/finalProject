import 'dart:convert';

import 'package:get/get.dart';
import 'package:sports_shopping_app/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {

  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      // 'Content-type': 'application/json',
      // 'Accept': 'application/json',
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      //  'Content-type' : 'application/json',
      // 'Accept' : 'application/json',
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async {
    try {
      print("get daata");
      Response response = await get(uri);
      print(response);
      return response;
      
    } catch (e) {
      print("can not get data");
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, String body) async {
    print(body.toString());
    print("step 1");
    try {
      Response response = await post(uri, jsonDecode(body), headers: _mainHeaders);
      print(response.toString());
      print("Step 2");
      return response;
    } catch (e) {
      print(e.toString());
      print("losee");
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
