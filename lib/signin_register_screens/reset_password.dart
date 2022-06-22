import 'package:flutter/material.dart';
import 'package:Comchop/signin_register_screens/login_screen.dart';

import 'package:http/http.dart' as http;

class reset_password extends StatefulWidget {
  final otpp;
  reset_password({Key? key, this.otpp}) : super(key: key);

  @override
  State<reset_password> createState() => _reset_passwordState();
}

class _reset_passwordState extends State<reset_password> {
  bool _isObscure = true;
  bool _issObscure = true;
  bool visible = false;

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(15),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    width: double.infinity,
                    child: TextFormField(
                      obscureText: _issObscure,
                      validator: (var value) {
                        if (value!.isEmpty) {
                          return "please enter pasword";
                        } else if (value.length < 7) {
                          return "Must be more than 7 charater";
                        }
                        return null;
                      },
                      controller: _password,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
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
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(15),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    width: double.infinity,
                    child: TextFormField(
                      obscureText: _isObscure,
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
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
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
                      ResetForm();
                    })),
          ],
        ),
      ),
    );
  }

  void ResetForm() async {
    final multipartRequest = new http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://comchop.com/api/ResetPasswordForm"));

    multipartRequest.fields.addAll({
      "password": _password.text,
      "confirmation_password": _confirmpassword.text,
      "otp": widget.otpp,
    });
    http.StreamedResponse response = await multipartRequest.send();

    var responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }
    if (responseString == '{"success":"Your code has been matched! "}') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => login_screen()),
      );
    } else {
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
    }

    print("response: " + responseString);
    print("response Status: ${response.statusCode}");
  }
}
