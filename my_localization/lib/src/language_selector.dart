import 'package:flutter/material.dart';
import 'package:my_localization/l10n/app_localizations.dart';
import 'package:my_localization/src/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.language),
      onPressed: () {
        _showLanguageDialog(context);
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(AppLocalizations.of(context)!.myLocalization_selectLanguage),
          children: AppLocalizations.supportedLocales.map((locale) {
            return SimpleDialogOption(
              onPressed: () {
                localeProvider.setLocale(locale);
                Navigator.pop(context);
              },
              child: Text(locale.languageCode.toUpperCase()),
            );
          }).toList(),
        );
      },
    );
  }
}
