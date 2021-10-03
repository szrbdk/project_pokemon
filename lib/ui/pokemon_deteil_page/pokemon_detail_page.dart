import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';
import 'package:project_pokemon/ui/pokemon_deteil_page/pokemon_detail_bloc/pokemon_detail_bloc.dart';
import 'package:project_pokemon/ui/pokemon_deteil_page/pokemon_detail_screen.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({Key? key, required this.pokemonName})
      : super(key: key);

  final String pokemonName;

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  PokemonDetailBloc bloc = PokemonDetailBloc();

  bool loading = true;
  PokemonDetail? detail;
  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    super.initState();
    bloc.add(GetPokemonDetailWithName(widget.pokemonName));
  }

  Future<void> _updatePaletteGenerator(String path) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
        CachedNetworkImageProvider(path),
        maximumColorCount: 5);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener(
        bloc: bloc,
        listener: (context, state) async {
          if (state is SearchingPokemonDetailState) {
            setState(() {
              loading = true;
            });
          } else if (state is PokemonDetailFoundState) {
            detail = state.pokemonDetail;
            String? path = detail?.sprites?.baseArtWork;
            if (path != null) {
              await _updatePaletteGenerator(path);
            }
            loading = false;
            setState(() {});
          }
        },
        child: PokemonDetailScreen(
          title: widget.pokemonName,
          loading: loading,
          detail: detail,
          paletteColor: paletteColor,
        ),
      ),
    );
  }

  PaletteColor? get paletteColor =>
      paletteGenerator?.lightVibrantColor ??
      paletteGenerator?.lightMutedColor ??
      paletteGenerator?.dominantColor;
}
