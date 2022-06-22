import 'dart:convert';

import 'package:Comchop/models/userdetails_model.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class userdetaills_api extends api_calls{

  Future<Userdetails> getuserdetails() async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}userDetail',
      ),
      headers: userHeader,
    );

    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      var details = Userdetails.fromJson(data);
      print(details.user);
      return details;
    } else {
       return data;
    }
  }
  void    updateuserdetails(name,phone) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.post(
      Uri.parse(
        '${url}userUpdate?name=$name&phone=$phone',
      ),
      headers: userHeader,
    );
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      print(data);
       return data;
    } else {
      return data;
    }
  }

}