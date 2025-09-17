import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class MyLocalization {
  //configure supported locales
  static const supportedLocales = [Locale('en'), Locale('hi')];

  //      AppLocalizations.delegate, missing at first
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  //configure default locale
  static const defaultLocale = Locale('en');

  // Dummy method to get translation for a key
  static String translate(String key) {
    // In real scenario, load from arb or JSON
    final _translations = {
      'en': {'hello': 'Hello', 'welcome': 'Welcome to my app'},
      'hi': {'hello': 'नमस्ते', 'welcome': 'मेरे ऐप में आपका स्वागत है'},
    };

    String localeCode = Intl.getCurrentLocale();
    return _translations[localeCode]?[key] ?? _translations['en']![key] ?? key;
  }
}
