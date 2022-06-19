class Category {
  int? _statusCode;
  String? _message;
  late List<CategoryModel> _data;
  List<CategoryModel> get data => _data;

  Category({required statusCode, required message, required data}) {
    this._statusCode = statusCode;
    this._message = message;
    this._data = data;
  }

  Category.fromJson(Map<String, dynamic> json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <CategoryModel>[];
      json['data'].forEach((v) {
        _data.add(CategoryModel.fromJson(v));
      });
    }
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

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
