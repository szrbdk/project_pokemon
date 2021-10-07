// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
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
  String get localeName => 'tr';

  static String m1(themeMode) => "${Intl.select(themeMode, {
            'dark': 'Koyu',
            'light': 'Açık',
            'other': 'Sistem',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "abilities": MessageLookupByLibrary.simpleMessage("Yetenekler"),
        "capture_rate": MessageLookupByLibrary.simpleMessage("Yakalama Oranı"),
        "catch_pokemon": MessageLookupByLibrary.simpleMessage("Yakala"),
        "catching_pokemon":
            MessageLookupByLibrary.simpleMessage("Pokémon yakalanıyor..."),
        "dex_is_empty": MessageLookupByLibrary.simpleMessage("Pokédex boş!"),
        "egg_groups": MessageLookupByLibrary.simpleMessage("Yumurtalar"),
        "failed": MessageLookupByLibrary.simpleMessage("Başarısız"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favoriler"),
        "favorites_not_found":
            MessageLookupByLibrary.simpleMessage("Favori Pokémon listesi boş!"),
        "height": MessageLookupByLibrary.simpleMessage("Boy"),
        "inc": MessageLookupByLibrary.simpleMessage("inc"),
        "language": MessageLookupByLibrary.simpleMessage("Dil"),
        "lbs": MessageLookupByLibrary.simpleMessage("lbs"),
        "next_evolutions":
            MessageLookupByLibrary.simpleMessage("Sonraki Evrimler"),
        "next_page": MessageLookupByLibrary.simpleMessage("Sonraki Sayfa"),
        "no_pokemon_found":
            MessageLookupByLibrary.simpleMessage("Pokémon bulunamadı!"),
        "okey": MessageLookupByLibrary.simpleMessage("Tamam"),
        "please_wait": MessageLookupByLibrary.simpleMessage("Lütfen Bekleyin!"),
        "pokedex": MessageLookupByLibrary.simpleMessage("Pokédex"),
        "pokemon": MessageLookupByLibrary.simpleMessage("Pokémon"),
        "pokemon_catch_failed":
            MessageLookupByLibrary.simpleMessage("Pokémon yakalanamadı."),
        "pokemon_catched":
            MessageLookupByLibrary.simpleMessage("Pokémon yakalandı."),
        "pokemon_detail_not_found":
            MessageLookupByLibrary.simpleMessage("Pokémon detayı bulunamadı!"),
        "pokemon_release_failed":
            MessageLookupByLibrary.simpleMessage("Pokémon bırakılamadı."),
        "pokemon_released":
            MessageLookupByLibrary.simpleMessage("Pokémon bırakıldı."),
        "pokemon_releasing":
            MessageLookupByLibrary.simpleMessage("Pokémon bırakılıyor..."),
        "pokemon_type": MessageLookupByLibrary.simpleMessage("Türü"),
        "pokemons": MessageLookupByLibrary.simpleMessage("Pokémonlar"),
        "project": MessageLookupByLibrary.simpleMessage("Proje"),
        "project_pokemon":
            MessageLookupByLibrary.simpleMessage("Proje Pokémon"),
        "release_pokemon":
            MessageLookupByLibrary.simpleMessage("Serbest Bırak"),
        "settings": MessageLookupByLibrary.simpleMessage("Ayarlar"),
        "species": MessageLookupByLibrary.simpleMessage("Türler"),
        "stats": MessageLookupByLibrary.simpleMessage("İstatikler"),
        "successful": MessageLookupByLibrary.simpleMessage("Başarılı"),
        "theme": MessageLookupByLibrary.simpleMessage("Tema"),
        "theme_mode": m1,
        "unknown_pokemon":
            MessageLookupByLibrary.simpleMessage("Bilinmeyen Pokémon"),
        "weight": MessageLookupByLibrary.simpleMessage("Ağırlık")
      };
}
