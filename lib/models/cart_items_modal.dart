class cart_get {
  List<AllcartSRecords>? allcartSRecords;
  int? vat;

  cart_get({this.allcartSRecords, this.vat});

  cart_get.fromJson(Map<String, dynamic> json) {
    if (json['AllcartSRecords'] != null) {
      allcartSRecords = <AllcartSRecords>[];
      json['AllcartSRecords'].forEach((v) {
        allcartSRecords!.add(new AllcartSRecords.fromJson(v));
      });
    }
    vat = json['Vat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allcartSRecords != null) {
      data['AllcartSRecords'] =
          this.allcartSRecords!.map((v) => v.toJson()).toList();
    }
    data['Vat'] = this.vat;
    return data;
  }
}

class AllcartSRecords {
  int? id;
  int? userId;
  int? productId;
  int? restaurantId;
  int? variantId;
  int? price;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  Prod? prod;

  AllcartSRecords(
      {this.id,
        this.userId,
        this.productId,
        this.restaurantId,
        this.variantId,
        this.price,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.prod});

  AllcartSRecords.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    restaurantId = json['restaurant_id'];
    variantId = json['variant_id'];
    price = json['price'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    prod = json['prod'] != null ? new Prod.fromJson(json['prod']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['restaurant_id'] = this.restaurantId;
    data['variant_id'] = this.variantId;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.prod != null) {
      data['prod'] = this.prod!.toJson();
    }
    return data;
  }
}

class Prod {
  int? id;
  int? restaurantId;
  int? categoryId;
  String? image;
  String? title;
  int? price;
  String? preparationTime;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;

  Prod(
      {this.id,
        this.restaurantId,
        this.categoryId,
        this.image,
        this.title,
        this.price,
        this.preparationTime,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt});

  Prod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    categoryId = json['category_id'];
    image = json['image'];
    title = json['title'];
    price = json['price'];
    preparationTime = json['preparation_time'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['title'] = this.title;
    data['price'] = this.price;
    data['preparation_time'] = this.preparationTime;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}