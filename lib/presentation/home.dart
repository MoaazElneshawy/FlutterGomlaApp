import 'package:flutter/material.dart';
import 'package:gomla/base/app_localization.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppLocalization locale = AppLocalization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.translate('main_title')),
      ),
    );
  }
}
