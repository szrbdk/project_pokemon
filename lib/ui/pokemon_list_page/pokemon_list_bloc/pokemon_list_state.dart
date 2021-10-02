part of 'pokemon_list_bloc.dart';

@immutable
abstract class PokemonListState {}

class PokemonListInitial extends PokemonListState {}

class GettingPokemonListState extends PokemonListState {}

class PokemonListFoundState extends PokemonListState {
  final List<SimplePokemonModel> pokemonList;
  final bool noMorePage;

  PokemonListFoundState(this.pokemonList, this.noMorePage);
}
