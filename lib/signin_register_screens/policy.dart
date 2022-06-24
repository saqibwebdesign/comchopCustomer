import 'package:Comchop/signin_register_screens/find_resturent_near_you.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class User_Aggrement_Screen extends StatefulWidget {
  final sts;
  const User_Aggrement_Screen({Key? key, this.sts}) : super(key: key);

  @override
  State<User_Aggrement_Screen> createState() => _User_Aggrement_ScreenState();
}

class _User_Aggrement_ScreenState extends State<User_Aggrement_Screen> {
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'User Agreement',
          style: TextStyle(
              fontFamily: 'calibri',
              color: Color.fromRGBO(252, 186, 24, 1),
              fontSize: 18,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'As a food delivery app, comchopp’s main function is to deliver food orders from merchants and safely to the customers. '
                        'Its most important feature is calculating delivery time from the time a customer orders. '
                        'For the app to be able to estimate the amount of time the delivery will take, a few things are considered.\n'
                        '1.The amount of preparation and packaging time to get the food ready. This information is provided by the merchants.\n'
                        '2.The amount of time* it takes the biker to leave his station, take the food from the restaurant and deliver it to the customer.\n'
                        'time: Calculation of approximate delivery time depends on three things. \n'
                        '1.The distance between a biker and the merchant.\n'
                        '2.The distance between a merchant and the customer.\n'
                        '3.Traffic between the merchant and biker.\n'
                        '4.Traffic between the merchant and the customer.\n'
                        'These distances are only attained if users provide access to their live location while using the app. '
                        'This location sharing by Users is for three distinct reasons, all pertaining to the time and quality of the deliveries. '
                        'Customers provide their current location so that Comchopp can recommend the nearest restaurants as well as calculate and display the delivery time needed. ',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            textBaseline: TextBaseline.alphabetic),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0.5),
                              child: Transform.scale(
                                scale: 0.8,
                                child: Container(
                                  height: 19.0,
                                  width: 26.0,
                                  child: Checkbox(
                                      focusColor:
                                          Color.fromRGBO(252, 186, 24, 1),
                                      hoverColor:
                                          Color.fromRGBO(252, 186, 24, 1),
                                      checkColor:
                                          Color.fromRGBO(252, 186, 24, 1),
                                      activeColor: Colors.white,
                                      value: agree,
                                      onChanged: (value) {
                                        setState(() {
                                          agree = value ?? false;
                                        });
                                      }),
                                ),
                              ),
                            ),
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'By proceeding I agree to Comchopp’s\n',
                                    style: TextStyle(
                                        fontSize: 13.57, color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: "User Agreement ",
                                    style: TextStyle(
                                      color: Color.fromRGBO(252, 186, 24, 1),
                                      //  fontSize: 13.57
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigator.push(
                                        //   context,
                                        //   CupertinoPageRoute(
                                        //       builder: (context) =>
                                        //           User_Aggrement_Screen()),
                                        // );
                                      },
                                  ),
                                  TextSpan(
                                      text: "and",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 13.57)),
                                  TextSpan(
                                    text: " Privacy Policy ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(252, 186, 24, 1),
                                        fontSize: 13),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                ]))
                          ]),
                      SizedBox(
                        height: 22.0,
                      ),
                      AnimatedContainer(
                          duration: Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                          height: 50,
                          width: 300,
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color: Color.fromRGBO(252, 186, 24, 1),
                              child: Text(
                                'Agree',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: agree
                                  ? () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                find_resturent(
                                                    sts: widget.sts)),
                                      );
                                    }
                                  : null)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
