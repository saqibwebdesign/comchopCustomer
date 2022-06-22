import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Comchop/signin_register_screens/create_account_screen.dart';
import 'package:Comchop/signin_register_screens/login_screen.dart';

class reset_email_screen extends StatelessWidget {
  const reset_email_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
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
                    'Reset email sent',
                    style: TextStyle(color: Colors.black, fontSize: 34),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We have sent a instructions email to ',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: "Nawfazim@icloud.com ",
                      style: TextStyle(
                          color: Color.fromRGBO(134, 134, 134, 1),
                          fontSize: 16),
                    ),
                    TextSpan(
                      text: "Having problem? ",
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
                  Center(
                    child: Container(
                        height: 40,
                        width: 160,
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color.fromRGBO(252, 186, 24, 1),
                            child: Text(
                              'Send Again',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        create_acount_screen()),
                              );
                            })),
                  ),
                ]),
          ),
        ));
  }
}
