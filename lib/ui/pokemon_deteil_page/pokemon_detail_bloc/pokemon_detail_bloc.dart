import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';
import 'package:project_pokemon/client/services/pokemon_service.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  PokemonDetailBloc() : super(PokemonDetailInitial()) {
    on<PokemonDetailEvent>((event, emit) async {
      if (event is GetPokemonDetailWithName) {
        emit(SearchingPokemonDetailState());
        PokemonDetail detail = await getPokemonDetail(event.pokemonName);
        await Future.delayed(const Duration(milliseconds: 500));
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
}
