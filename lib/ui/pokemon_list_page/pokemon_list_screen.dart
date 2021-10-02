import 'package:flutter/material.dart';
import 'package:project_pokemon/client/models/pokemon_list_result.dart';
import 'package:project_pokemon/generated/l10n.dart';

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
  final List<SimplePokemonModel> pokemonList;
  final void Function() nextPageFn;

  @override
  Widget build(BuildContext context) {
    return pokemonList.isEmpty
        ? loading
            ? const Center(child: CircularProgressIndicator())
            : Center(child: Text(S.of(context).no_pokemon_found))
        : ListView.builder(
            itemCount: pokemonList.length + 1,
            itemBuilder: (context, index) {
              if (index >= pokemonList.length) {
                if (loading) {
                  return const CircularProgressIndicator();
                } else {
                  return noMorePage
                      ? const SizedBox()
                      : ElevatedButton(
                          child: Text(S.of(context).next_page),
                          onPressed: nextPageFn,
                        );
                }
              }
              return ListTile(
                title: Text(
                    pokemonList[index].name ?? S.of(context).unknown_pokemon),
              );
            },
          );
  }
}
