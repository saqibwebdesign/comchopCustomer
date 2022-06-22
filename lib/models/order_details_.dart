class OrderDetails {
  List<Orders>? orders;

  OrderDetails({this.orders});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    this.orders = json["orders"]==null ? null : (json["orders"] as List).map((e)=>Orders.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.orders != null)
      data["orders"] = this.orders?.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Orders {
  int? id;
  int? userId;
  int? restaurantId;
  int? subTotal;
  int? vatValue;
  int? totalPrice;
  String? paymentMethod;
  String? specialInstructions;
  int? status;
  String? createdAt;
  String? updatedAt;
  Restaurant? restaurant;
  List<Details>? details;

  Orders({this.id, this.userId, this.restaurantId, this.subTotal, this.vatValue, this.totalPrice, this.paymentMethod, this.specialInstructions, this.status, this.createdAt, this.updatedAt, this.restaurant, this.details});

  Orders.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.userId = json["user_id"];
    this.restaurantId = json["restaurant_id"];
    this.subTotal = json["sub_total"];
    this.vatValue = json["vat_value"];
    this.totalPrice = json["total_price"];
    this.paymentMethod = json["payment_method"];
    this.specialInstructions = json["special_instructions"];
    this.status = json["status"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
    this.restaurant = json["restaurant"] == null ? null : Restaurant.fromJson(json["restaurant"]);
    this.details = json["details"]==null ? null : (json["details"] as List).map((e)=>Details.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["restaurant_id"] = this.restaurantId;
    data["sub_total"] = this.subTotal;
    data["vat_value"] = this.vatValue;
    data["total_price"] = this.totalPrice;
    data["payment_method"] = this.paymentMethod;
    data["special_instructions"] = this.specialInstructions;
    data["status"] = this.status;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if(this.restaurant != null)
      data["restaurant"] = this.restaurant?.toJson();
    if(this.details != null)
      data["details"] = this.details?.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Details {
  int? id;
  int? orderId;
  int? productId;
  int? varientId;
  int? quantity;
  int? price;
  int? totalPrice;
  dynamic? menu;

  Details({this.id, this.orderId, this.productId, this.varientId, this.quantity, this.price, this.totalPrice, this.menu});

  Details.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.orderId = json["order_id"];
    this.productId = json["product_id"];
    this.varientId = json["varient_id"];
    this.quantity = json["quantity"];
    this.price = json["price"];
    this.totalPrice = json["total_price"];
    this.menu = json["menu"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["order_id"] = this.orderId;
    data["product_id"] = this.productId;
    data["varient_id"] = this.varientId;
    data["quantity"] = this.quantity;
    data["price"] = this.price;
    data["total_price"] = this.totalPrice;
    data["menu"] = this.menu;
    return data;
  }
}

class Restaurant {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? ownerName;
  String? logoImg;
  String? password;
  String? address;
  String? latitude;
  String? longitude;
  int? serviceRadius;
  int? serviceStatus;
  int? status;
  String? createdAt;
  String? updatedAt;

  Restaurant({this.id, this.name, this.phone, this.email, this.ownerName, this.logoImg, this.password, this.address, this.latitude, this.longitude, this.serviceRadius, this.serviceStatus, this.status, this.createdAt, this.updatedAt});

  Restaurant.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.phone = json["phone"];
    this.email = json["email"];
    this.ownerName = json["owner_name"];
    this.logoImg = json["logo_img"];
    this.password = json["password"];
    this.address = json["address"];
    this.latitude = json["latitude"];
    this.longitude = json["longitude"];
    this.serviceRadius = json["service_radius"];
    this.serviceStatus = json["service_status"];
    this.status = json["status"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["phone"] = this.phone;
    data["email"] = this.email;
    data["owner_name"] = this.ownerName;
    data["logo_img"] = this.logoImg;
    data["password"] = this.password;
    data["address"] = this.address;
    data["latitude"] = this.latitude;
    data["longitude"] = this.longitude;
    data["service_radius"] = this.serviceRadius;
    data["service_status"] = this.serviceStatus;
    data["status"] = this.status;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}