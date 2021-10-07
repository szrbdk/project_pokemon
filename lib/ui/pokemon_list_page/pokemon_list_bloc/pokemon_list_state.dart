part of 'pokemon_list_bloc.dart';

@immutable
abstract class PokemonListState {}

class PokemonListInitial extends PokemonListState {}

class GettingPokemonListState extends PokemonListState {}

class PokemonListFoundState extends PokemonListState {
  final List<NamedApiResponse> pokemonList;
  final bool noMorePage;

  PokemonListFoundState(this.pokemonList, this.noMorePage);
}

class PokemonListErroState extends PokemonListState {
  final dynamic error;
  PokemonListErroState(this.error);
}
