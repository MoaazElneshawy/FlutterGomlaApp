import 'package:flutter/material.dart';
import 'package:gomla/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class LanguageScreen extends StatelessWidget {
  bool isLanguageSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose the language',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RaisedButton(
                      color: Colors.white,
                      child: Text('English',
                          style: TextStyle(color: Colors.grey[600])),
                      onPressed: () async {
                        isLanguageSelected = await _setLocaleCode("en");
                        if (isLanguageSelected) {
                          Navigator.pushReplacementNamed(
                              context, '/${Constants.ROOT}');
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.grey[600])),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RaisedButton(
                      color: Colors.grey[600],
                      child: Text('عربي'),
                      textColor: Colors.white,
                      onPressed: () async {
                        isLanguageSelected = await _setLocaleCode("ar");
                        if (isLanguageSelected) {
                          Navigator.pushReplacementNamed(
                              context, '/${Constants.ROOT}');
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _setLocaleCode(String localeCode) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(Constants.LANGUAGE_IS_SELECTED, true);
    return pref.setString(Constants.SELECTED_LANGUAGE, localeCode);
  }
}
