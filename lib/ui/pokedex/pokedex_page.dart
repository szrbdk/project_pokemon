import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_pokemon/generated/l10n.dart';
import 'package:project_pokemon/ui/pokedex/model/pokedex_item.dart';
import 'package:project_pokemon/ui/pokedex/pokedex_bloc/pokedex_bloc.dart';
import 'package:project_pokemon/ui/pokedex/pokedex_screen.dart';
import 'package:project_pokemon/utilities/dialog_manager/dialog_manager.dart';

class PokedexPage extends StatefulWidget {
  /// Lists of pokemon in your pokedex
  const PokedexPage({Key? key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  PokedexBloc bloc = PokedexBloc();

  List<PokedexItem> pokedexItems = [];
  bool loading = true;

  bool _pokemonCatchinDialogActive = false;

  @override
  void initState() {
    super.initState();
    bloc.add(GeneratePokedexItemListEvent());
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
          if (state is GeneratingPokedexItemListState) {
            loading = true;
            setState(() {});
          } else if (state is PokedexItemListGeneratedState) {
            pokedexItems = state.pokedexItemList;
            loading = false;
            setState(() {});
          } else if (state is PokemonReleasingState) {
            changeStatus(state.id, PokedexStatus.statusChanging);
            _pokemonCatchinDialogActive = true;
            setState(() {});
            showDialog(
              context: context,
              builder: (context) {
                return DialogManager().simpleLoadingDialog(
                  context: context,
                  loadingMessage: Text(S.of(context).pokemon_releasing),
                );
              },
            );
          } else if (state is PokemonReleasedState) {
            changeStatus(state.id, PokedexStatus.released);
            pokedexItems
                .removeWhere((element) => element.timeStamp == state.id);
            if (_pokemonCatchinDialogActive) {
              Navigator.pop(context);
              _pokemonCatchinDialogActive = false;
            }
            setState(() {});
            showDialog(
              context: context,
              builder: (context) {
                return DialogManager().simpleStatusDialog(
                  context: context,
                  isSuccess: true,
                  content: [Text(S.of(context).pokemon_released)],
                );
              },
            );
          } else if (state is PokemonReleaseFailedState) {
            changeStatus(state.id, PokedexStatus.catched);
            if (_pokemonCatchinDialogActive) {
              Navigator.pop(context);
              _pokemonCatchinDialogActive = false;
            }
            setState(() {});
            showDialog(
              context: context,
              builder: (context) {
                return DialogManager().simpleStatusDialog(
                  context: context,
                  isSuccess: false,
                  content: [Text(S.of(context).pokemon_release_failed)],
                );
              },
            );
          }
        },
        child: PokedexScreen(
          bloc: bloc,
          loading: loading,
          pokedexItemList: pokedexItems,
          releasePokemonFn: (item) {
            bloc.add(ReleasePokemonEvent(item.timeStamp));
          },
        ),
      ),
    );
  }

  void changeStatus(int id, PokedexStatus newStatus) {
    int index = pokedexItems.indexWhere((element) => element.timeStamp == id);
    if (index >= 0) {
      pokedexItems[index].status = newStatus;
    }
  }
}
