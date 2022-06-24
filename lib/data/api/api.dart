import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class CallApi{
    final String  _url =  'https://api-hs.herokuapp.com/api/users/';
     
    postData(data, apiUrl) async {
        var  fullUrl =   _url + apiUrl + await _getToken(); 
        return await http.post(
            Uri.parse(fullUrl) , 
            body: jsonEncode(data), 
            headers: _setHeaders()
        );
    }
    getData(apiUrl) async {
       var fullUrl = _url + apiUrl + await _getToken(); 
       return await http.get(
         Uri.parse(fullUrl) , 
         headers: _setHeaders()
       );
    }




    _setHeaders() => {
        'Content-type' : 'application/json',
        'Accept' : 'application/json',
      //   'Content-type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer $token',
    };

    _getToken() async {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        var token = localStorage.getString('token');
        return '?token=$token';
    }
}