class Categories {
  List<Categories1>? categories;

  Categories({this.categories});

  Categories.fromJson(Map<String, dynamic> json) {
    this.categories = json["categories"]==null ? null : (json["categories"] as List).map((e)=>Categories1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.categories != null)
      data["categories"] = this.categories?.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Categories1 {
  int? id;
  String? name;
  String? image;
  int? status;

  Categories1({this.id, this.name, this.image, this.status});

  Categories1.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.image = json["image"];
    this.status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["image"] = this.image;
    data["status"] = this.status;
    return data;
  }
}