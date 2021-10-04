import 'dart:convert';

import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage._();
  static final Storage _instance = Storage._();
  static Storage get i => _instance;

  final String _dexKey = 'dex';
  final String _favoriteKey = 'fav';

  final List<String> _favorites = [];
  final Map<int, PokemonDetail> _dex = {};

  List<String> get favorites => _favorites;
  Map<int, PokemonDetail> get dex => _dex;

  Future<void> initializeStorage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? _favItems = prefs.getStringList(_favoriteKey);
    String? _dexItems = prefs.getString(_dexKey);
    if (_favItems != null) {
      _favorites.clear();
      _favorites.addAll(_favItems);
    }
    if (_dexItems != null) {
      Map<int, dynamic> _dexMap = json.decode(_dexItems);
      _dex.clear();
      _dexMap.forEach((key, value) {
        if (value is Map) {
          _dex.putIfAbsent(
              key, () => PokemonDetail.fromJson(value as Map<String, dynamic>));
        }
      });
    }
  }

  Future<bool> addToFavorite(String pokemonName) async {
    bool res = false;
    if (!_favorites.contains(pokemonName)) {
      _favorites.add(pokemonName);
      res = await _saveFavorite();
    }
    return Future.value(res);
  }

  Future<bool> addToDex(PokemonDetail pokemonDetail) async {
    _dex.putIfAbsent(
        DateTime.now().millisecondsSinceEpoch, () => pokemonDetail);
    bool res = await _saveDex();
    return Future.value(res);
  }

  Future<bool> removeFromFavorite(String pokemonName) async {
    bool res = false;
    if (_favorites.contains(pokemonName)) {
      _favorites.removeWhere((element) => element == pokemonName);
      res = await _saveFavorite();
    }
    return Future.value(res);
  }

  Future<bool> removeFromDex(int key) async {
    bool res = false;
    if (!_dex.containsKey(key)) {
      _dex.remove(key);
      res = await _saveDex();
    }
    return Future.value(res);
  }

  Future<bool> _saveFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setStringList(_favoriteKey, _favorites);
    return Future.value(res);
  }

  Future<bool> _saveDex() async {
    final prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setString(
        _dexKey,
        json.encode(Map<String, dynamic>.from(
            dex.map((key, value) => MapEntry(key, value.toJson())))));
    return Future.value(res);
  }
}
