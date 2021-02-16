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

  Future<HomeBaseModel> getHomeScreen() async {
    Response response = await get('http://grasse-kw.com/jomla/api/home_screen');
    var model = jsonDecode(response.body);
    HomeBaseModel homeBaseModel = HomeBaseModel.fromJson(model);
    return homeBaseModel;
  }
}
