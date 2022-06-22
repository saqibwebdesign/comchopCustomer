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
              color: Colors.blue,
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
                        'Upon agreeing to LifeCapture Media’s User Agreement,'
                        ' account members agree to upload only their own and personally '
                        'shot video(s) to LifeCapture Media’s server for video transfer to user-specified '
                        'disc format and to the shipping of said video only to a user-specified address.  In so doing,'
                        ' the user asserts that any and all said uploaded video files do not meet any legal standard that'
                        ' would constitute license, copyright or trademark infringement, piracy, bootlegging, surveillance or'
                        ' anything constituting a violation of U.S. privacy rights/laws, material of any sexual or otherwise illicit '
                        'nature, or video(s) that contain any invocation or the advocating of hate, violence, or aggression in any form,'
                        ' or any material that would advance any political or religious narrative.  The user also acknowledges that '
                        'LifeCapture Media reserves the right to refuse to transfer video, or take part in any project that would meet '
                        'the legal standard to be classified as belonging to any category listed here.     ',
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
                                        'By proceeding I agree to LifeCapture Media’s\n',
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
