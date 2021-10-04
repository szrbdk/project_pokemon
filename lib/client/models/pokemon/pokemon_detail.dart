// To parse this JSON data, do
//
//     final pokemonDetail = pokemonDetailFromJson(jsonString);

import 'dart:convert';

import 'package:project_pokemon/client/models/base_response_model/named_api_response.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_ability.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_evolution.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_species.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_sprite.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_stat.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_type.dart';

PokemonDetail pokemonDetailFromJson(String str) =>
    PokemonDetail.fromJson(json.decode(str));

String pokemonDetailToJson(PokemonDetail data) => json.encode(data.toJson());

class PokemonDetail {
  PokemonDetail({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.height,
    this.id,
    this.name,
    this.order,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
    this.pokemonEvolution,
    this.pokemonSpecies,
  });

  List<PokemonAbility>? abilities;
  int? baseExperience;
  List<NamedApiResponse>? forms;
  int? height;
  int? id;
  String? name;
  int? order;
  NamedApiResponse? species;
  PokemonSprites? sprites;
  List<PokemonStat>? stats;
  List<PokemonType>? types;
  int? weight;

  PokemonSpecies? pokemonSpecies;
  PokemonEvolution? pokemonEvolution;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => PokemonDetail(
        abilities: json["abilities"] == null
            ? null
            : List<PokemonAbility>.from(
                json["abilities"].map((x) => PokemonAbility.fromJson(x))),
        baseExperience: json["base_experience"],
        forms: json["forms"] == null
            ? null
            : List<NamedApiResponse>.from(
                json["forms"].map((x) => NamedApiResponse.fromJson(x))),
        height: json["height"],
        id: json["id"],
        name: json["name"],
        order: json["order"],
        species: json["species"] == null
            ? null
            : NamedApiResponse.fromJson(json["species"]),
        sprites: json["sprites"] == null
            ? null
            : PokemonSprites.fromJson(json["sprites"]),
        stats: json["stats"] == null
            ? null
            : List<PokemonStat>.from(
                json["stats"].map((x) => PokemonStat.fromJson(x))),
        types: json["types"] == null
            ? null
            : List<PokemonType>.from(
                json["types"].map((x) => PokemonType.fromJson(x))),
        weight: json["weight"],
        pokemonSpecies: json["pokemonSpecies"] == null
            ? null
            : PokemonSpecies.fromJson(json["pokemonSpecies"]),
        pokemonEvolution: json["pokemonEvolution"] == null
            ? null
            : PokemonEvolution.fromJson(json["pokemonEvolution"]),
      );

  Map<String, dynamic> toJson() => {
        "abilities": abilities == null
            ? null
            : List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "forms": forms == null
            ? null
            : List<dynamic>.from(forms!.map((x) => x.toJson())),
        "height": height,
        "id": id,
        "name": name,
        "order": order,
        "species": species == null ? null : species!.toJson(),
        "sprites": sprites == null ? null : sprites!.toJson(),
        "stats": stats == null
            ? null
            : List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": types == null
            ? null
            : List<dynamic>.from(types!.map((x) => x.toJson())),
        "weight": weight,
        "pokemonSpecies":
            pokemonSpecies == null ? null : pokemonSpecies!.toJson(),
        "pokemonEvolution":
            pokemonEvolution == null ? null : pokemonEvolution!.toJson(),
      };
}
