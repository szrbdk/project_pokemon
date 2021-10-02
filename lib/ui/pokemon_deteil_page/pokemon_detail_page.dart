import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        listener: (context, state) {
          if (state is SearchingPokemonDetailState) {
            setState(() {
              loading = true;
            });
          } else if (state is PokemonDetailFoundState) {
            setState(() {
              detail = state.pokemonDetail;
              loading = false;
            });
          }
        },
        child: PokemonDetailScreen(
          title: widget.pokemonName,
          loading: loading,
          detail: detail,
        ),
      ),
    );
  }
}
