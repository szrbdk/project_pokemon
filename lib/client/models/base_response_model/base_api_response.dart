// To parse this JSON data, do
//
//     final pokemonListResult = pokemonListResultFromJson(jsonString);

import 'dart:convert';

import 'package:project_pokemon/client/models/base_response_model/named_api_response.dart';

BaseApiResponse pokemonListResultFromJson(String str) =>
    BaseApiResponse.fromJson(json.decode(str));

String pokemonListResultToJson(BaseApiResponse data) =>
    json.encode(data.toJson());

class BaseApiResponse {
  BaseApiResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  String? previous;
  List<NamedApiResponse>? results;

  factory BaseApiResponse.fromJson(Map<String, dynamic> json) =>
      BaseApiResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? null
            : List<NamedApiResponse>.from(
                json["results"].map((x) => NamedApiResponse.fromJson(x))),
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
