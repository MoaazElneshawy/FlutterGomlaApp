import 'package:flutter/material.dart';
import 'package:gomla/presentation/splash/SplashManager.dart';

class Provider extends InheritedWidget {
  final SplashManager splashManager;

  Provider({this.splashManager, Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static Provider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Provider>();
}
