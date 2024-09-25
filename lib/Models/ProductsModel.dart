class Products {
  int? id;
  String? name;
  String? description;
  double? price;
  String? image;
  String? category;
  int? calories;
  String? color;
  String? type;
  List<Varients>? varients;
  int? stock;
  int? status;

  Products({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.category,
    this.type,
    this.calories,
    this.varients,
    this.status,
    this.stock,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    category = json['category'];
    calories = json['calories'];
    color = json['color'];
    type = json['type'];
    stock = json['stock'];
    if (json['varients'] != null) {
      varients = <Varients>[];
      json['varients'].forEach((v) {
        varients!.add(new Varients.fromJson(v));
      });
    }

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['image'] = image;
    data['category'] = category;
    data['calories'] = calories;
    data['type'] = type;
    data['color'] = color;
    data['stock'] = stock;
    if (varients != null) {
      data['varients'] = varients!.map((v) => v.toJson()).toList();
    }

    data['status'] = status;
    return data;
  }
}

class Varients {
  String? id;
  String? productId;
  String? name;
  bool? isActive;
  String? createdAt;
  double? price;

  Varients(
      {this.id,
      this.productId,
      this.name,
      this.isActive,
      this.createdAt,
      this.price});

  Varients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['price'] = this.price;
    return data;
  }
}
