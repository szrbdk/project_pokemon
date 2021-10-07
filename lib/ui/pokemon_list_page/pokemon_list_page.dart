import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_pokemon/client/models/base_response_model/named_api_response.dart';
import 'package:project_pokemon/ui/pokemon_list_page/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:project_pokemon/ui/pokemon_list_page/pokemon_list_screen.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  PokemonListBloc bloc = PokemonListBloc();

  bool loading = false;
  bool noMorePage = false;

  List<NamedApiResponse> pokemonList = [];

  @override
  void initState() {
    super.initState();
    bloc.add(GetPokemonsEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is GettingPokemonListState) {
            setState(() {
              loading = true;
            });
          } else if (state is PokemonListFoundState) {
            setState(() {
              pokemonList.addAll(state.pokemonList);
              noMorePage = state.noMorePage;
              loading = false;
            });
          }
        },
        child: PokemonListScreen(
          noMorePage: noMorePage,
          loading: loading,
          pokemonList: pokemonList,
          nextPageFn: () {
            bloc.add(GetPokemonsEvent());
          },
        ),
      ),
    );
  }
}
