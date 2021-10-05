part of 'pokemon_detail_bloc.dart';

@immutable
abstract class PokemonDetailState {}

class PokemonDetailInitial extends PokemonDetailState {}

class SearchingPokemonDetailState extends PokemonDetailState {}

class PokemonDetailFoundState extends PokemonDetailState {
  final PokemonDetail pokemonDetail;
  final bool isFavorited;
  PokemonDetailFoundState(this.pokemonDetail, this.isFavorited);
}

class FavoriteStatusChangedEvent extends PokemonDetailState {
  final bool newStatus;
  FavoriteStatusChangedEvent(this.newStatus);
}
