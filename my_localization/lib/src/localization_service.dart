import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_localization/src/locale_adapter.dart';

class LocalizationService {
  static const String _boxName = 'localeBox';
  static const String _localeKey = 'locale';

  /// Initializes Hive and opens the locale box.
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(LocaleAdapter());
    await Hive.openBox<Locale>(_boxName);
  }

  /// Saves the given [locale] to Hive.
  static Future<void> saveLocale(Locale locale) async {
    final box = Hive.box<Locale>(_boxName);
    await box.put(_localeKey, locale);
  }

  /// Retrieves the saved locale from Hive.
  ///
  /// Returns the saved [Locale] or `null` if no locale is saved.
  static Locale? getLocale() {
    final box = Hive.box<Locale>(_boxName);
    return box.get(_localeKey);
  }
}
