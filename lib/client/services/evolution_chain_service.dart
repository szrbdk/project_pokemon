import 'package:project_pokemon/client/api.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_evolution.dart';
import 'package:project_pokemon/client/service_core.dart';

class EvolutionChainService extends ServiceCore {
  @override
  ServiceEndpoint get endpoint => ServiceEndpoint.evolutionChain;

  String get path => endpoint.string;

  Future<PokemonEvolution> evolutionChain(
      {required int id, Map<String, dynamic>? parameters}) {
    return Api().getRequest(
      path: '$path/$id',
      parameters: parameters,
      constructor: (response) => PokemonEvolution.fromJson(response),
    );
  }
}
