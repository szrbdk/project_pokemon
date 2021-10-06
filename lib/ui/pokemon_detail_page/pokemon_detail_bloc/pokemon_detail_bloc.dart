import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_evolution.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_species.dart';
import 'package:project_pokemon/client/services/evolution_chain_service.dart';
import 'package:project_pokemon/client/services/pokemon_service.dart';
import 'package:project_pokemon/client/services/pokemon_species_service.dart';
import 'package:project_pokemon/utilities/storage/storage.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  PokemonDetailBloc() : super(PokemonDetailInitial()) {
    on<PokemonDetailEvent>((event, emit) async {
      if (event is GetPokemonDetailWithName) {
        emit(SearchingPokemonDetailState());
        late PokemonDetail detail;
        late PokemonSpecies species;
        bool isFavorited = Storage.i.favorites.contains(event.pokemonName);
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
        detail.pokemonEvolution = await getPokemonEvolution(detail.id!);
        emit(PokemonDetailFoundState(detail, isFavorited));
      } else if (event is ChangeFavoriteStatusEvent) {
        bool success = event.currentStatus
            ? await Storage.i.removeFromFavorite(event.pokemonName)
            : await Storage.i.addToFavorite(event.pokemonName);
        emit(FavoriteStatusChangedEvent(
            success ? !event.currentStatus : event.currentStatus));
      } else if (event is CatchPokemonEvent) {
        emit(PokemonCatchingState());
        bool success = await Storage.i.addToDex(event.detail);
        await Future.delayed(const Duration(seconds: 2));
        emit(PokemonCatchStatusState(success));
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

  Future<PokemonEvolution> getPokemonEvolution(int id) {
    var completer = Completer<PokemonEvolution>();
    EvolutionChainService().evolutionChain(id: id).then((value) {
      completer.complete(value);
    }).catchError((error) {
      completer.completeError(error);
    });
    return completer.future;
  }
}
