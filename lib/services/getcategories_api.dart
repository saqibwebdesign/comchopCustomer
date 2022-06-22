import 'dart:convert';

import 'package:Comchop/models/categories_model.dart';
import 'package:Comchop/models/resturantCatagory.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class get_categories extends api_calls {
  Future<Categories> getcategories() async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}getCategories',
      ),
      headers: userHeader,
    );
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      print(data);
      var categories = Categories.fromJson(data);
      print(categories);
      return categories;
    } else {
      return data;
    }
  }
   Future<restuarantCategory> subCatagories_product(id) async {
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
        '${url}getRestuarantCategory/$id/$latitude/$longtitude',
      ),
      headers: userHeader,
    );
     var data = json.decode(response.body);
if (response.statusCode == 200) {
      print(data);
      
    }
    restuarantCategory datas = restuarantCategory.fromJson(jsonDecode(response.body));

    return datas;
  }
}


