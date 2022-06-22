import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Comchop/signin_register_screens/forgot_password_screen.dart';
import 'package:Comchop/signin_register_screens/login_screen.dart';
import 'package:Comchop/signin_register_screens/otp_screen.dart';
import 'package:Comchop/signin_register_screens/phone_number_screen.dart';

import 'package:http/http.dart' as http;

class create_acount_screen extends StatefulWidget {
  @override
  _create_acount_screenState createState() => _create_acount_screenState();
}

class _create_acount_screenState extends State<create_acount_screen> {
  bool visible = false;
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool _isObscure = true;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Form(
              key: _formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Create Account',
                      style: TextStyle(color: Colors.black, fontSize: 34),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Enter your Name, Email and Password',
                      style: TextStyle(
                          color: Color.fromRGBO(134, 134, 134, 1),
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "  for Sign up. ",
                        style: TextStyle(
                            color: Color.fromRGBO(134, 134, 134, 1),
                            fontSize: 16),
                      ),
                      TextSpan(
                        text: "Already have account? ",
                        style: TextStyle(
                          color: Color.fromRGBO(252, 186, 24, 1),
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => login_screen()),
                            );
                          },
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
                        controller: _fname,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter full name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            suffixStyle: TextStyle(color: Colors.grey),

                            prefixStyle: TextStyle(color: Colors.grey),
                            hintText: 'Full Name',
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
                      height: 10,
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
                        controller: _email,
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter email";
                          } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
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
                      height: 10,
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
                        controller: _phone,
                        keyboardType: TextInputType.number,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter phone";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            suffixStyle: TextStyle(color: Colors.grey),

                            prefixStyle: TextStyle(color: Colors.grey),
                            hintText: 'Phone Number',
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
                      height: 10,
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
                        controller: _password,
                        validator: (var value) {
                          if (value!.isEmpty) {
                            return "Please enter pasword";
                          } else if (value.length < 7) {
                            return "Must be more than 7 charater";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            prefixStyle: TextStyle(color: Colors.grey),
                            hintText: 'Password',
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
                      height: 10,
                    ),
                    Center(
                      child: Container(
                          height: 50,
                          width: 300,
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color: Color.fromRGBO(252, 186, 24, 1),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                print(_email.text);

                                if (_formkey.currentState!.validate()) {
                                  print("Sucessful");
                                  createaccount();
                                } else {
                                  print("Unsucessful");
                                }
                              })),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: Text(
                      'By Signing up you agree to our Terms ',
                      style: TextStyle(
                          color: Color.fromRGBO(134, 134, 134, 1),
                          fontSize: 14),
                    )),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: Text(
                      'Conditions & Privacy Policy.',
                      style: TextStyle(
                          color: Color.fromRGBO(134, 134, 134, 1),
                          fontSize: 14),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text(
                      ' or',
                      style: TextStyle(
                          color: Color.fromRGBO(134, 134, 134, 1),
                          fontSize: 16),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                      },
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 206, 203, 203)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                child: Image.network(
                                  "https://dnpprojects.com/demo/comchop_mobileslider/icon/google.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Sign in with Google',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
          ),
        ));
  }

  Future createaccount() async {
    final multipartRequest = new http.MultipartRequest("POST",
        Uri.parse("https://comchop.com/api/UserRegister"));

    multipartRequest.fields.addAll({
      "name": _fname.text,
      "email": _email.text,
      "phone": _phone.text,
      "password": _password.text,
      "confirmation_password": _password.text,
    });
    http.StreamedResponse response = await multipartRequest.send();

    var responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }
    if (responseString ==
        '{"success":false,"message":"Validation Error.","data":{"email":["The email has already been taken."]}}') {
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
                  "Email Address has Already Registered",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            create_acount_screen()),
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
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
                  "User Register Sucessfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => login_screen()),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    print("response: " + responseString);
    print("response Status: ${response.statusCode}");
  }
}
