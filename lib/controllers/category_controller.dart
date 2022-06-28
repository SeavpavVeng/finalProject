import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryController with ChangeNotifier {
  List<Data>? _categoryList = [];

  Future<bool> getCategory() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var token = localStorage.getString('access_token');

    http.Response response = await http.get(
        Uri.parse("https://api-hs.herokuapp.com" + "/api/category"),
        headers: {'Authorization': 'Bearer $token'});

    try {
      var categoryData;
      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        CategoryModel categoryModel = CategoryModel.fromJson(body);
        categoryData = categoryModel.data;
        print(categoryData.runtimeType);
      } else {
        notifyListeners();
        return true;
      }
      _categoryList = categoryData;

      // List<CategoryModel> temp = [];
      // var body = json.decode(response.body);
      // for (var element in body) {
      //   CategoryModel categoryModel = CategoryModel.fromJson(element);
      //   temp.add(categoryModel);
      // }

      // _categoryList = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getCategory");
      print(e);
      return false;
    }
  }

  List<Data> get categoryAll {
    if (_categoryList != null) {
      return [...?_categoryList];
    }
    return [];
  }
}
