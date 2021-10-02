import 'package:flutter/material.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';
import 'package:project_pokemon/generated/l10n.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart';
import 'package:project_pokemon/widgets/pokemon_artwork_widget.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({
    Key? key,
    required this.title,
    required this.loading,
    required this.detail,
  }) : super(key: key);

  final String title;
  final bool loading;
  final PokemonDetail? detail;

  @override
  Widget build(BuildContext context) {
    bool isPortrait = context.mquery.orientation == Orientation.portrait;
    Size size = context.mquery.size;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : detail == null
              ? Center(child: Text(S.of(context).pokemon_detail_not_found))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (detail?.sprites?.baseArtWork != null) ...[
                          Align(
                            alignment: Alignment.center,
                            child: PokemonArtWorkWidget(
                              artwork: detail!.sprites!.baseArtWork!,
                              size: isPortrait
                                  ? size.width * 0.3
                                  : size.height * 0.2,
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
    );
  }
}
