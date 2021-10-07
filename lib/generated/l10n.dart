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

  /// `{language, select, en {English} tr {Türkçe} other {-}}`
  String language_name(Object language) {
    return Intl.select(
      language,
      {
        'en': 'English',
        'tr': 'Türkçe',
        'other': '-',
      },
      name: 'language_name',
      desc: '',
      args: [language],
    );
  }

  /// `Pokémon`
  String get pokemon {
    return Intl.message(
      'Pokémon',
      name: 'pokemon',
      desc: '',
      args: [],
    );
  }

  /// `Project`
  String get project {
    return Intl.message(
      'Project',
      name: 'project',
      desc: '',
      args: [],
    );
  }

  /// `Project Pokémon`
  String get project_pokemon {
    return Intl.message(
      'Project Pokémon',
      name: 'project_pokemon',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Pokémons`
  String get pokemons {
    return Intl.message(
      'Pokémons',
      name: 'pokemons',
      desc: '',
      args: [],
    );
  }

  /// `No pokémon found!`
  String get no_pokemon_found {
    return Intl.message(
      'No pokémon found!',
      name: 'no_pokemon_found',
      desc: '',
      args: [],
    );
  }

  /// `Next Page`
  String get next_page {
    return Intl.message(
      'Next Page',
      name: 'next_page',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Pokémon`
  String get unknown_pokemon {
    return Intl.message(
      'Unknown Pokémon',
      name: 'unknown_pokemon',
      desc: '',
      args: [],
    );
  }

  /// `Pokémon detail not found!`
  String get pokemon_detail_not_found {
    return Intl.message(
      'Pokémon detail not found!',
      name: 'pokemon_detail_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Species`
  String get species {
    return Intl.message(
      'Species',
      name: 'species',
      desc: '',
      args: [],
    );
  }

  /// `Eggs`
  String get egg_groups {
    return Intl.message(
      'Eggs',
      name: 'egg_groups',
      desc: '',
      args: [],
    );
  }

  /// `Stats`
  String get stats {
    return Intl.message(
      'Stats',
      name: 'stats',
      desc: '',
      args: [],
    );
  }

  /// `Capture Rate`
  String get capture_rate {
    return Intl.message(
      'Capture Rate',
      name: 'capture_rate',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `lbs`
  String get lbs {
    return Intl.message(
      'lbs',
      name: 'lbs',
      desc: '',
      args: [],
    );
  }

  /// `inc`
  String get inc {
    return Intl.message(
      'inc',
      name: 'inc',
      desc: '',
      args: [],
    );
  }

  /// `Abilities`
  String get abilities {
    return Intl.message(
      'Abilities',
      name: 'abilities',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get pokemon_type {
    return Intl.message(
      'Type',
      name: 'pokemon_type',
      desc: '',
      args: [],
    );
  }

  /// `Next Evolutions`
  String get next_evolutions {
    return Intl.message(
      'Next Evolutions',
      name: 'next_evolutions',
      desc: '',
      args: [],
    );
  }

  /// `Pokédex`
  String get pokedex {
    return Intl.message(
      'Pokédex',
      name: 'pokedex',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Favorited Pokémon list is empty!`
  String get favorites_not_found {
    return Intl.message(
      'Favorited Pokémon list is empty!',
      name: 'favorites_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Pokédex is empty!`
  String get dex_is_empty {
    return Intl.message(
      'Pokédex is empty!',
      name: 'dex_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Catch`
  String get catch_pokemon {
    return Intl.message(
      'Catch',
      name: 'catch_pokemon',
      desc: '',
      args: [],
    );
  }

  /// `Okey`
  String get okey {
    return Intl.message(
      'Okey',
      name: 'okey',
      desc: '',
      args: [],
    );
  }

  /// `Please Wait!`
  String get please_wait {
    return Intl.message(
      'Please Wait!',
      name: 'please_wait',
      desc: '',
      args: [],
    );
  }

  /// `Catching Pokémon...`
  String get catching_pokemon {
    return Intl.message(
      'Catching Pokémon...',
      name: 'catching_pokemon',
      desc: '',
      args: [],
    );
  }

  /// `Successful`
  String get successful {
    return Intl.message(
      'Successful',
      name: 'successful',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `Pokémon catched.`
  String get pokemon_catched {
    return Intl.message(
      'Pokémon catched.',
      name: 'pokemon_catched',
      desc: '',
      args: [],
    );
  }

  /// `Pokémon catch failed.`
  String get pokemon_catch_failed {
    return Intl.message(
      'Pokémon catch failed.',
      name: 'pokemon_catch_failed',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `{themeMode, select, dark {Dark} light {Light} other {System}}`
  String theme_mode(Object themeMode) {
    return Intl.select(
      themeMode,
      {
        'dark': 'Dark',
        'light': 'Light',
        'other': 'System',
      },
      name: 'theme_mode',
      desc: '',
      args: [themeMode],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'tr'),
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
