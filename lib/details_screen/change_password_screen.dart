import 'package:flutter/material.dart';
import 'package:Comchop/signin_register_screens/create_account_screen.dart';
import 'package:Comchop/signin_register_screens/login_screen.dart';
import 'package:Comchop/signin_register_screens/otp_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class change_password extends StatefulWidget {
  const change_password({Key? key}) : super(key: key);

  @override
  _change_passwordState createState() => _change_passwordState();
}

class _change_passwordState extends State<change_password> {
  bool _issObscure = true;
  bool visible = false;
  final TextEditingController _oldpassword = TextEditingController();
  final TextEditingController _newpassword = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isssObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Change Password',
            style: TextStyle(color: Colors.black, fontSize: 22)),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFormField(
                  obscureText: _isObscure,
                  validator: (var value) {
                    if (value!.isEmpty) {
                      return "please enter pasword";
                    } else if (value.length < 7) {
                      return "Must be more than 7 charater";
                    }
                    return null;
                  },
                  controller: _oldpassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          color: Colors.grey,
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                      prefixStyle: TextStyle(color: Colors.grey),
                      hintText: 'Current Password',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(242, 242, 242, 1),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black.withAlpha(15),
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red))),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  obscureText: _issObscure,
                  validator: (var value) {
                    if (value!.isEmpty) {
                      return "please enter pasword";
                    } else if (value.length < 7) {
                      return "Must be more than 7 charater";
                    }
                    return null;
                  },
                  controller: _newpassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          color: Colors.grey,
                          icon: Icon(_issObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _issObscure = !_issObscure;
                            });
                          }),
                      prefixStyle: TextStyle(color: Colors.grey),
                      hintText: 'New Password',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(242, 242, 242, 1),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black.withAlpha(15),
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red))),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  obscureText: _isssObscure,
                  validator: (var value) {
                    if (value!.isEmpty) {
                      return "please enter pasword";
                    } else if (value.length < 7) {
                      return "Must be more than 7 charater";
                    }
                    return null;
                  },
                  controller: _confirmpassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          color: Colors.grey,
                          icon: Icon(_isssObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isssObscure = !_isssObscure;
                            });
                          }),
                      prefixStyle: TextStyle(color: Colors.grey),
                      hintText: 'New Password',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(242, 242, 242, 1),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black.withAlpha(15),
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red))),
                ),
                SizedBox(
                  height: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Container(
                          height: 50,
                          width: 290,
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Color.fromRGBO(252, 186, 24, 1),
                              child: Text(
                                'Change Password',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  print("Sucessful");
                                } else {
                                  print("Unsucessful");
                                }
                                changePassword();
                              })),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changePassword() async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final multipartRequest = new http.MultipartRequest("POST",
        Uri.parse("https://comchop.com/api/changePassword"));

    multipartRequest.fields.addAll({
      "old_password": _oldpassword.text,
      "password": _newpassword.text,
      "confirm_password": _confirmpassword.text,
    });
    multipartRequest.headers.addAll(userHeader);
    http.StreamedResponse response = await multipartRequest.send();

    var responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }
    if (responseString == '{"status":true,"success":"Password updated."}') {
      _oldpassword.clear();
      _newpassword.clear();
      _confirmpassword.clear();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cancel_outlined,
                  size: 60,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Invalid Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      );
    } else {
      _oldpassword.clear();
      _newpassword.clear();
      _confirmpassword.clear();

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
                  "Password Change Sucessfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      );
    }

    print("response: " + responseString);
    print("response Status: ${response.statusCode}");
  }
}
