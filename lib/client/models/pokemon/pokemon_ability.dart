import 'package:project_pokemon/client/models/base_response_model/named_api_response.dart';

class PokemonAbility {
  PokemonAbility({
    this.ability,
    this.isHidden,
    this.slot,
  });

  NamedApiResponse? ability;
  bool? isHidden;
  int? slot;

  factory PokemonAbility.fromJson(Map<String, dynamic> json) => PokemonAbility(
        ability: json["ability"] == null
            ? null
            : NamedApiResponse.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability == null ? null : ability!.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}
