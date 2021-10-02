import 'package:project_pokemon/client/api.dart';
import 'package:project_pokemon/client/models/base_response_model/base_api_response.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';
import 'package:project_pokemon/client/service_core.dart';

class PokemonService extends ServiceCore {
  @override
  ServiceEndpoint get endpoint => ServiceEndpoint.pokemon;

  String get path => endpoint.string;

  Future<BaseApiResponse> getPokemons({Map<String, dynamic>? parameters}) {
    return Api().getRequest(
      path: path,
      parameters: parameters,
      constructor: (response) => BaseApiResponse.fromJson(response),
    );
  }

  Future<PokemonDetail> pokemonDetail(
      {required String pokemonName, Map<String, dynamic>? parameters}) {
    return Api().getRequest(
      path: '$path/$pokemonName',
      parameters: parameters,
      constructor: (response) => PokemonDetail.fromJson(response),
    );
  }
}
