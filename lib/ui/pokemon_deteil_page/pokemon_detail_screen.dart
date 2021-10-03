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
                  sectionTitleWidget(context, S.of(context).stats),
                  for (var stat in detail.stats!) ...[
                    statBarWidget(
                        context,
                        stat.stat!.name!.replaceAll('-', ' ').toTitleCase(),
                        stat.baseStat!.toDouble())
                  ],
                  if (detail.pokemonSpecies?.captureRate != null) ...[
                    statBarWidget(
                      context,
                      S
                          .of(context)
                          .capture_rate
                          .replaceAll('-', ' ')
                          .toTitleCase(),
                      detail.pokemonSpecies!.captureRate!.toDouble(),
                      Colors.green,
                    )
                  ]
                ],
                if (detail.pokemonSpecies != null) ...[
                  if (detail.pokemonSpecies!.eggGroups != null) ...[
                    sectionTitleWidget(context, S.of(context).egg_groups),
                    eggGroupsWidget(context),
                  ]
                ],
                // TODO Add ablities
                // TODO add type
                // TODO add varieties
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget statBarWidget(BuildContext context, String label, double value,
      [Color? barColor]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: context.theme.textTheme.subtitle1?.apply(
                  fontStyle: FontStyle.italic,
                  fontWeightDelta: 2,
                  fontSizeFactor: 0.8),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 5,
            child: LinearProgressIndicator(
              value: value / 100,
              minHeight: 10,
              backgroundColor: Colors.grey.shade400,
              color: barColor ?? Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Align eggGroupsWidget(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          children: [
            for (var egg in detail.pokemonSpecies!.eggGroups!) ...[
              Chip(
                label: Text(egg.name!.toTitleCase()),
                backgroundColor: Colors.indigoAccent,
                labelStyle: context.theme.textTheme.bodyText1
                    ?.apply(color: Colors.white),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Align sectionTitleWidget(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          title,
          style: context.theme.textTheme.headline6,
        ),
      ),
    );
  }
}

class PokemonPhysicalAttributesWidget extends StatelessWidget {
  const PokemonPhysicalAttributesWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
  }) : super(key: key);

  final String title;
  final int value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.theme.textTheme.headline6
              ?.apply(fontSizeFactor: 0.7, fontWeightDelta: 2),
        ),
        Text(
          '$value',
          style: context.theme.textTheme.headline6?.apply(fontSizeFactor: 0.9),
        ),
        Text(
          unit,
          style: context.theme.textTheme.caption
              ?.apply(fontStyle: FontStyle.italic),
        ),
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
