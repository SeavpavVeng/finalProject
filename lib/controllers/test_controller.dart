import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sports_shopping_app/models/test_model.dart';
import 'package:http/http.dart' as http;
import 'package:sports_shopping_app/utils/app_constants.dart';

class TestController with ChangeNotifier {
  List<CategoryModel>? _categoryList;

  LocalStorage storage = LocalStorage("usertoken");

  Future<bool> getCategory() async {
    try {
      print(Uri.parse(AppConstants.BASE_URL + "/api/category/"));
      var token = storage.getItem('token');
      http.Response response = await http.get(Uri.parse(AppConstants.BASE_URL + "/api/category/"), 
          headers: {
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTU1OTY1NzMxZTY5ZTJiN2Q4YTAwYTQ0MGEyMmU3MWYyZDRkZGE0YTU1MGJmMWZmNmE1NGYzODY5OGMzOGVlNmVhOTM5YjFlNjlmMjg2ZDIiLCJpYXQiOjE2NTU5ODAwNDIuNjgxNDY1LCJuYmYiOjE2NTU5ODAwNDIuNjgxNDY5LCJleHAiOjE2ODc1MTYwNDIuNjY2OTcsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.pLtVqILOAeYkWOhlYTMPAMhlGjxA5XDAiLjvbnc36anajdSm9kwN6T6nLllypDKwjLH9PFruWqE-fYVAwpw9bFA94nzEKS9lgDsQRVQkBAuSEp6MQlcwvoL7-ACZfD_jaowuUZClqR0_hdydb7Kz6s_68pF6mwrYQmRHAUmXrUkzV373NrzGkB_lLvkZahIl-vMS9FnTZkRA42PQ21gXEjlYwVjErFpWxD_lIEUbj0EsmC9vrNxmJGGFeieuB7kYYZX6LBttgpsc_dFqpIKnc1old_eCC3x3c3w-KOZypG278bwJ-3hn_JaQRZsm3W-Egx4Ycb0MObV3fuLtnACaGzaU6bmF6WnEChICS9SC-WaZJzs7tFzT7be7XFPrWh_46lj6sFY7_rgi3-x3JLHliTg5BUPdFRc0U9QhQUCZsN9YrgJ8mOzWJP0fjRjz2HDlZ1fbRbi3jeNkzbNB1GBM_ViH6wvPzEiMkvkn9QU_YEuyZArpGR17cIN_cPq0_9eXvPoIrKrFWrg0WQ-hAAs1VWAqfdsBxiLcBFytExtVjdGWl4SRV0L6thaivWDnbem3Z7WU_osKU8sS72liHPdJsze-CxOLmUAMgNWwEJltONBGnQrM3L5YFfVaN-7p0FEQcbHv1tc7PWpOYu16-pjWvT1vNYiU977ziBOLLPlBVgk',
      });
    
      print(response.body);
      var data = json.decode(response.body);
      print(data);
      List<CategoryModel> temp = [];
      for (var element in data) {
        CategoryModel categoryModel = CategoryModel.fromJson(element);
        temp.add(categoryModel);
      }
      _categoryList = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getCategory");
      print(e);
      return false;
    }
  }
}
