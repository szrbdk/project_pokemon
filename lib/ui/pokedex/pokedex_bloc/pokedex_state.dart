part of 'pokedex_bloc.dart';

@immutable
abstract class PokedexState {}

class PokedexInitial extends PokedexState {}

class GeneratingPokedexItemListState extends PokedexState {}

class PokedexItemListGeneratedState extends PokedexState {
  final List<PokedexItem> pokedexItemList;
  PokedexItemListGeneratedState(this.pokedexItemList);
}

class PokemonReleasingState extends PokedexState {
  final int id;
  PokemonReleasingState(this.id);
}

class PokemonReleasedState extends PokedexState {
  final int id;
  PokemonReleasedState(this.id);
}

class PokemonReleaseFailedState extends PokedexState {
  final int id;
  PokemonReleaseFailedState(this.id);
}
