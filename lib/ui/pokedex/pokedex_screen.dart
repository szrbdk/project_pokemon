import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_pokemon/generated/l10n.dart';
import 'package:project_pokemon/ui/pokedex/model/pokedex_item.dart';
import 'package:project_pokemon/ui/pokemon_detail_page/pokemon_detail_screen.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart'
    show StringCasingExtension, BuildContextExtension;

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({
    Key? key,
    required this.pokedexItemList,
    required this.loading,
  }) : super(key: key);

  final List<PokedexItem> pokedexItemList;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).pokedex)),
      body: pokedexItemList.isEmpty
          ? Center(
              child: loading
                  ? const CircularProgressIndicator()
                  : Text(S.of(context).dex_is_empty),
            )
          : ListView.builder(
              itemCount: pokedexItemList.length,
              itemBuilder: (context, index) {
                var pokedexItem = pokedexItemList[index];
                return Card(
                  color: pokedexItem.paletteColor?.color,
                  child: ListTile(
                    leading: pokedexItem.detail.sprites?.baseArtWork != null
                        ? SizedBox(
                            width: 38,
                            height: 38,
                            child: CachedNetworkImage(
                                imageUrl:
                                    pokedexItem.detail.sprites!.baseArtWork!),
                          )
                        : null,
                    title: Text(pokedexItem.detail.name!.toTitleCase()),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PokemonDetailScreen(
                              title: pokedexItem.detail.name!,
                              loading: false,
                              isDexStatusChanging: false,
                              detail: pokedexItem.detail,
                              isFavorited: false,
                              favoriteFn: null,
                              paletteColor: pokedexItem.paletteColor,
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
