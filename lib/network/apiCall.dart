import 'dart:convert';

import 'package:gomla/data/constants.dart';
import 'package:gomla/model/adsBaseModel.dart';
import 'package:gomla/model/contactUsInfoBaseModel.dart';
import 'package:gomla/model/homeBaseModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // contact us
  Future<ContactInfoBaseModel> getContactInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Response response =
        await get('http://grasse-kw.com/jomla/api/contact', headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Platform': 'ios',
      'Lang': pref.getString(Constants.SELECTED_LANGUAGE),
      'FirebaseToken': 'asdasd',
    });

    var json = jsonDecode(response.body);
    ContactInfoBaseModel model = ContactInfoBaseModel.fromJson(json);
    return model;
  }
}
