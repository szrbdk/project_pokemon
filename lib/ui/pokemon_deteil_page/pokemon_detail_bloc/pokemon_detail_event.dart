part of 'pokemon_detail_bloc.dart';

@immutable
abstract class PokemonDetailEvent {}

class GetPokemonDetailWithName extends PokemonDetailEvent {
  final String pokemonName;
  GetPokemonDetailWithName(this.pokemonName);
}
