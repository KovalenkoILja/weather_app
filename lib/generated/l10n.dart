// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Weather app `
  String get app_name {
    return Intl.message(
      'Weather app ',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `You are at `
  String get location {
    return Intl.message(
      'You are at ',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Last Updated at `
  String get last_update {
    return Intl.message(
      'Last Updated at ',
      name: 'last_update',
      desc: '',
      args: [],
    );
  }

  /// `Temperature `
  String get temp {
    return Intl.message(
      'Temperature ',
      name: 'temp',
      desc: '',
      args: [],
    );
  }

  /// `Day temperature `
  String get temp_day {
    return Intl.message(
      'Day temperature ',
      name: 'temp_day',
      desc: '',
      args: [],
    );
  }

  /// `Min daily temperature `
  String get temp_min {
    return Intl.message(
      'Min daily temperature ',
      name: 'temp_min',
      desc: '',
      args: [],
    );
  }

  /// `Max daily temperature `
  String get temp_max {
    return Intl.message(
      'Max daily temperature ',
      name: 'temp_max',
      desc: '',
      args: [],
    );
  }

  /// `Night temperature `
  String get temp_night {
    return Intl.message(
      'Night temperature ',
      name: 'temp_night',
      desc: '',
      args: [],
    );
  }

  /// `Evening temperature `
  String get temp_eve {
    return Intl.message(
      'Evening temperature ',
      name: 'temp_eve',
      desc: '',
      args: [],
    );
  }

  /// `Morning temperature `
  String get temp_morn {
    return Intl.message(
      'Morning temperature ',
      name: 'temp_morn',
      desc: '',
      args: [],
    );
  }

  /// `Feels like `
  String get feels_like {
    return Intl.message(
      'Feels like ',
      name: 'feels_like',
      desc: '',
      args: [],
    );
  }

  /// `Switch display mode`
  String get display_mode {
    return Intl.message(
      'Switch display mode',
      name: 'display_mode',
      desc: '',
      args: [],
    );
  }

  /// `By the hours`
  String get by_the_hour {
    return Intl.message(
      'By the hours',
      name: 'by_the_hour',
      desc: '',
      args: [],
    );
  }

  /// `By days`
  String get by_days {
    return Intl.message(
      'By days',
      name: 'by_days',
      desc: '',
      args: [],
    );
  }

  /// `Humidity `
  String get humidity {
    return Intl.message(
      'Humidity ',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `Pressure  `
  String get pressure {
    return Intl.message(
      'Pressure  ',
      name: 'pressure',
      desc: '',
      args: [],
    );
  }

  /// `Cloudiness `
  String get clouds {
    return Intl.message(
      'Cloudiness ',
      name: 'clouds',
      desc: '',
      args: [],
    );
  }

  /// `Dew point  `
  String get dew_point {
    return Intl.message(
      'Dew point  ',
      name: 'dew_point',
      desc: '',
      args: [],
    );
  }

  /// `Midday UV index `
  String get uvi {
    return Intl.message(
      'Midday UV index ',
      name: 'uvi',
      desc: '',
      args: [],
    );
  }

  /// `Visibility `
  String get visibility {
    return Intl.message(
      'Visibility ',
      name: 'visibility',
      desc: '',
      args: [],
    );
  }

  /// `Wind speed `
  String get wind_speed {
    return Intl.message(
      'Wind speed ',
      name: 'wind_speed',
      desc: '',
      args: [],
    );
  }

  /// `Wind direction `
  String get wind_deg {
    return Intl.message(
      'Wind direction ',
      name: 'wind_deg',
      desc: '',
      args: [],
    );
  }

  /// `Sunrise time `
  String get sunrise {
    return Intl.message(
      'Sunrise time ',
      name: 'sunrise',
      desc: '',
      args: [],
    );
  }

  /// `Sunset time `
  String get sunset {
    return Intl.message(
      'Sunset time ',
      name: 'sunset',
      desc: '',
      args: [],
    );
  }

  /// `Error! There are no cache and no Internet!`
  String get error_no_cache_no_inet {
    return Intl.message(
      'Error! There are no cache and no Internet!',
      name: 'error_no_cache_no_inet',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
