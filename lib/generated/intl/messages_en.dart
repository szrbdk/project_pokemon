// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(language) => "${Intl.select(language, {
            'en': 'English',
            'tr': 'Türkçe',
            'other': '-',
          })}";

  static String m1(themeMode) => "${Intl.select(themeMode, {
            'dark': 'Dark',
            'light': 'Light',
            'other': 'System',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "abilities": MessageLookupByLibrary.simpleMessage("Abilities"),
        "capture_rate": MessageLookupByLibrary.simpleMessage("Capture Rate"),
        "catch_pokemon": MessageLookupByLibrary.simpleMessage("Catch"),
        "catching_pokemon":
            MessageLookupByLibrary.simpleMessage("Catching Pokémon..."),
        "dex_is_empty":
            MessageLookupByLibrary.simpleMessage("Pokédex is empty!"),
        "egg_groups": MessageLookupByLibrary.simpleMessage("Eggs"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "failed": MessageLookupByLibrary.simpleMessage("Failed"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
        "favorites_not_found": MessageLookupByLibrary.simpleMessage(
            "Favorited Pokémon list is empty!"),
        "height": MessageLookupByLibrary.simpleMessage("Height"),
        "inc": MessageLookupByLibrary.simpleMessage("inc"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "language_name": m0,
        "lbs": MessageLookupByLibrary.simpleMessage("lbs"),
        "next_evolutions":
            MessageLookupByLibrary.simpleMessage("Next Evolutions"),
        "next_page": MessageLookupByLibrary.simpleMessage("Next Page"),
        "no_pokemon_found":
            MessageLookupByLibrary.simpleMessage("No pokémon found!"),
        "okey": MessageLookupByLibrary.simpleMessage("Okey"),
        "please_wait": MessageLookupByLibrary.simpleMessage("Please Wait!"),
        "pokedex": MessageLookupByLibrary.simpleMessage("Pokédex"),
        "pokemon": MessageLookupByLibrary.simpleMessage("Pokémon"),
        "pokemon_catch_failed":
            MessageLookupByLibrary.simpleMessage("Pokémon catch failed."),
        "pokemon_catched":
            MessageLookupByLibrary.simpleMessage("Pokémon catched."),
        "pokemon_detail_not_found":
            MessageLookupByLibrary.simpleMessage("Pokémon detail not found!"),
        "pokemon_release_failed":
            MessageLookupByLibrary.simpleMessage("Pokémon release failed."),
        "pokemon_released":
            MessageLookupByLibrary.simpleMessage("Pokémon released."),
        "pokemon_releasing":
            MessageLookupByLibrary.simpleMessage("Pokémon releasing..."),
        "pokemon_type": MessageLookupByLibrary.simpleMessage("Type"),
        "pokemons": MessageLookupByLibrary.simpleMessage("Pokémons"),
        "project": MessageLookupByLibrary.simpleMessage("Project"),
        "project_pokemon":
            MessageLookupByLibrary.simpleMessage("Project Pokémon"),
        "release_pokemon": MessageLookupByLibrary.simpleMessage("Release"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "species": MessageLookupByLibrary.simpleMessage("Species"),
        "stats": MessageLookupByLibrary.simpleMessage("Stats"),
        "successful": MessageLookupByLibrary.simpleMessage("Successful"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "theme_mode": m1,
        "unknown_pokemon":
            MessageLookupByLibrary.simpleMessage("Unknown Pokémon"),
        "weight": MessageLookupByLibrary.simpleMessage("Weight")
      };
}
