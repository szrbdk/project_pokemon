import 'package:flutter/material.dart';
import 'package:project_pokemon/generated/l10n.dart';
import 'package:project_pokemon/ui/pokemon_detail_page/pokemon_detail_page.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart'
    show StringCasingExtension;
import 'package:project_pokemon/utilities/storage/storage.dart';

class FavoritesScreen extends StatefulWidget {
  /// List of favorited pokemons
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favorites = Storage.i.favorites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).favorites)),
      body: favorites.isEmpty
          ? Center(child: Text(S.of(context).favorites_not_found))
          : Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.separated(
                itemCount: favorites.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(favorites[index].toTitleCase()),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PokemonDetailPage(
                            pokemonName: favorites[index],
                            onFavoriteChanged: () {
                              favorites = Storage.i.favorites;
                              setState(() {});
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}
