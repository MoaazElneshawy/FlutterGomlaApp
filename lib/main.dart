import 'package:flutter/material.dart';
import 'package:gomla/data/Provider.dart';
import 'package:gomla/data/constants.dart';
import 'package:gomla/model/adsBaseModel.dart';
import 'package:gomla/presentation/ads.dart';
import 'package:gomla/presentation/home.dart';
import 'package:gomla/presentation/language.dart';
import 'package:gomla/presentation/splash/SplashManager.dart';
import 'package:gomla/presentation/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Provider(
        splashManager: SplashManager(),
        child: MaterialApp(
            routes: {
              '/': (context) => SplashScreen(),
              '/${Constants.LANGUAGE}': (context) => LanguageScreen(),
              '/${Constants.ADS}': (context) => AdsScreen(),
              '/${Constants.HOME}': (context) => HomeScreen(),
            }));
  }
}
