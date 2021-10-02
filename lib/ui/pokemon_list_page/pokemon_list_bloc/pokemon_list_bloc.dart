import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_pokemon/client/models/pokemon_list_result.dart';
import 'package:project_pokemon/client/services/pokemon_service.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  int _currentIndex = 0;

  PokemonListBloc() : super(PokemonListInitial()) {
    on<PokemonListEvent>((event, emit) async {
      if (event is GetPokemonsEvent) {
        emit(GettingPokemonListState());
        PokemonListResult result = await getPokemons();
        if (result.next != null) {
          Uri uri = Uri.parse(result.next!);
          if (uri.queryParameters.containsKey('offset') &&
              uri.queryParameters['offset'] != null) {
            _currentIndex =
                int.tryParse(uri.queryParameters['offset']!) ?? _currentIndex;
          }
        }
        emit(PokemonListFoundState(result.results!, result.next == null));
      }
    });
  }

  Future<PokemonListResult> getPokemons() async {
    var completer = Completer<PokemonListResult>();
    PokemonService()
        .getPokemons(parameters: {'offset': _currentIndex}).then((value) {
      completer.complete(value);
    }).catchError((error) {
      completer.completeError(error);
    });
    return completer.future;
  }
}
