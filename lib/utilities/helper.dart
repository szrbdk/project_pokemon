import 'package:cached_network_image/cached_network_image.dart';
import 'package:palette_generator/palette_generator.dart';

class Helper {
  Future<PaletteGenerator> paletteGenerator(String path) async {
    assert(!path.endsWith('svg'), 'SVG picture not allowed!');
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
            CachedNetworkImageProvider(path),
            maximumColorCount: 5);
    return paletteGenerator;
  }
}
