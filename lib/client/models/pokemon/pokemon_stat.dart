import 'package:project_pokemon/client/models/base_response_model/named_api_response.dart';

class PokemonStat {
  PokemonStat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int? baseStat;
  int? effort;
  NamedApiResponse? stat;

  factory PokemonStat.fromJson(Map<String, dynamic> json) => PokemonStat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: json["stat"] == null
            ? null
            : NamedApiResponse.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat == null ? null : stat!.toJson(),
      };
}
