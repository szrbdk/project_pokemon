part of 'pokedex_bloc.dart';

@immutable
abstract class PokedexState {}

class PokedexInitial extends PokedexState {}

class GeneratingPokedexItemListState extends PokedexState {}

class PokedexItemListGeneratedState extends PokedexState {
  final List<PokedexItem> pokedexItemList;
  PokedexItemListGeneratedState(this.pokedexItemList);
}
