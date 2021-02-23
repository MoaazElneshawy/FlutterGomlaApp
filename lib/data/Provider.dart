import 'package:flutter/material.dart';
import 'package:gomla/presentation/contactUs/contactUsManager.dart';
import 'package:gomla/presentation/home/homeManager.dart';
import 'package:gomla/presentation/splash/SplashManager.dart';

class Provider extends InheritedWidget {
  final SplashManager splashManager;
  final HomeManager homeManager;
  final ContactUsManager contactUsManager;

  Provider(
      {this.contactUsManager,
      this.splashManager,
      this.homeManager,
      Key key,
      Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static Provider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Provider>();
}
