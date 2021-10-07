import 'package:palette_generator/palette_generator.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';

class PokedexItem {
  final int timeStamp;
  final PokemonDetail detail;
  PokedexStatus status;
  final PaletteColor? paletteColor;

  PokedexItem({
    required this.detail,
    required this.status,
    required this.timeStamp,
    this.paletteColor,
  });
}

enum PokedexStatus { catched, released, statusChanging }
