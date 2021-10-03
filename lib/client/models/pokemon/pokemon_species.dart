import 'dart:convert';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:project_pokemon/client/models/base_response_model/named_api_response.dart';

PokemonSpecies pokemonSpeciesFromJson(String str) =>
    PokemonSpecies.fromJson(json.decode(str));

String pokemonSpeciesToJson(PokemonSpecies data) => json.encode(data.toJson());

class PokemonSpecies {
  PokemonSpecies({
    this.baseHappiness,
    this.captureRate,
    this.eggGroups,
    this.evolutionChain,
    this.flavorTextEntries,
    this.formsSwitchable,
    this.genderRate,
    this.hasGenderDifferences,
    this.hatchCounter,
    this.id,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    this.name,
    this.order,
    this.palParkEncounters,
    this.shape,
    this.varieties,
  });

  int? baseHappiness;
  int? captureRate;
  List<NamedApiResponse>? eggGroups;
  NamedApiResponse? evolutionChain;
  List<FlavorTextEntry>? flavorTextEntries;
  bool? formsSwitchable;
  int? genderRate;
  bool? hasGenderDifferences;
  int? hatchCounter;
  int? id;
  bool? isBaby;
  bool? isLegendary;
  bool? isMythical;
  String? name;
  int? order;
  List<PalParkEncounter>? palParkEncounters;
  NamedApiResponse? shape;
  List<Variety>? varieties;

  String? getFlavorText(String language) {
    FlavorTextEntry? entry = flavorTextEntries?.firstWhereOrNull(
            (element) => element.language!.name == language) ??
        flavorTextEntries?.first;
    return entry?.flavorText?.replaceAll('\n', ' ');
  }

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => PokemonSpecies(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        eggGroups: json["egg_groups"] == null
            ? null
            : List<NamedApiResponse>.from(
                json["egg_groups"].map((x) => NamedApiResponse.fromJson(x))),
        evolutionChain: json["evolution_chain"] == null
            ? null
            : NamedApiResponse.fromJson(json["evolution_chain"]),
        flavorTextEntries: json["flavor_text_entries"] == null
            ? null
            : List<FlavorTextEntry>.from(json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        formsSwitchable: json["forms_switchable"],
        genderRate: json["gender_rate"],
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        order: json["order"],
        palParkEncounters: json["pal_park_encounters"] == null
            ? null
            : List<PalParkEncounter>.from(json["pal_park_encounters"]
                .map((x) => PalParkEncounter.fromJson(x))),
        shape: json["shape"] == null
            ? null
            : NamedApiResponse.fromJson(json["shape"]),
        varieties: json["varieties"] == null
            ? null
            : List<Variety>.from(
                json["varieties"].map((x) => Variety.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_happiness": baseHappiness,
        "capture_rate": captureRate,
        "egg_groups": eggGroups == null
            ? null
            : List<dynamic>.from(eggGroups!.map((x) => x.toJson())),
        "evolution_chain":
            evolutionChain == null ? null : evolutionChain!.toJson(),
        "flavor_text_entries": flavorTextEntries == null
            ? null
            : List<dynamic>.from(flavorTextEntries!.map((x) => x.toJson())),
        "forms_switchable": formsSwitchable,
        "gender_rate": genderRate,
        "has_gender_differences": hasGenderDifferences,
        "hatch_counter": hatchCounter,
        "id": id,
        "is_baby": isBaby,
        "is_legendary": isLegendary,
        "is_mythical": isMythical,
        "name": name,
        "order": order,
        "pal_park_encounters": palParkEncounters == null
            ? null
            : List<dynamic>.from(palParkEncounters!.map((x) => x.toJson())),
        "shape": shape == null ? null : shape!.toJson(),
        "varieties": varieties == null
            ? null
            : List<dynamic>.from(varieties!.map((x) => x.toJson())),
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    this.flavorText,
    this.language,
    this.version,
  });

  String? flavorText;
  NamedApiResponse? language;
  NamedApiResponse? version;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: json["language"] == null
            ? null
            : NamedApiResponse.fromJson(json["language"]),
        version: json["version"] == null
            ? null
            : NamedApiResponse.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language == null ? null : language!.toJson(),
        "version": version == null ? null : version!.toJson(),
      };
}

class PalParkEncounter {
  PalParkEncounter({
    this.area,
    this.baseScore,
    this.rate,
  });

  NamedApiResponse? area;
  int? baseScore;
  int? rate;

  factory PalParkEncounter.fromJson(Map<String, dynamic> json) =>
      PalParkEncounter(
        area: json["area"] == null
            ? null
            : NamedApiResponse.fromJson(json["area"]),
        baseScore: json["base_score"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "area": area == null ? null : area!.toJson(),
        "base_score": baseScore,
        "rate": rate,
      };
}

class Variety {
  Variety({
    this.isDefault,
    this.pokemon,
  });

  bool? isDefault;
  NamedApiResponse? pokemon;

  factory Variety.fromJson(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"],
        pokemon: json["pokemon"] == null
            ? null
            : NamedApiResponse.fromJson(json["pokemon"]),
      );

  Map<String, dynamic> toJson() => {
        "is_default": isDefault,
        "pokemon": pokemon == null ? null : pokemon!.toJson(),
      };
}
