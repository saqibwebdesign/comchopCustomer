class activeorders {
  List<Orders>? orders;

  activeorders({this.orders});

  activeorders.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
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
  Null? isReviewed;
  int? status;
  String? createdAt;
  String? updatedAt;
  Restaurant? restaurant;
  List<Details>? details;

  Orders(
      {this.id,
      this.userId,
      this.restaurantId,
      this.subTotal,
      this.vatValue,
      this.totalPrice,
      this.paymentMethod,
      this.specialInstructions,
      this.isReviewed,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.restaurant,
      this.details});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    restaurantId = json['restaurant_id'];
    subTotal = json['sub_total'];
    vatValue = json['vat_value'];
    totalPrice = json['total_price'];
    paymentMethod = json['payment_method'];
    specialInstructions = json['special_instructions'];
    isReviewed = json['is_reviewed'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['restaurant_id'] = this.restaurantId;
    data['sub_total'] = this.subTotal;
    data['vat_value'] = this.vatValue;
    data['total_price'] = this.totalPrice;
    data['payment_method'] = this.paymentMethod;
    data['special_instructions'] = this.specialInstructions;
    data['is_reviewed'] = this.isReviewed;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
    }
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
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
  String? address;
  String? latitude;
  String? longitude;
  int? serviceRadius;
  int? serviceStatus;
  int? status;
  String? createdAt;
  String? updatedAt;

  Restaurant(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.ownerName,
      this.logoImg,
      this.address,
      this.latitude,
      this.longitude,
      this.serviceRadius,
      this.serviceStatus,
      this.status,
      this.createdAt,
      this.updatedAt});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    ownerName = json['owner_name'];
    logoImg = json['logo_img'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    serviceRadius = json['service_radius'];
    serviceStatus = json['service_status'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['owner_name'] = this.ownerName;
    data['logo_img'] = this.logoImg;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['service_radius'] = this.serviceRadius;
    data['service_status'] = this.serviceStatus;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  Menu? menu;

  Details(
      {this.id,
      this.orderId,
      this.productId,
      this.varientId,
      this.quantity,
      this.price,
      this.totalPrice,
      this.menu});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    varientId = json['varient_id'];
    quantity = json['quantity'];
    price = json['price'];
    totalPrice = json['total_price'];
    menu = json['menu'] != null ? new Menu.fromJson(json['menu']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['varient_id'] = this.varientId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total_price'] = this.totalPrice;
    if (this.menu != null) {
      data['menu'] = this.menu!.toJson();
    }
    return data;
  }
}

class Menu {
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

  Menu(
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

  Menu.fromJson(Map<String, dynamic> json) {
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
