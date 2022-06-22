import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Comchop/signin_register_screens/login_screen.dart';
import 'package:Comchop/signin_register_screens/otp_screen.dart';
import 'package:Comchop/signin_register_screens/reset_email_send_screen.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class forgot_password_screen extends StatefulWidget {
  const forgot_password_screen({Key? key}) : super(key: key);

  @override
  State<forgot_password_screen> createState() => _forgot_password_screenState();
}

class _forgot_password_screenState extends State<forgot_password_screen> {
  @override
  bool visible = false;
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password ',
                  style: TextStyle(color: Colors.black, fontSize: 34),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter your email address and we will ',
                  style: TextStyle(
                      color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "send you a OTP.",
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
                  ),
                ])),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(15),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  width: 334,
                  child: TextFormField(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "please enter email";
                      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                    controller: _email,
                    decoration: InputDecoration(
                        suffixStyle: TextStyle(color: Colors.grey),
                        prefixStyle: TextStyle(color: Colors.grey),
                        hintText: 'Email Address',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(242, 242, 242, 1),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(242, 242, 242, 1),
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                      height: 40,
                      width: 160,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Color.fromRGBO(252, 186, 24, 1),
                          child: Text(
                            'Reset password',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            emailver();
                          })),
                ),
              ]),
        ));
  }

  void emailver() async {
    final multipartRequest = new http.MultipartRequest("POST",
        Uri.parse("https://comchop.com/api/forgetPassword"));

    multipartRequest.fields.addAll({
      "email": _email.text,
    });
    http.StreamedResponse response = await multipartRequest.send();

    var responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }
    if (responseString ==
        '{"success":"We have e-mailed your password reset Code!"}') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => otp_screen()),
      );} else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Icon(
                  Icons.cancel_outlined,
                  size: 60,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 10,
                ),
                new Text(
                  "Invalid Email",
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
