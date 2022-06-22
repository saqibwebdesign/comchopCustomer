import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Comchop/Tabbar_screens/tabbar_screen.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:Comchop/provider/cartprovider.dart';
import 'package:Comchop/provider/signinapi.dart';
import 'package:Comchop/signin_register_screens/create_account_screen.dart';
import 'package:Comchop/signin_register_screens/find_resturent_near_you.dart';
import 'package:Comchop/signin_register_screens/forgot_password_screen.dart';
import 'package:Comchop/signin_register_screens/phone_number_screen.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class login_screen extends StatefulWidget {
  final sts;
  const login_screen({Key? key, this.sts}) : super(key: key);

  @override
  _login_screenState createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  bool _issObscure = true;
  var nam;
  var ema;
  var siin;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<api_calls>(context);
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            find_resturent(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.bounceIn;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Sign In',
            style: TextStyle(color: Colors.black),
          ),

          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Comchop',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enter your Email or Password',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: " For sign in, Or ",
                      style: TextStyle(
                          color: Color.fromRGBO(134, 134, 134, 1),
                          fontSize: 16),
                    ),
                    TextSpan(
                      text: " Create new account. ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(252, 186, 24, 1),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => create_acount_screen()),
                          );
                        },
                    ),
                  ])),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(15),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            width: 334,
                            child: TextFormField(
                              controller: email,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter email";
                                } else if (!RegExp(r'\S+@\S+\.\S+')
                                    .hasMatch(value)) {
                                  return "Please enter a valid email address";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  suffixStyle: TextStyle(color: Colors.grey),
                                  prefixStyle: TextStyle(color: Colors.grey),
                                  hintText: 'Email',
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
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.red))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(15),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            width: 334,
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
                              controller: password,
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
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.red))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<api_calls>(builder: (context, provider, child) {
                    return Center(
                      child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                          height: 50,
                          width: 300,
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color: Color.fromRGBO(252, 186, 24, 1),
                              child: provider.isvalue
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Log In',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                    ),
                              onPressed: () {
                                setState(() {
                                  provider.isvalue = true;
                                });
                                provider.login(
                                    email.text, password.text, context);
                              })),
                    );
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    ' or',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      signIn(context);
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
                                "https://comchop.com/public/app/icon/google.png",
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
                    height: 35,
                  ),
                  Center(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      forgot_password_screen()),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Color.fromRGBO(134, 134, 134, 1),
                                fontSize: 16),
                          ))),
                ]),
          ),
        ));
  }

  Future signIn(BuildContext context) async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to Login")));
    } else {
      nam = user.displayName;
      ema = user.email;
      print(nam);
      print(ema);

      siin;
    }
    Future signs() async {
      final _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;

      var userHeader = {"Accept": "application/json"};
      final response = await http.get(
        Uri.parse(
          "https://comchop.com/api/googleLogin/$nam/$ema",
        ),
        headers: userHeader,
      );

      print(response.body);
      if (response.statusCode == 200) {
        var datas = (jsonDecode(response.body));
        var token = datas['data']['token'];
        final token1 = prefs.setString('new', token);
        final gettoken = prefs.getString('new');

        print(gettoken);
        var userid = datas['data']['user_id'];
        print(userid);
        print(datas);
        print(response.body);
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
                          builder: (BuildContext context) => gettoken == null
                              ? login_screen()
                              : find_resturent(sts: userid)),
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
                          builder: (BuildContext context) => login_screen()),
                    );
                  },
                ),
              ],
            );
          },
        );
      }

    }

    siin = signs();
  }
}
