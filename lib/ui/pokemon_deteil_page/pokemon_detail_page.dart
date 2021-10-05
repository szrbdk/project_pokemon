import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';
import 'package:project_pokemon/ui/pokemon_deteil_page/pokemon_detail_bloc/pokemon_detail_bloc.dart';
import 'package:project_pokemon/ui/pokemon_deteil_page/pokemon_detail_screen.dart';
import 'package:project_pokemon/utilities/helper.dart';

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
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    bloc.add(GetPokemonDetailWithName(widget.pokemonName));
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
              paletteGenerator = await Helper().paletteGenerator(path);
            }
            isFavorited = state.isFavorited;
            loading = false;
            setState(() {});
          } else if (state is FavoriteStatusChangedEvent) {
            isFavorited = state.newStatus;
            setState(() {});
          }
        },
        child: PokemonDetailScreen(
          title: widget.pokemonName,
          loading: loading,
          detail: detail,
          paletteColor: paletteColor,
          isFavorited: isFavorited,
          favoriteFn: () {
            bloc.add(
                ChangeFavoriteStatusEvent(isFavorited, widget.pokemonName));
          },
        ),
      ),
    );
  }

  PaletteColor? get paletteColor =>
      paletteGenerator?.lightVibrantColor ??
      paletteGenerator?.lightMutedColor ??
      paletteGenerator?.dominantColor;
}
