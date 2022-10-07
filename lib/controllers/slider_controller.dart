
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_shopping_app/models/slider_model.dart';

class SliderController with ChangeNotifier{
  List<SliderModel>? _sliderList = [];

  Future<bool> getSlider() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var token = localStorage.getString('access_token');

    http.Response response = await http.get(
        Uri.parse("https://api-hs.herokuapp.com" + "/api/slider"),
        headers: {'Authorization': 'Bearer $token'});

    try {
      var sliderData;
      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        Slider sliderModel = Slider.fromJson(body);
        sliderData = sliderModel.data;
      } else {
        notifyListeners();
        return true;
      }
      _sliderList = sliderData;

      notifyListeners();
      return true;
    } catch (e) {
      print("e getSlider");
      print(e);
      return false;
    }
  }

  List<SliderModel> get sliderAll {
    if (_sliderList != null) {
      return [...?_sliderList];
    }
    return [];
  }
}