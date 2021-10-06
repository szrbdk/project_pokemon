import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_pokemon/generated/l10n.dart';
import 'package:project_pokemon/ui/favorites/favorites_screen.dart';
import 'package:project_pokemon/ui/pokedex/pokedex_page.dart';
import 'package:project_pokemon/ui/pokemon_list_page/pokemon_list_page.dart';
import 'package:project_pokemon/ui/settings/settings_screen.dart';
import 'package:project_pokemon/utilities/constants/assets.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart'
    show BuildContextExtension;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(S.of(context).project_pokemon),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.pokemonLogoSvg,
                    height: context.mquery.size.height * 0.15,
                    width: context.mquery.size.width * 0.8,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              HomeNavigationItemWidget(
                assetName: Assets.pokeballPng,
                label: S.of(context).pokemons,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const PokemonListPage()));
                },
              ),
              HomeNavigationItemWidget(
                assetName: Assets.pokedexPng,
                label: S.of(context).pokedex,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PokedexPage()));
                },
              ),
              HomeNavigationItemWidget(
                assetName: Assets.favoritePng,
                label: S.of(context).favorites,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoritesScreen()));
                },
              ),
              HomeNavigationItemWidget(
                assetName: Assets.settingsPng,
                label: S.of(context).settings,
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (_) => const SettingsPage()))
                      .then((value) {
                    setState(() {});
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeNavigationItemWidget extends StatelessWidget {
  const HomeNavigationItemWidget({
    Key? key,
    required this.label,
    required this.assetName,
    required this.onTap,
  }) : super(key: key);

  final String assetName;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(assetName, height: 38, width: 38),
        title: Text(label),
        onTap: onTap,
      ),
    );
  }
}
