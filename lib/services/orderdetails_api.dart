import 'dart:convert';

import 'package:Comchop/models/order_details_.dart';
import 'package:Comchop/models/resturantCatagory.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class order_details extends api_calls {
  Future<OrderDetails> getorders() async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}allOrders',
      ),
      headers: userHeader,
    );
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      print(data);

      var order = OrderDetails.fromJson(data);
      return order;
    } else {
      return data;
    }
  }
}
