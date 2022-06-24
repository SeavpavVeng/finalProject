import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_shopping_app/data/api/api_client.dart';
import 'package:sports_shopping_app/models/signup_body_model.dart';
import 'package:sports_shopping_app/utils/app_constants.dart';

class AuthRepo extends GetxService{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  // Future<Response> registration(SignUpBody signUpBody) async {
  //   // return await apiClient.postData(
  //   //     AppConstants.REGISTRATION_URI, signUpBody.toJson());
  // }

  // Future<Response> login(String phone, String password) async {
  //   return await apiClient.postData("https://shopsport/api/auth/login",
  //       {"phone": phone, "password": password});
  // }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  // Future<void> saveUserNumberAndPassword(String number, String password) async {
  //   try {
  //     await sharedPreferences.setString( "1", number);
  //     await sharedPreferences.setString("1", password);
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
