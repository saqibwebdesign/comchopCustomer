import 'dart:convert';

import 'package:Comchop/models/activeorders.dart';
import 'package:Comchop/models/order_details_.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class active_orders extends api_calls {
  Future<activeorders> getactiveorders() async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}activeOrders',
      ),
      headers: userHeader,
    );
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      print(data);

      var activeorder = activeorders.fromJson(data);
      return activeorder;
    } else {
      return data;
    }
  }
}
