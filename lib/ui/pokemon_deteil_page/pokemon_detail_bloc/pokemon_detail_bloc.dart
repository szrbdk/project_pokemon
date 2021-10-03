import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_species.dart';
import 'package:project_pokemon/client/services/pokemon_service.dart';
import 'package:project_pokemon/client/services/pokemon_species_service.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  PokemonDetailBloc() : super(PokemonDetailInitial()) {
    on<PokemonDetailEvent>((event, emit) async {
      if (event is GetPokemonDetailWithName) {
        emit(SearchingPokemonDetailState());
        late PokemonDetail detail;
        late PokemonSpecies species;
        List<Future> _futures = [
          getPokemonDetail(event.pokemonName).then((value) {
            detail = value;
          }),
          getPokemonSpecies(event.pokemonName).then((value) {
            species = value;
          })
        ];
        await Future.wait(_futures);
        detail.pokemonSpecies = species;
        emit(PokemonDetailFoundState(detail));
      }
    });
  }

  Future<PokemonDetail> getPokemonDetail(String name) {
    var completer = Completer<PokemonDetail>();
    PokemonService().pokemonDetail(pokemonName: name).then((value) {
      completer.complete(value);
    }).catchError((error) {
      completer.completeError(error);
    });
    return completer.future;
  }

  Future<PokemonSpecies> getPokemonSpecies(String name) {
    var completer = Completer<PokemonSpecies>();
    PokemonSpeciesService().pokemonSpecies(pokemonName: name).then((value) {
      completer.complete(value);
    }).catchError((error) {
      completer.completeError(error);
    });
    return completer.future;
  }
}
