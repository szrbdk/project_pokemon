import 'package:collection/collection.dart' show IterableExtension;

class PokemonSprites {
  PokemonSprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
  });

  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;
  OtherArtWork? other;

  factory PokemonSprites.fromJson(Map<String, dynamic> json) => PokemonSprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other:
            json["other"] == null ? null : OtherArtWork.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other == null ? null : other!.toJson(),
      };

  String? get baseArtWork {
    _baseArtWork ??= _findBaseArtWork;
    return _baseArtWork == null || _baseArtWork == '' ? null : _baseArtWork;
  }

  String? _baseArtWork;

  String get _findBaseArtWork {
    final List<String?> _artWorks = [
      other?.officialArtwork?.frontDefault,
      other?.officialArtwork?.frontFemale,
      other?.dreamWorld?.frontDefault,
      other?.dreamWorld?.frontDefault,
      frontDefault,
      frontFemale,
      frontShiny,
      frontShinyFemale,
    ];
    return _artWorks.firstWhereOrNull((element) => element != null) ?? '';
  }
}

class OtherArtWork {
  OtherArtWork({
    this.dreamWorld,
    this.officialArtwork,
  });

  Artwork? dreamWorld;
  Artwork? officialArtwork;

  factory OtherArtWork.fromJson(Map<String, dynamic> json) => OtherArtWork(
        dreamWorld: json["dream_world"] == null
            ? null
            : Artwork.fromJson(json["dream_world"]),
        officialArtwork: json["official-artwork"] == null
            ? null
            : Artwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld == null ? null : dreamWorld!.toJson(),
        "official-artwork":
            officialArtwork == null ? null : officialArtwork!.toJson(),
      };
}

class Artwork {
  Artwork({
    this.frontDefault,
    this.frontFemale,
  });

  String? frontDefault;
  String? frontFemale;

  factory Artwork.fromJson(Map<String, dynamic> json) => Artwork(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}
