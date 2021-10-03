import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';
import 'package:project_pokemon/generated/l10n.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart'
    show MediaQueryContext, StringCasingExtension;
import 'package:project_pokemon/widgets/pokemon_artwork_widget.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({
    Key? key,
    required this.title,
    required this.loading,
    required this.detail,
    this.paletteColor,
  }) : super(key: key);

  final String title;
  final bool loading;
  final PokemonDetail? detail;
  final PaletteColor? paletteColor;

  @override
  Widget build(BuildContext context) {
    bool isPortrait = context.mquery.orientation == Orientation.portrait;
    Size size = context.mquery.size;
    return Scaffold(
      backgroundColor: paletteColor?.color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: loading ? Colors.transparent : paletteColor?.color,
        iconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: paletteColor?.bodyTextColor),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          )
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : detail == null
              ? Center(child: Text(S.of(context).pokemon_detail_not_found))
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (detail?.sprites?.baseArtWork != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: PokemonArtWorkWidget(
                            artwork: detail!.sprites!.baseArtWork!,
                            size: isPortrait
                                ? size.width * 0.23
                                : size.height * 0.18,
                          ),
                        ),
                      ),
                    ],
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          color: Colors.white,
                        ),
                        child: DetailsSection(detail: detail!),
                      ),
                    )
                  ],
                ),
    );
  }
}

class DetailsSection extends StatelessWidget {
  const DetailsSection({Key? key, required this.detail}) : super(key: key);

  final PokemonDetail detail;

  @override
  Widget build(BuildContext context) {
    String? _flavorText =
        detail.pokemonSpecies?.getFlavorText(Intl.getCurrentLocale());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              detail.name!.toTitleCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.apply(fontWeightDelta: 2),
            ),
          ),
        ),
        const Divider(),
        if (_flavorText != null) ...[
          Text(
            _flavorText,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
