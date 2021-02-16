import 'dart:convert';

import 'package:gomla/model/adsBaseModel.dart';
import 'package:gomla/model/homeBaseModel.dart';
import 'package:http/http.dart';

class ApiCall {
  Future<AdsBaseModel> getAds() async {
    Response response = await get('http://grasse-kw.com/jomla/api/ads');
    var model = jsonDecode(response.body);
    AdsBaseModel adModel = AdsBaseModel.fromJson(model);
    return adModel;
  }

  Future<HomeBaseModel> getHomeScreen(String lang) async {
    Response response =
        await get('http://grasse-kw.com/jomla/api/home_screen', headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Platform': 'ios',
      'Lang': lang,
      'FirebaseToken': 'asdasd',
    });
    var model = jsonDecode(response.body);
    HomeBaseModel homeBaseModel = HomeBaseModel.fromJson(model);
    return homeBaseModel;
  }
}
