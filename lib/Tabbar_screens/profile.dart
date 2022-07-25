import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Comchop/Tabbar_screens/orders.dart';
import 'package:Comchop/details_screen/add_social_accounts.dart';
import 'package:Comchop/details_screen/change_password_screen.dart';
import 'package:Comchop/details_screen/payments_screen.dart';
import 'package:Comchop/details_screen/profile_settings_details_screen.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:Comchop/signin_register_screens/find_resturent_near_you.dart';
import 'package:Comchop/signin_register_screens/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch = Uri.parse(
        'https://play.google.com/store/apps/details?id=com.divsnpixel.comchop');
    final provider = Provider.of<api_calls>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Account Settings',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Update your settings like Passwords,\nProfile edit etc.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(134, 134, 134, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              profile_details_screen()),
                    );
                  },
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Icon(Icons.person, size: 20, color: Colors.orange),
                  ),
                  subtitle: Text(
                    'update Details',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  title: Text(
                    'Profile Information',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => change_password()),
                    );
                  },
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Icon(Icons.lock, size: 20, color: Colors.orange),
                  ),
                  subtitle: Text(
                    'Change your password',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  title: Text(
                    'Change Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              Container(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => orders()),
                    );
                  },
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Icon(Icons.lock, size: 20, color: Colors.orange),
                  ),
                  subtitle: Text(
                    'See your previous order here',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  title: Text(
                    'Order History',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _launched = _launchInBrowser(toLaunch);
                  });
                },
                child: Container(
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.orange,
                      ),
                    ),
                    subtitle: Text(
                      'Rate us playstore, appstore',
                      style: TextStyle(
                          color: Color.fromRGBO(134, 134, 134, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    title: Text(
                      'Rate Us',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: ListTile(
                  onTap: () {
                    Widget cancelButton = TextButton(
                      child: Text(
                        "Cancel",
                        style:
                            TextStyle(color: Color.fromRGBO(252, 186, 24, 1)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    );
                    Widget continueButton = TextButton(
                      child: Text("Sign Out"),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  login_screen()),
                          (route) => false,
                        );
                      },
                    );

                    AlertDialog alert = AlertDialog(
                      title: Text("Logout"),
                      content: Text("Do you want to Log out?"),
                      actions: [
                        cancelButton,
                        // continueButton,
                        Container(
                          height: 40,
                          width: 110,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Color.fromRGBO(252, 186, 24, 1),
                            child: Text(
                              'Log out',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              provider.logut(context);
                              GoogleSignIn().disconnect();
                            },
                          ),
                        ),
                      ],
                    );

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.logout,
                      color: Colors.orange,
                      size: 20,
                    ),
                  ),
                  subtitle: Text(
                    'Log a user out',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  title: Text(
                    'Log out',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
