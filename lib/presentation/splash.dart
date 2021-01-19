import 'package:flutter/material.dart';
import 'package:gomla/model/adsBaseModel.dart';
import 'package:gomla/network/apiCall.dart';
import 'package:gomla/data/constants.dart';


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
    if (ads.data.ads.desc != null)
      Navigator.pushReplacementNamed(context, '/${Constants.ADS}',
          arguments: {'${Constants.ADS}': ads.data.ads});
    else
      Navigator.pushReplacementNamed(context, '/${Constants.LANGUAGE}');
  }
}
