import 'package:flutter/material.dart';

class menu {
  List<Data>? data;
  List<Menus>? menus;
  String? user;
  List<Categories>? categories;

  menu({this.data, this.menus, this.user, this.categories});

  menu.fromJson(Map<String, dynamic> json) {
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
    user = json['user'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
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
    data['user'] = this.user;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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
  double? distance;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.ownerName,
      this.logoImg,
      this.password,
      this.address,
      this.latitude,
      this.longitude,
      this.serviceRadius,
      this.serviceStatus,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.distance});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    ownerName = json['owner_name'];
    logoImg = json['logo_img'];
    password = json['password'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    serviceRadius = json['service_radius'];
    serviceStatus = json['service_status'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['owner_name'] = this.ownerName;
    data['logo_img'] = this.logoImg;
    data['password'] = this.password;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['service_radius'] = this.serviceRadius;
    data['service_status'] = this.serviceStatus;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['distance'] = this.distance;
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

class Categories {
  int? id;
  String? name;
  String? image;
  int? status;

  Categories({this.id, this.name, this.image, this.status});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}
