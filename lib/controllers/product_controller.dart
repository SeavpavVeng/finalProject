import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_shopping_app/models/cart_model.dart';

import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController with ChangeNotifier {
  List<ProductModel>? _productList = [];
  List<ProductModel>? _searchProducts = [];
  List<ProductModel>? _cartList = [];

  Future<bool> getProduct(int id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    try {
      var token = localStorage.getString('access_token');
      http.Response response = await http.get(
          Uri.parse("https://api-hs.herokuapp.com" + "/api/category/$id"),
          headers: {
            'Authorization': 'Bearer $token'
            //Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTU1OTY1NzMxZTY5ZTJiN2Q4YTAwYTQ0MGEyMmU3MWYyZDRkZGE0YTU1MGJmMWZmNmE1NGYzODY5OGMzOGVlNmVhOTM5YjFlNjlmMjg2ZDIiLCJpYXQiOjE2NTU5ODAwNDIuNjgxNDY1LCJuYmYiOjE2NTU5ODAwNDIuNjgxNDY5LCJleHAiOjE2ODc1MTYwNDIuNjY2OTcsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.pLtVqILOAeYkWOhlYTMPAMhlGjxA5XDAiLjvbnc36anajdSm9kwN6T6nLllypDKwjLH9PFruWqE-fYVAwpw9bFA94nzEKS9lgDsQRVQkBAuSEp6MQlcwvoL7-ACZfD_jaowuUZClqR0_hdydb7Kz6s_68pF6mwrYQmRHAUmXrUkzV373NrzGkB_lLvkZahIl-vMS9FnTZkRA42PQ21gXEjlYwVjErFpWxD_lIEUbj0EsmC9vrNxmJGGFeieuB7kYYZX6LBttgpsc_dFqpIKnc1old_eCC3x3c3w-KOZypG278bwJ-3hn_JaQRZsm3W-Egx4Ycb0MObV3fuLtnACaGzaU6bmF6WnEChICS9SC-WaZJzs7tFzT7be7XFPrWh_46lj6sFY7_rgi3-x3JLHliTg5BUPdFRc0U9QhQUCZsN9YrgJ8mOzWJP0fjRjz2HDlZ1fbRbi3jeNkzbNB1GBM_ViH6wvPzEiMkvkn9QU_YEuyZArpGR17cIN_cPq0_9eXvPoIrKrFWrg0WQ-hAAs1VWAqfdsBxiLcBFytExtVjdGWl4SRV0L6thaivWDnbem3Z7WU_osKU8sS72liHPdJsze-CxOLmUAMgNWwEJltONBGnQrM3L5YFfVaN-7p0FEQcbHv1tc7PWpOYu16-pjWvT1vNYiU977ziBOLLPlBVgk',
          });

      var productData;
      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        Product productModel = Product.fromJson(body);
        productData = productModel.data;
      } else {
        notifyListeners();
        return true;
      }

      _productList = productData;
      print(_productList);
      notifyListeners();
      return true;
    } catch (e) {
      print("e getCategory");
      print(e);
      return false;
    }
  }

  List<ProductModel> get productAll {
    if (_productList != null) {
      return [...?_productList];
    }
    return [];
  }

  List<ProductModel>? productList(int id) {
    if (_productList != null) {
      return [..._productList!]
          .where((element) => element.categoryId == id)
          .toList();
    }
    return [];
  }

  ProductModel listProduct(int id) {
    return _productList!.firstWhere((element) => element.categoryId == id);
  }

  List<ProductModel>? get favoriteProduct {
    return _productList!
        .where((element) => element.isFavorite == true)
        .toList();
  }

  Future<bool> getSearchProducts(String query) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    try {
      var token = localStorage.getString('access_token');
      http.Response response = await http.get(
          Uri.parse("https://api-hs.herokuapp.com" + "/api/search/$query"),
          headers: {
            'Authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTNhODAzYjFmZTBjN2VlMzYyOGI3MTBjMzg4YWJjMzUxMDhlOGQ2NGZlZWFlOWM0Nzk5OWRhMDIzODVmZjUwZjAxMjRiYjkwMTJkNDE3MmYiLCJpYXQiOjE2NTY2Njg3MjAuMDYxODc1LCJuYmYiOjE2NTY2Njg3MjAuMDYxODc3LCJleHAiOjE2ODgyMDQ3MjAuMDQ3NzU1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.a1ZX4aYtZorxT2B-R3rAe6_4ikUXuq0xZfMTkhmvYCDQK6MDNLuf5mbq3QqUPX-OVmn4tEcyOq_nU2OsG-hvhsVZPacjG212Suuhg5hrgqLN6G8QEXAXybHHsPWtfTwNneCwT4ck3UUTx1_bpYHHbWT_gEHh_n-NhdctaaNnmukreFmSB4n-lsGaWVzsHftAmAJ_wkPe1eyaIF-2juJ1pqOQPVYeUwbLmT0aunkTXvMBsUDPtZjZpmf5tUV44nLS6Bb6Or15Gi6I3TlyxfIhCgzRml_zb9w4u6mboUfabzkwvek25zb0tudr55MArBfcgVZN_-xR4huoMyPBvfdov9vXaDpBa59D1iHYIthoC8BJBMqT_kXcMGJckc2ITGwJlYaGr1VxWHCgppSDDZolNnPFgkza-TYxNr51JmMxDrR7f89DujQ0w2FW7C_F-lEda-qBQDc39vghnzu6geLYDYI5qeGzVyQa0WaYLHwhWqLNjVjccE5P5DqJ2EWs__NgBoym3BgP5rebvkXupW06IXyUsnWSFcjBL-oeY-n3pNboVnG369yP3WPCM7Jwx4JXB-qE6AhE-2xdMPSA5WzDgj26qQSXakh0NjNgYE9ri_cFicMPe9uoWWbKEqJ4ARGzNmE2yDaFDxi_ClroyX2u0DchY5BffAXl9WBuZUc79Pw'
            //Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTU1OTY1NzMxZTY5ZTJiN2Q4YTAwYTQ0MGEyMmU3MWYyZDRkZGE0YTU1MGJmMWZmNmE1NGYzODY5OGMzOGVlNmVhOTM5YjFlNjlmMjg2ZDIiLCJpYXQiOjE2NTU5ODAwNDIuNjgxNDY1LCJuYmYiOjE2NTU5ODAwNDIuNjgxNDY5LCJleHAiOjE2ODc1MTYwNDIuNjY2OTcsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.pLtVqILOAeYkWOhlYTMPAMhlGjxA5XDAiLjvbnc36anajdSm9kwN6T6nLllypDKwjLH9PFruWqE-fYVAwpw9bFA94nzEKS9lgDsQRVQkBAuSEp6MQlcwvoL7-ACZfD_jaowuUZClqR0_hdydb7Kz6s_68pF6mwrYQmRHAUmXrUkzV373NrzGkB_lLvkZahIl-vMS9FnTZkRA42PQ21gXEjlYwVjErFpWxD_lIEUbj0EsmC9vrNxmJGGFeieuB7kYYZX6LBttgpsc_dFqpIKnc1old_eCC3x3c3w-KOZypG278bwJ-3hn_JaQRZsm3W-Egx4Ycb0MObV3fuLtnACaGzaU6bmF6WnEChICS9SC-WaZJzs7tFzT7be7XFPrWh_46lj6sFY7_rgi3-x3JLHliTg5BUPdFRc0U9QhQUCZsN9YrgJ8mOzWJP0fjRjz2HDlZ1fbRbi3jeNkzbNB1GBM_ViH6wvPzEiMkvkn9QU_YEuyZArpGR17cIN_cPq0_9eXvPoIrKrFWrg0WQ-hAAs1VWAqfdsBxiLcBFytExtVjdGWl4SRV0L6thaivWDnbem3Z7WU_osKU8sS72liHPdJsze-CxOLmUAMgNWwEJltONBGnQrM3L5YFfVaN-7p0FEQcbHv1tc7PWpOYu16-pjWvT1vNYiU977ziBOLLPlBVgk',
          });

      var searchData;
      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        Product productModel = Product.fromJson(body);
        searchData = productModel.data;
      } else {
        notifyListeners();
        return true;
      }
      _searchProducts = searchData;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getSearchContents");
      print(e);
      notifyListeners();
      return false;
    }
  }

  List<ProductModel>? get searchContetns {
    if (_searchProducts != null) {
      return [...?_searchProducts].reversed.toList();
    }
    return [];
  }

  Future<void> addToCart(int id) async {
    print("&&&&&&&&&&&&&&&&&");
    print(id);
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var token = localStorage.getString('access_token');

    http.Response response = await http.post(
      Uri.parse("https://api-hs.herokuapp.com" + "/api/product/$id"),
      headers: {'Authorization': 'Bearer $token'},
    );

    try {
      var productData;
      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        Product productModel = Product.fromJson(body);
        productData = productModel.data;
        print(productData.runtimeType);
      } else {
        notifyListeners();
        // return true;
      }
      _cartList = productData;
      // print(_cartList)

      notifyListeners();
      // return true;
    } catch (e) {
      print("e getCarts");
      print(e);
      // return false;
    }
  }

  Future<void> addlike(int id) async {
    print("======");
    print(id);
    print("=====");
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    try {
      var token = localStorage.getString('access_token');
      http.Response response = await http.get(
          Uri.parse("https://api-hs.herokuapp.com" + "/api/favorite$id"),
          headers: {
            'Authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODI5YWM4NjEyYTM3ZjI1OWFkNGEyMmI0NTJhNDlkZTI2OWE3MGZhNTJmOWYyNzM1OThmZTRlMjJjM2M1NTZlYTBiMWQ2NjBkNTdhMWQ1N2EiLCJpYXQiOjE2NTY1ODA5NjAuNTE1MTc3LCJuYmYiOjE2NTY1ODA5NjAuNTE1MTc4LCJleHAiOjE2ODgxMTY5NjAuNTA4NjA0LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.v3w0mf4D9FOGTBGER5OV9pCZccYW7pVBvusUtxRS_c2odz3O7a40jg9HTLHNc6o9DPFd3-_C4iYf0IKvrYAay90KrmStbV5TLQyXngDhBG84oPaJji82Pa0i9W9BxbXvyxSX-as0by5i9CKCWqho_AsQCtxWjk5jYgtUX4grsDWH6NUk6jw_QeYlFtHPonip5QTEDELr0IFQKCqzxYoqnafNZjspp1AoKjSYhwpXTlG5AW_AA2AfLyh-ZpoxBgWSUaAk-2jsew3F2y1BPE7jaBL2_X5KLBisgGI5wkVpIFAiFy_QdytcO0HVBkE0Ooroz4w8_hf5RrdCN_GUSAwO84QrmTlnMacowlWPAvNM857hxurETIzYsvIkPFx_HpFmkojfaATzuwhvDh20hnd5AD732QeO2WpUJlK7wpXWNuwY6QPqCctKi65643bZUEguggg7tSZ8WPEr-P3hcBnhut27ToXJAM9XXtOtFWqdPIQFF8HI1KqJ8REqzzdcvYP2iZlhdHd_tYLdiH_AQJV1VYe_ACS-eIaDBh9w1QhsWukSbDzOV8RRrVSPkuqjBasEC3DnRIirl2I81gS_C42Yit1ellfAUMKEVsGycG52vMKsDRS0GpmV24wD0iO7MorBw7r3QyOFUjxPeR8dqdBTD-iAsyR0anNA8tIWnPyxQWY'
          });
      print(response);
      body:
      json.encode({
        "id": id,
      });

      //Map<String, dynamic> data = json.decode(response.body);
       var data = json.decode(utf8.decode(response.bodyBytes));
      print("#######");
      print(data);
      print("######");
      if (data['error'] == false) {
        print("got Id");
        getProduct(id);
      } else {
        print("didn't got Id");
        notifyListeners();
      }
    } catch (e) {
      print("error addlike");
      print(e);
    }
  }
}
