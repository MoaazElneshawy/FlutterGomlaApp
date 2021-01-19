import 'package:flutter/material.dart';
import 'package:gomla/presentation/ads.dart';
import 'package:gomla/presentation/home.dart';
import 'package:gomla/presentation/splash.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => SplashScreen(),
      '/ads': (context) => AdsScreen(),
      '/home': (context) => HomeScreen(),
    },
    theme: ThemeData(
      primaryColor: Colors.red[700],
    ),
  ));
}
