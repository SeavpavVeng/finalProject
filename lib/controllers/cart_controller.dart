//vmvmmimport 'dart:convert';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_shopping_app/models/cart_model.dart';

import '../models/category_model.dart';
import 'package:http/http.dart' as http;

class CartController with ChangeNotifier {
  List<CartModel>? _cartList = [];

  Future<bool> addToCart(int id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var token = localStorage.getString('access_token');

    http.Response response = await http.post(
      Uri.parse("https://api-hs.herokuapp.com" + "/api/cart"),
      headers: {
        'Authorization':
            'Bearer $token'
      },
     
    );

    try {
      var cartData;
      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        Cart cartModel = Cart.fromJson(body);
        cartData = cartModel.data;
      } else {
        notifyListeners();
         return true;
      }
      _cartList = cartData;

      notifyListeners();
       return true;
    } catch (e) {
      print("e getCarts");
      print(e);
      return false;
    }
  }

  List<CartModel> get cardAll {
    if (_cartList != null) {
      return [...?_cartList];
    }
    return [];
  }

  List<CartModel>? productListCart(int id) {
    print("[" * 100);
    print(_cartList);
    if (_cartList != null) {
      return [..._cartList!]
          .where((element) => element.productId == id)
          .toList();
    }
    return [];
  }

  CartModel listProductAddToCart(int id) {
    return _cartList!.firstWhere((element) => element.productId == id);
  }
}
