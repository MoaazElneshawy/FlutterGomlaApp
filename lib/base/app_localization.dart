import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gomla/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalization {
  Locale locale;

  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();

  Map<String, String> _localizedString;

  Future load() async {
    String jsonString =
        await rootBundle.loadString('language/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedString =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) => _localizedString[key];

   Future checkLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String localeCode = prefs.getString(Constants.SELECTED_LANGUAGE);
    if (localeCode != null) {
      locale = Locale(localeCode);
    }
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = new AppLocalization(locale);
    await appLocalization.checkLocale();
    await appLocalization.load();
    return appLocalization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) => false;
}
