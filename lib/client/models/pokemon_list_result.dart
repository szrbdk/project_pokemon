// To parse this JSON data, do
//
//     final pokemonListResult = pokemonListResultFromJson(jsonString);

import 'dart:convert';

PokemonListResult pokemonListResultFromJson(String str) =>
    PokemonListResult.fromJson(json.decode(str));

String pokemonListResultToJson(PokemonListResult data) =>
    json.encode(data.toJson());

class PokemonListResult {
  PokemonListResult({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  String? previous;
  List<SimplePokemonModel>? results;

  factory PokemonListResult.fromJson(Map<String, dynamic> json) =>
      PokemonListResult(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? null
            : List<SimplePokemonModel>.from(
                json["results"].map((x) => SimplePokemonModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class SimplePokemonModel {
  SimplePokemonModel({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory SimplePokemonModel.fromJson(Map<String, dynamic> json) =>
      SimplePokemonModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
