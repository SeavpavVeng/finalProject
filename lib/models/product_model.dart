class Product {
  int? statusCode;
  String? message;
  List<ProductModel>? data;

  Product({this.statusCode, this.message, this.data});

  Product.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductModel {
  int? id;
  int? categoryId;
  String? name;
  String? image;
  int? brandId;
  int? sizeId;
  String? price;
  String? desc;
  String? createdAt;
  String? updatedAt;

  ProductModel(
      {this.id,
      this.categoryId,
      this.name,
      this.image,
      this.brandId,
      this.sizeId,
      this.price,
      this.desc,
      this.createdAt,
      this.updatedAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    brandId = json['brand_id'];
    sizeId = json['size_id'];
    price = json['price'];
    desc = json['desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['brand_id'] = this.brandId;
    data['size_id'] = this.sizeId;
    data['price'] = this.price;
    data['desc'] = this.desc;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}