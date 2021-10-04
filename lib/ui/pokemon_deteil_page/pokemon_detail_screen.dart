import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:project_pokemon/client/models/base_response_model/named_api_response.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_ability.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_evolution.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_type.dart';
import 'package:project_pokemon/generated/l10n.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart'
    show BuildContextExtension, StringCasingExtension;
import 'package:project_pokemon/widgets/pokemon_artwork_widget.dart';
import 'package:project_pokemon/widgets/pokemon_detail_chip_widget.dart';
import 'package:project_pokemon/widgets/pokemon_pyschical_attributes_widget.dart';
import 'package:project_pokemon/widgets/pokemon_stat_bar_widget.dart';
import 'package:project_pokemon/widgets/section_title.dart';

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
                      Align(
                        alignment: Alignment.center,
                        child: PokemonArtWorkWidget(
                          artwork: detail!.sprites!.baseArtWork!,
                          size: isPortrait
                              ? size.width * 0.4
                              : size.height * 0.18,
                        ),
                      ),
                    ],
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
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
        PokemonTitleWidget(name: detail.name!),
        const Divider(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_flavorText != null) ...[
                  Text(_flavorText, textAlign: TextAlign.center),
                  const Divider(),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (detail.weight != null) ...[
                      PokemonPhysicalAttributesWidget(
                        title: S.of(context).weight,
                        value: detail.weight!,
                        unit: S.of(context).lbs,
                      ),
                    ],
                    if (detail.height != null) ...[
                      PokemonPhysicalAttributesWidget(
                        title: S.of(context).height,
                        value: detail.height!,
                        unit: S.of(context).inc,
                      ),
                    ]
                  ],
                ),
                const Divider(),
                if (detail.stats != null) ...[
                  SectionTitle(title: S.of(context).stats),
                  for (var stat in detail.stats!) ...[
                    PokemonStatBarWidget(
                        label:
                            stat.stat!.name!.replaceAll('-', ' ').toTitleCase(),
                        value: stat.baseStat!.toDouble())
                  ],
                  if (detail.pokemonSpecies?.captureRate != null) ...[
                    PokemonStatBarWidget(
                      label: S
                          .of(context)
                          .capture_rate
                          .replaceAll('-', ' ')
                          .toTitleCase(),
                      value: detail.pokemonSpecies!.captureRate!.toDouble(),
                      barColor: Colors.green,
                    )
                  ]
                ],
                if (detail.types != null && detail.types!.isNotEmpty) ...[
                  SectionTitle(title: S.of(context).pokemon_type),
                  PokemonDetailChipWidget<PokemonType>(
                    items: detail.types!,
                    nameFn: (item) => item.type!.name!,
                    chipColor: Colors.deepPurple,
                  ),
                ],
                if (detail.pokemonSpecies != null) ...[
                  if (detail.pokemonSpecies!.eggGroups != null) ...[
                    SectionTitle(title: S.of(context).egg_groups),
                    PokemonDetailChipWidget<NamedApiResponse>(
                      items: detail.pokemonSpecies!.eggGroups!,
                      nameFn: (item) => item.name!,
                    ),
                  ]
                ],
                if (detail.abilities != null &&
                    detail.abilities!.isNotEmpty) ...[
                  SectionTitle(title: S.of(context).abilities),
                  PokemonDetailChipWidget<PokemonAbility>(
                    items: detail.abilities!,
                    nameFn: (item) => item.ability!.name!,
                    chipColor: Colors.amber.shade900,
                  ),
                ],
                if (detail.pokemonEvolution?.chain?.evolvesTo != null &&
                    detail.pokemonEvolution!.chain!.evolvesTo!.isNotEmpty) ...[
                  SectionTitle(title: S.of(context).next_evolutions),
                  PokemonDetailChipWidget<Chain>(
                    items: detail.pokemonEvolution!.chain!.evolvesTo!,
                    nameFn: (item) => item.species!.name!,
                    chipColor: Colors.pink,
                  ),
                ]
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PokemonTitleWidget extends StatelessWidget {
  const PokemonTitleWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          name.toTitleCase(),
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.apply(fontWeightDelta: 2, color: Colors.black),
        ),
      ),
    );
  }
}
