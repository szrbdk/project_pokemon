import 'package:project_pokemon/client/models/base_response_model/named_api_response.dart';

class PokemonType {
  PokemonType({
    this.slot,
    this.type,
  });

  int? slot;
  NamedApiResponse? type;

  factory PokemonType.fromJson(Map<String, dynamic> json) => PokemonType(
        slot: json["slot"],
        type: json["type"] == null
            ? null
            : NamedApiResponse.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type == null ? null : type!.toJson(),
      };
}
