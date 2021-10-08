import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_pokemon/generated/l10n.dart';
import 'package:project_pokemon/ui/pokedex/model/pokedex_item.dart';
import 'package:project_pokemon/ui/pokedex/pokedex_bloc/pokedex_bloc.dart';
import 'package:project_pokemon/ui/pokemon_detail_page/pokemon_detail_screen.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart'
    show StringCasingExtension;

class PokedexScreen extends StatelessWidget {
  /// Lists of pokemon in your pokedex
  const PokedexScreen({
    Key? key,
    required this.pokedexItemList,
    required this.loading,
    required this.releasePokemonFn,
    required this.bloc,
  }) : super(key: key);

  final List<PokedexItem> pokedexItemList;
  final bool loading;
  final void Function(PokedexItem item) releasePokemonFn;
  final PokedexBloc bloc;

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
                    title: Text(
                      pokedexItem.detail.name!.toTitleCase(),
                      style: Theme.of(context).textTheme.bodyText2?.apply(
                          color: pokedexItem.paletteColor?.bodyTextColor
                              .withAlpha(255)),
                    ),
                    subtitle: Text(
                        DateFormat.yMMMMd(Intl.getCurrentLocale())
                            .add_Hm()
                            .format(DateTime.fromMillisecondsSinceEpoch(
                                pokedexItem.timeStamp)),
                        style: Theme.of(context).textTheme.bodyText2?.apply(
                            color: pokedexItem.paletteColor?.bodyTextColor
                                .withAlpha(255))),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BlocBuilder(
                              bloc: bloc,
                              builder: (context, state) {
                                if (state is PokemonReleasingState) {
                                  if (state.id == pokedexItem.timeStamp) {
                                    pokedexItem.status =
                                        PokedexStatus.statusChanging;
                                  }
                                } else if (state is PokemonReleasedState) {
                                  if (state.id == pokedexItem.timeStamp) {
                                    pokedexItem.status = PokedexStatus.released;
                                  }
                                } else if (state is PokemonReleaseFailedState) {
                                  if (state.id == pokedexItem.timeStamp) {
                                    pokedexItem.status = PokedexStatus.catched;
                                  }
                                }
                                return PokemonDetailScreen(
                                  loading: false,
                                  isDexStatusChanging: false,
                                  detail: pokedexItem.detail,
                                  isFavorited: false,
                                  favoriteFn: null,
                                  paletteColor: pokedexItem.paletteColor,
                                  dexId: pokedexItem.timeStamp,
                                  dexStatus: pokedexItem.status,
                                  releasePokemonFn: () {
                                    releasePokemonFn(pokedexItem);
                                  },
                                );
                              },
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
