import 'package:flutter/material.dart';
import 'package:project_pokemon/client/models/base_response_model/named_api_response.dart';
import 'package:project_pokemon/generated/l10n.dart';
import 'package:project_pokemon/ui/pokemon_deteil_page/pokemon_detail_page.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart'
    show StringCasingExtension;

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({
    Key? key,
    required this.noMorePage,
    required this.loading,
    required this.pokemonList,
    required this.nextPageFn,
  }) : super(key: key);

  final bool noMorePage;
  final bool loading;
  final List<NamedApiResponse> pokemonList;
  final VoidCallback nextPageFn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).pokemons)),
      body: pokemonList.isEmpty
          ? loading
              ? const Center(child: CircularProgressIndicator())
              : Center(child: Text(S.of(context).no_pokemon_found))
          : ListView.builder(
              itemCount: pokemonList.length + 1,
              itemBuilder: (context, index) {
                if (index >= pokemonList.length) {
                  return loading
                      ? const CircularProgressIndicator()
                      : noMorePage
                          ? const SizedBox()
                          : nextPageButton(context);
                } else {
                  return ListTile(
                    title: Text(pokemonList[index].name?.toTitleCase() ??
                        S.of(context).unknown_pokemon),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PokemonDetailPage(
                            pokemonName: pokemonList[index].name!,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
    );
  }

  Widget nextPageButton(BuildContext context) {
    return ElevatedButton(
      child: Text(S.of(context).next_page),
      onPressed: nextPageFn,
    );
  }
}
