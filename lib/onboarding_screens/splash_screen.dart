import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Comchop/onboarding_screens/onboarding.dart';
import 'package:Comchop/signin_register_screens/find_resturent_near_you.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  var token;
  Future token1() async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    token = gettoken;
  }

  @override
  void initState() {
    token1();
    print(token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'images/splash.png',
      splashIconSize: 200,
      nextScreen: token == null ? Onbording() : find_resturent(),
      splashTransition: SplashTransition.sizeTransition,
      backgroundColor: Color.fromRGBO(24, 193, 128, 1),
    );
  }
}
