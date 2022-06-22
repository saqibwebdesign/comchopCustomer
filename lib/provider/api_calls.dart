import 'dart:async';
import 'dart:convert';

import 'package:Comchop/signin_register_screens/policy.dart';
import 'package:flutter/material.dart';
import 'package:Comchop/models/reviewModel.dart';
import 'package:Comchop/signin_register_screens/login_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class api_calls with ChangeNotifier {
  var ab;
  var order;
  late String remark;
  var index = 0;
  var longtitude;
  var latitude;
  int cartvalue = 0;
  var lat;
  var long;
  String locate = '';
  bool isvalue = false;
  var url = 'https://comchop.com/api/';
  var imageurl = 'https://comchop.com/public/storage/restaurant/logo/';
  bool isdelete = false;

  double _userRating = 0;

  login(email, password, BuildContext context) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var data = {
      'email': email,
      'password': password,
    };
    var userHeader = {"Accept": "application/json"};

    final response = await http.post(
      Uri.parse(
        '${url}login?email=$email&password=$password',
      ),
      headers: userHeader,
    );

    if (response.statusCode == 200) {
      isvalue = false;
      var datas = (jsonDecode(response.body));

      var token = datas['data']['token'];
      final token1 = prefs.setString('new', token);
      final gettoken = prefs.getString('new');

      var userid = datas['data']['user_id'];
      final userid1 = prefs.setInt('tkn', userid);
      final getuserid = prefs.getInt('tkn');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => gettoken == null
                ? login_screen()
                : User_Aggrement_Screen(sts: getuserid)
            //  find_resturent(sts: getuserid)
            ),
      );
      SharedPreferences aa = await SharedPreferences.getInstance();
      aa.setString('new', datas);
      isvalue = false;
      print(gettoken);
      print(getuserid);
      print(datas);
    } else if (response.statusCode == 404) {
      isvalue = false;
      _rotateDialog(context);
    } else if (response.statusCode == 500) {
      isvalue = false;
      _rotateDialog(context);
    } else {
      print(isvalue);
      _rotateDialog(context);

      var datas = (jsonDecode(response.body));
      print(datas);
      isvalue = false;
      return;
    }

    notifyListeners();
    print(isvalue);
    return;
  }

  Future menuitems() async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var longtitude = prefs.getDouble('longtitude');
    var latitude = prefs.getDouble('latitude');

    print(longtitude);
    print(latitude);

    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}getRestuarant/${latitude}/${longtitude}',
      ),
      headers: userHeader,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      return;
    }
  }

  details_product(id) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}getsingleRest/$id',
      ),
      headers: userHeader,
    );

    var datas = jsonDecode(response.body);

    return datas;
  }

  Future deatils_varient(id) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}productDetail/$id',
      ),
      headers: userHeader,
    );
    var datas = jsonDecode(response.body);
    return datas;
  }

  void add_to_cart(
      product_id, restaurant_id, variant_id, price, quantity) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };

    final response = await http.post(
      Uri.parse(
        '${url}addCart?product_id=$product_id&restaurant_id=$restaurant_id&variant_id=$variant_id&price=$price&quantity=$quantity',
      ),
      headers: userHeader,
    );
    var datas = jsonDecode(response.body);
    print(datas);

    return datas;
  }

  Future get_cart() async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}ShowAllCart',
      ),
      headers: userHeader,
    );
    print('getcart_listening');
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return data;
    } else {
      return;
    }
  }

  void delete_cart(id) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.post(
      Uri.parse(
        '${url}destroyCart/$id',
      ),
      headers: userHeader,
    );
    if (response.statusCode == 200) {
      var datas = jsonDecode(response.body);
      print(datas);
      notifyListeners();
      print('deltecart_listening');
      Timer(Duration(seconds: 1), () {
        isdelete = false;
      });
      return datas;
    }
  }

  void update_cart(id, val) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.post(
      Uri.parse(
        '${url}updateCart/$id?quantity=$val',
      ),
      headers: userHeader,
    );
    var datas = jsonDecode(response.body);
    print(datas);

    notifyListeners();
    print('deltecart_listening');

    return datas;
  }

  void checkout_screen(vatvalue, payment, sub_total, vat_value, total_price,
      method, restaurant_id, special_instruction) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    List<Placemark> placemarks =
        await placemarkFromCoordinates(longtitude!, latitude!);
    Placemark place = placemarks[0];
    print(place.name);
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };

    final response = await http.post(
      Uri.parse(
        '${url}checkout/$vatvalue/$payment/$latitude/$longtitude?sub_total=$sub_total&vat_value=$vat_value&total_price=$total_price&payment_method=$method&restaurant_id=$restaurant_id&special_instructions=$special_instruction&address=${place.name}',
      ),
      headers: userHeader,
    );
    var datas = jsonDecode(response.body);
    print(datas);
    print(longtitude);
    notifyListeners();
    print('checkout_screen_listening');
  }

  logut(BuildContext context) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {'Authorization': 'Bearer $gettoken'};
    final response = await http.post(
      Uri.parse(
        '${url}logout',
      ),
      headers: userHeader,
    );
    if (response.statusCode == 200) {
      isvalue = false;
      var datas = (jsonDecode(response.body));
      print("jhjhkjhkjh");
      SharedPreferences tokn = await SharedPreferences.getInstance();
      SharedPreferences usrid = await SharedPreferences.getInstance();
      tokn.remove('new');
      usrid.remove('new');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => login_screen()),
      );
      _dialog(context);
      isvalue = false;
      print(datas);
      print(response);
      notifyListeners();
      return datas;
    }

    notifyListeners();
    print(isvalue);
    return;
  }

  getreview(BuildContext context) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {'Authorization': 'Bearer $gettoken'};
    final response = await http.get(
      Uri.parse(
        '${url}getReview',
      ),
      headers: userHeader,
    );
    if (response.statusCode == 200) {
      isvalue = false;
      var datas = (jsonDecode(response.body));
      var reviews = review.fromJson(datas);
      isvalue = false;
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (dialogContex) {
          final _review = TextEditingController();
          var order = reviews.orderId.toString();
          remark = _review.text;
          return Wrap(
            children: [
              AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                titlePadding: EdgeInsets.only(top: 0.0, bottom: 10),
                contentPadding: EdgeInsets.only(top: 0.0, bottom: 10),
                backgroundColor: Color.fromRGBO(242, 242, 242, 1),
                title: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 186, 24, 1),
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          'Rate your order',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              new Text(
                                "Order Id:    ",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                reviews.orderId.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(136, 136, 136, 1),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              new Text(
                                "Restaurant:    ",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                              new Text(
                                reviews.restaurant.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(136, 136, 136, 1),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: RatingBar.builder(
                              itemSize: 25,
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Color.fromRGBO(252, 186, 24, 1),
                              ),
                              onRatingUpdate: (_userRating) {
                                ab = _userRating;
                                print(ab);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            color: Color.fromRGBO(245, 240, 240, 0.952),
                            child: TextField(
                              controller: _review,
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 201, 198, 198),
                                  hintText: "Enter Remarks",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0, color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0, color: Colors.white)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 0, color: Colors.white))),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 35,
                                    width: 110,
                                    child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        color: Color.fromRGBO(
                                            245, 240, 240, 0.952),
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(dialogContex,
                                                  rootNavigator: true)
                                              .pop();
                                          cancel(
                                            order,
                                            context,
                                          );
                                        })),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 35,
                                    width: 110,
                                    child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        color: Color.fromRGBO(252, 186, 24, 1),
                                        child: Text(
                                          'Submit Review',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(dialogContex,
                                                  rootNavigator: true)
                                              .pop();

                                          print(ab);
                                          print(order);
                                          print(_review.text);

                                          submit(
                                            order,
                                            ab,
                                            _review.text,
                                            context,
                                          );
                                        })),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
      print(datas);

      print(response);
      notifyListeners();
      return datas;
    }

    notifyListeners();
    print(isvalue);
    return;
  }

  submit(
    order,
    ab,
    _review,
    BuildContext context,
  ) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.post(
      Uri.parse(
        '${url}submitReview?orderId=$order&rating=$ab&reviews=$_review',
      ),
      headers: userHeader,
    );
    if (response.statusCode == 200) {
      isvalue = false;
      var datas = (jsonDecode(response.body));
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Icon(
                  Icons.check_circle_outlined,
                  size: 60,
                  color: Color.fromRGBO(252, 186, 24, 1),
                ),
                SizedBox(
                  height: 10,
                ),
                new Text(
                  "Review Submitted Sucessfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      );
      isvalue = false;
      print(datas);
    }
    notifyListeners();
    print(isvalue);
    return;
  }

  cancel(
    order,
    BuildContext context,
  ) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}cancelReview/$order',
      ),
      headers: userHeader,
    );

    if (response.statusCode == 200) {
      var datas = (jsonDecode(response.body));
      isvalue = false;
      print(datas);
    }
    notifyListeners();
    print(isvalue);
    return;
  }
}

Widget _dialog(BuildContext context) {
  return AlertDialog(
    title: const Text("Error"),
    content: const Text("Incorrect Password or Email "),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Okay"))
    ],
  );
}

void _rotateDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, child) {
      return _dialog(ctx);
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
