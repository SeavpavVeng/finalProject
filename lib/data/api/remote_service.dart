import 'package:sports_shopping_app/models/category.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Categories>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://api-hs.herokuapp.com/api/category'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }


  
}
