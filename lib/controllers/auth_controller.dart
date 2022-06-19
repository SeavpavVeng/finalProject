import 'package:get/get.dart';
import 'package:sports_shopping_app/data/repository/auth_repo.dart';
import 'package:sports_shopping_app/models/response_model.dart';
import 'package:sports_shopping_app/models/signup_body_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isloading = false;
  bool get isloading => _isloading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isloading = true;
    // Response response = await authRepo.registration(signUpBody);
     Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    print(response);
    print(response.statusCode);
    print("2");
    if (response.statusCode ==200) {
      print("1");
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
      print("Helllo");
    } else {
      authRepo.saveUserToken(response.body["access_token"]);
      responseModel = ResponseModel(false, response.statusText!);
      print(responseModel);
      print("Error");
    }
    _isloading = false;
    update();
    return responseModel;
  }

  // Future<ResponseModel> login(String phone, String password) async {
  //   _isloading = true;
  //   Response response = await authRepo.login(phone, password);
  //   late ResponseModel responseModel;
  //   if (response.statusCode == 200) {
  //     authRepo.saveUserToken(response.body["token"]);
  //     responseModel = ResponseModel(true, response.body["token"]);
  //   } else {
  //     responseModel = ResponseModel(false, response.statusText!);
  //   }
  //   _isloading = true;
  //   update();
  //   return responseModel;
  // }

  // void saveUserNumberAndPassword(String number, String password) async {
  //   authRepo.saveUserNumberAndPassword(number, password);
  // }
}
