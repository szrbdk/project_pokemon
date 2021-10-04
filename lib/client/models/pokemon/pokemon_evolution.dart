// To parse this JSON data, do
//
//     final pokemonEvolution = pokemonEvolutionFromJson(jsonString);

import 'dart:convert';

import 'package:project_pokemon/client/models/base_response_model/named_api_response.dart';

PokemonEvolution pokemonEvolutionFromJson(String str) =>
    PokemonEvolution.fromJson(json.decode(str));

String pokemonEvolutionToJson(PokemonEvolution data) =>
    json.encode(data.toJson());

class PokemonEvolution {
  PokemonEvolution({
    this.chain,
    this.id,
  });

  Chain? chain;
  int? id;

  factory PokemonEvolution.fromJson(Map<String, dynamic> json) =>
      PokemonEvolution(
        chain: json["chain"] == null ? null : Chain.fromJson(json["chain"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "chain": chain == null ? null : chain!.toJson(),
        "id": id,
      };
}

class Chain {
  Chain({
    this.evolvesTo,
    this.isBaby,
    this.species,
  });

  List<Chain>? evolvesTo;
  bool? isBaby;
  NamedApiResponse? species;

  factory Chain.fromJson(Map<String, dynamic> json) => Chain(
        evolvesTo: json["evolves_to"] == null
            ? null
            : List<Chain>.from(
                json["evolves_to"]!.map((x) => Chain.fromJson(x))),
        isBaby: json["is_baby"],
        species: json["species"] == null
            ? null
            : NamedApiResponse.fromJson(json["species"]),
      );

  Map<String, dynamic> toJson() => {
        "evolves_to": evolvesTo == null
            ? null
            : List<dynamic>.from(evolvesTo!.map((x) => x.toJson())),
        "is_baby": isBaby,
        "species": species == null ? null : species!.toJson(),
      };
}
