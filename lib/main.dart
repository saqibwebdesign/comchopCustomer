import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Comchop/onboarding_screens/splash_screen.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:Comchop/provider/cartprovider.dart';
import 'package:Comchop/provider/locations.dart';
import 'package:Comchop/signin_register_screens/find_resturent_near_you.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  //i
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences aa = await SharedPreferences.getInstance();
  final gettoken = aa.getString('new');
  print(gettoken);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => cartprovider()),
        ChangeNotifierProvider(create: (_) => api_calls()),
        ChangeNotifierProvider(create: (_) => location_provider()),
      ],
      child: MaterialApp(
          title: 'Comchop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.black,
              secondary: Colors.black,
            ),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'SF-pro',
            focusColor: Color.fromRGBO(252, 186, 24, 1),
          ),
          home: gettoken == null ? IntroPage() : find_resturent()),
    ),
  );
}
