import 'package:project_pokemon/client/api.dart';
import 'package:project_pokemon/client/models/pokemon_list_result.dart';
import 'package:project_pokemon/client/service_core.dart';

class PokemonService extends ServiceCore {
  @override
  ServiceEndpoint get endpoint => ServiceEndpoint.pokemon;

  Future<PokemonListResult> getPokemons({Map<String, dynamic>? parameters}) {
    return Api().getRequest(
      endpoint: endpoint.string,
      parameters: parameters,
      constructor: (response) => PokemonListResult.fromJson(response),
    );
  }
}
