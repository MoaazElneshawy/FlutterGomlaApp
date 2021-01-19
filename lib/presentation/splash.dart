import 'package:flutter/material.dart';
import 'package:gomla/model/adsBaseModel.dart';
import 'package:gomla/network/apiCall.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var api = ApiCall();
  AdsBaseModel ads;

  @override
  void initState() {
    super.initState();
    getAds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(227, 6, 19, 100),
      body: Center(
        child: Image(image: AssetImage('assets/logo.png')),
      ),
    );
  }

  void getAds() async {
    ads = await api.getAds();
    if (ads.status == 1)
      Navigator.pushReplacementNamed(context, '/ads', arguments: {'ads': ads});
    else
      Navigator.pushReplacementNamed(context, '/home');
  }
}
