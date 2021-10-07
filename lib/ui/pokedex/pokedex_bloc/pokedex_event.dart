part of 'pokedex_bloc.dart';

@immutable
abstract class PokedexEvent {}

class GeneratePokedexItemListEvent extends PokedexEvent {}

class ReleasePokemonEvent extends PokedexEvent {
  final int id;
  ReleasePokemonEvent(this.id);
}
