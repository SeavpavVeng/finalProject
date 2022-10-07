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
  int? brandId;
  int? sizeId;
  String? categoryName;
  String? brandName;
  String? sizeName;
  String? name;
  String? image;
  String? price;
  int? quantity;
  String? discount;
  String? description;
  bool? isCart;
  bool? isFavorite;

  ProductModel(
      {this.id,
      this.categoryId,
      this.brandId,
      this.sizeId,
      this.categoryName,
      this.brandName,
      this.sizeName,
      this.name,
      this.image,
      this.price,
      this.quantity,
      this.discount,
      this.description,
      this.isCart,
      this.isFavorite});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    sizeId = json['size_id'];
    categoryName = json['category_name'];
    brandName = json['brand_name'];
    sizeName = json['size_name'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
    discount = json['discount'];
    description = json['description'];
    isCart = json['isCart'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['brand_id'] = this.brandId;
    data['size_id'] = this.sizeId;
    data['category_name'] = this.categoryName;
    data['brand_name'] = this.brandName;
    data['size_name'] = this.sizeName;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['isCart'] = this.isCart;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}