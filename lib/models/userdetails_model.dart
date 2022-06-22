class Userdetails {
  User? user;

  Userdetails({this.user});

  Userdetails.fromJson(Map<String, dynamic> json) {
    this.user = json["user"] == null ? null : User.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.user != null)
      data["user"] = this.user?.toJson();
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  dynamic? emailVerifiedAt;
  String? facebookId;
  String? googleId;
  int? status;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.name, this.email, this.phone, this.emailVerifiedAt, this.facebookId, this.googleId, this.status, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.email = json["email"];
    this.phone = json["phone"];
    this.emailVerifiedAt = json["email_verified_at"];
    this.facebookId = json["facebook_id"];
    this.googleId = json["google_id"];
    this.status = json["status"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["email"] = this.email;
    data["phone"] = this.phone;
    data["email_verified_at"] = this.emailVerifiedAt;
    data["facebook_id"] = this.facebookId;
    data["google_id"] = this.googleId;
    data["status"] = this.status;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}