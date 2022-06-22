class review {
  bool? status;
  int? orderId;
  String? restaurant;

  review({this.status, this.orderId, this.restaurant});

  review.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    orderId = json['orderId'];
    restaurant = json['restaurant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['orderId'] = this.orderId;
    data['restaurant'] = this.restaurant;
    return data;
  }
}
