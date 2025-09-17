import 'package:flutter/material.dart';
import 'package:my_localization/src/localization_service.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  LocaleProvider() {
    _loadLocale();
  }

  void _loadLocale() {
    _locale = LocalizationService.getLocale();
    notifyListeners();
  }

  void setLocale(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      LocalizationService.saveLocale(locale);
      notifyListeners();
    }
  }
}
