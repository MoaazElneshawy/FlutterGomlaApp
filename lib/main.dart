import 'package:flutter/material.dart';
import 'package:gomla/data/constants.dart';
import 'package:gomla/presentation/ads.dart';
import 'package:gomla/presentation/home.dart';
import 'package:gomla/presentation/language.dart';
import 'package:gomla/presentation/splash.dart';

void main() {
  runApp(MaterialApp(routes: {
    '/': (context) => SplashScreen(),
    '/${Constants.LANGUAGE}': (context) => LanguageScreen(),
    '/${Constants.ADS}': (context) => AdsScreen(),
    '/${Constants.HOME}': (context) => HomeScreen(),
  }));
}
