import 'package:project_pokemon/client/api.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_species.dart';
import 'package:project_pokemon/client/service_core.dart';

class PokemonSpeciesService extends ServiceCore {
  @override
  ServiceEndpoint get endpoint => ServiceEndpoint.pokemonSpecies;

  String get path => endpoint.string;

  /// Get pokemon species
  Future<PokemonSpecies> pokemonSpecies(
      {required String pokemonName, Map<String, dynamic>? parameters}) {
    return Api().getRequest(
      path: '$path/$pokemonName',
      parameters: parameters,
      constructor: (response) => PokemonSpecies.fromJson(response),
    );
  }
}
