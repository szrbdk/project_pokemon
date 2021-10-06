part of 'pokemon_detail_bloc.dart';

@immutable
abstract class PokemonDetailEvent {}

class GetPokemonDetailWithName extends PokemonDetailEvent {
  final String pokemonName;
  GetPokemonDetailWithName(this.pokemonName);
}

class ChangeFavoriteStatusEvent extends PokemonDetailEvent {
  final bool currentStatus;
  final String pokemonName;
  ChangeFavoriteStatusEvent(this.currentStatus, this.pokemonName);
}

class CatchPokemonEvent extends PokemonDetailEvent {
  final PokemonDetail detail;
  CatchPokemonEvent(this.detail);
}
