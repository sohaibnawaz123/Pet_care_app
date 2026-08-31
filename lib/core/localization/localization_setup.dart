
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pet_care_app/core/localization/localization.dart';

class LocalizationSetup {
  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    Localization.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static Locale localeResolutionCallback(
    Locale? locale,
    Iterable<Locale>? supportedLocales,
  ) {
    final locales = supportedLocales ?? LocalizationSetup.supportedLocales;
    for (final supportedLocale in locales) {
      if (supportedLocale.languageCode == locale?.languageCode &&
          supportedLocale.countryCode == locale?.countryCode) {
        return supportedLocale;
      }
    }
    return locales.first;
  }
}
