
import 'dart:convert';

import 'package:flutter/foundation.dart';

List<Categories> productFromJson(String str) =>
    List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String productToJson(List<Categories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories{
  int? _statusCode;
  String? _message;
  late List<CategoryModel> _data;
  List<CategoryModel> get data => _data;

  Categories({required statusCode, required message, required data}) {
    _statusCode = statusCode;
    _message = message;
    _data = data;
  }
   
  //   Categories.fromJson(Map<String, dynamic> json) {
  //   _statusCode = json['statusCode'];
  //   _message = json['message'];
  //   if (json['data'] != null) {
  //     _data = <CategoryModel>[];
  //     print(_data);
  //     json['data'].forEach((v) {
  //       _data.add(CategoryModel.fromJson(v));
  //     });
  //   }
  // }
  factory Categories.fromJson(Map<String, dynamic> json) { 
  final _data = [];
    json["data"].forEach((v) => _data.add(CategoryModel.fromJson(v)));
   return Categories(
     statusCode: json['statusCode'],
     message:json['message'],
     data: _data,
    //  [
    //    if (json['data'] != null) {
    //     _data = <CategoryModel>[],
    //   print(ata);
    //   json['data'].forEach((v) {
    //     _data.add(CategoryModel.fromJson(v));
    //   });
    // }
    //  ]
   
    );
  }
   
  

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this._statusCode;
    data['message'] = this._message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryModel {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryModel(
      {this.id, this.name, this.image, this.createdAt, this.updatedAt});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id : json['id'] as int,
    name : json['name'] as String,
    image : json['image'] as String,
    createdAt : json['created_at'] as String,
    updatedAt : json['updated_at'] as String
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
