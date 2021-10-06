import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_pokemon/ui/pokedex/model/pokedex_item.dart';
import 'package:project_pokemon/ui/pokedex/pokedex_bloc/pokedex_bloc.dart';
import 'package:project_pokemon/ui/pokedex/pokedex_screen.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  PokedexBloc bloc = PokedexBloc();

  List<PokedexItem> pokedexItems = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    bloc.add(GeneratePokedexItemListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is GeneratingPokedexItemListState) {
            loading = true;
            setState(() {});
          } else if (state is PokedexItemListGeneratedState) {
            pokedexItems = state.pokedexItemList;
            loading = false;
            setState(() {});
          }
        },
        child: PokedexScreen(
          loading: loading,
          pokedexItemList: pokedexItems,
        ),
      ),
    );
  }
}
