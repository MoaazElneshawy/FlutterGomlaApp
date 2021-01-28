import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gomla/base/app_localization.dart';
import 'package:gomla/data/Provider.dart';
import 'package:gomla/data/constants.dart';
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
            supportedLocales: [Locale('en', ''), Locale('ar', '')],
            localizationsDelegates: [
              AppLocalization.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocal in supportedLocales) {
                if (supportedLocal.languageCode == locale.languageCode)
                  return supportedLocal;
              }
              return supportedLocales.first;
            },
            routes: {
              '/': (context) => SplashScreen(),
              '/${Constants.LANGUAGE}': (context) => LanguageScreen(),
              '/${Constants.ADS}': (context) => AdsScreen(),
              '/${Constants.HOME}': (context) => HomeScreen(),
            }));
  }
}
