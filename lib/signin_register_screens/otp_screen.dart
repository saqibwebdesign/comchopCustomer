import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Comchop/signin_register_screens/find_resturent_near_you.dart';
import 'package:Comchop/signin_register_screens/login_screen.dart';
import 'package:Comchop/signin_register_screens/reset_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:http/http.dart' as http;
import 'create_account_screen.dart';

class otp_screen extends StatefulWidget {
  const otp_screen({Key? key}) : super(key: key);

  @override
  State<otp_screen> createState() => _otp_screenState();
}

class _otp_screenState extends State<otp_screen> {
  final TextEditingController _otp = TextEditingController();
  bool visible = false;

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                'Verify Email',
                style: TextStyle(color: Colors.black, fontSize: 24),
              )),
              Center(
                  child: Text(
                'Enter the 6-Digit code sent  ',
                style: TextStyle(
                    color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
              )),
              Center(
                  child: Text(
                'to your mail',
                style: TextStyle(
                    color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
              )),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: PinCodeTextField(
                  controller: _otp,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  hintCharacter: "1",
                  pinTheme: PinTheme(
                    activeColor: Color.fromARGB(255, 209, 206, 206),
                    inactiveColor: Color.fromARGB(255, 209, 206, 206),
                    selectedColor: Color.fromARGB(255, 209, 206, 206),
                    disabledColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");

                    return true;
                  },
                  appContext: context,
                  onChanged: (String value) {},
                ),
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
                          'Continue',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          print(_otp.text);
                          otpver();
                        })),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "Didn’t receive code? ",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                TextSpan(
                  text: "Resend Again.",
                  style: TextStyle(
                    color: Color.fromRGBO(252, 186, 24, 1),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login_screen()),
                      );
                    },
                ),
              ])),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                'By Signing up you agree to our ',
                style: TextStyle(
                    color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
              )),
              Center(
                  child: Text(
                'Terms Conditions & Privacy Policy.',
                style: TextStyle(
                    color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
              )),
            ],
          ),
        ));
  }

  void otpver() async {
    final multipartRequest = new http.MultipartRequest(
        "POST", Uri.parse("https://comchop.com/api/userOtp"));

    multipartRequest.fields.addAll({
      "otp": _otp.text,
    });
    http.StreamedResponse response = await multipartRequest.send();

    var responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }
    if (responseString == '{"success":"Your code has been matched! "}') {
      var ab = _otp.text;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => reset_password(otpp: ab)),
      );
    } else {
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
                  "Invalid otp",
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
