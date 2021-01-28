import 'package:flutter/material.dart';
import 'package:gomla/data/Provider.dart';
import 'package:gomla/model/adsBaseModel.dart';
import 'package:gomla/network/observer.dart';
import 'package:gomla/presentation/ads.dart';
import 'package:gomla/presentation/language.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var manager = Provider.of(context).splashManager;

    return Scaffold(
      backgroundColor: Color.fromRGBO(227, 6, 19, 100),
      body: Observer<AdsBaseModel>(
        stream: manager.callGetAds(),
        onSuccess: (context, snapshot) {
          if (snapshot.data.ads.desc != null)
            return AdsScreen(ads: snapshot.data.ads);
          else
            return LanguageScreen();
        },
        onLoading: (context) {
          return Center(child: Image(image: AssetImage('assets/logo.png')));
        },
      ),
    );
  }
}
