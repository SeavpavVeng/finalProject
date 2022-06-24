// class Categories{
//   int? _statusCode;
//   String? _message;
//   CategoryModel? _data;
//   CategoryModel? get data => _data;

//   Categories({required statusCode, required message, required data}) {
//     _statusCode = statusCode;
//     _message = message;
//     _data = data;
//   }
  
//   // factory Categories.fromJson(Map<String, dynamic> json) { 
//   // final _data = [];
//   //   json["data"].forEach((v) => _data.add(CategoryModel.fromJson(v)));
//   //  return Categories(
//   //    statusCode: json['statusCode'],
//   //    message:json['message'],
//   //    data: _data,
//   //   //  [
//   //   //    if (json['data'] != null) {
//   //   //     _data = <CategoryModel>[],
//   //   //   print(ata);
//   //   //   json['data'].forEach((v) {
//   //   //     _data.add(CategoryModel.fromJson(v));
//   //   //   });
//   //   // }
//   //   //  ]
   
//   //   );
//   // }

//   Categories.fromJson(Map<String, dynamic> json) {
//     _statusCode = json['statusCode'];
//     _message = json['message'];
//     if (json['data'] != null) {
//       _data = CategoryModel?;
//       print(_data);
//       json['data'].forEach((v) {
//         _data.add(CategoryModel.fromJson(v));
//       });
//     }
//   }
//  }

// class CategoryModel {
//   int? id;
//   String? name;
//   String? image;

//   CategoryModel(
//       {this.id, this.name, this.image});

//   CategoryModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int;
//     name = json['name'] as String;
//     image = json['image'] as String;
    
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = id;
//   //   data['name'] = name;
//   //   data['image'] = image;
//   //   data['created_at'] = createdAt;
//   //   data['updated_at'] = updatedAt;
//   //   return data;
//   // }
// }

class CategoryModel {
  int? id;
  String? name;
  String? image;

  CategoryModel({this.id, this.name, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
