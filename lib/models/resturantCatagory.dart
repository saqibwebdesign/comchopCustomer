class restuarantCategory {
  List<Data>? data;
  List<Menus>? menus;

  restuarantCategory({this.data, this.menus});

  restuarantCategory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['menus'] != null) {
      menus = <Menus>[];
      json['menus'].forEach((v) {
        menus!.add(new Menus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.menus != null) {
      data['menus'] = this.menus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? logoImg;
  String? address;
  String? latitude;
  String? longitude;
  String? rating;
  int? reviews;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.logoImg,
      this.address,
      this.latitude,
      this.longitude,
      this.rating,
      this.reviews});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    logoImg = json['logo_img'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    rating = json['rating'];
    reviews = json['reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['logo_img'] = this.logoImg;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    return data;
  }
}

class Menus {
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

  Menus(
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

  Menus.fromJson(Map<String, dynamic> json) {
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
////ok