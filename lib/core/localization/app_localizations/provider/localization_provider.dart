import 'package:flutter/material.dart';

import '../../../utils/app_consts.dart';
import '../../../utils/shared_preferences.dart';

class LocalizationProvider extends ChangeNotifier {
  LocalizationProvider() {
    _loadCurrentLanguage();
  }

  Locale _locale = Locale(
      AppConst.languages[0].languageCode!, AppConst.languages[0].countryCode);
  bool _isLtr = true;
  int? _languageIndex;

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  int? get languageIndex => _languageIndex;

  void setLanguage(Locale locale) {
    _locale = locale;
    _isLtr = _locale.languageCode != 'ar' && _locale.languageCode != 'ku';
    for (int index = 0; index < AppConst.languages.length; index++) {
      if (AppConst.languages[index].languageCode == locale.languageCode) {
        _languageIndex = index;
        break;
      }
    }
    _saveLanguage(_locale);
    notifyListeners();
  }

  _loadCurrentLanguage() async {
    _locale = Locale(
        SharedPreferenceHelper.getString(AppConst.languageCode) ??
            AppConst.languages[0].languageCode!,
        SharedPreferenceHelper.getString(AppConst.countryCode) ??
            AppConst.languages[0].countryCode);
    _isLtr = _locale.languageCode != 'ar' && _locale.languageCode != 'ku';
    for (int index = 0; index < AppConst.languages.length; index++) {
      if (AppConst.languages[index].languageCode == locale.languageCode) {
        _languageIndex = index;
        break;
      }
    }
    notifyListeners();
  }

  _saveLanguage(Locale locale) async {
    SharedPreferenceHelper.setString(
        AppConst.languageCode, locale.languageCode);
    SharedPreferenceHelper.setString(AppConst.countryCode, locale.countryCode!);
  }
}
