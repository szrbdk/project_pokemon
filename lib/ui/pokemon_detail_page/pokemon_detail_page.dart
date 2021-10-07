import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';
import 'package:project_pokemon/generated/l10n.dart';
import 'package:project_pokemon/ui/pokemon_detail_page/pokemon_detail_bloc/pokemon_detail_bloc.dart';
import 'package:project_pokemon/ui/pokemon_detail_page/pokemon_detail_screen.dart';
import 'package:project_pokemon/utilities/dialog_manager/dialog_manager.dart';
import 'package:project_pokemon/utilities/helper.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage(
      {Key? key, required this.pokemonName, this.onFavoriteChanged})
      : super(key: key);

  final String pokemonName;
  final VoidCallback? onFavoriteChanged;

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  PokemonDetailBloc bloc = PokemonDetailBloc();

  bool loading = true;
  PokemonDetail? detail;
  PaletteGenerator? paletteGenerator;
  bool isFavorited = false;
  bool isDexStatusChanging = false;

  bool _catchingPokemonDialogActive = false;

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

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
            if (widget.onFavoriteChanged != null) {
              widget.onFavoriteChanged!();
            }
            setState(() {});
          } else if (state is PokemonCatchingState) {
            isDexStatusChanging = true;
            _catchingPokemonDialogActive = true;
            setState(() {});
            showDialog(
              context: context,
              builder: (context) {
                return DialogManager().simpleLoadingDialog(
                    context: context,
                    loadingMessage: Text(S.of(context).catching_pokemon));
              },
            );
          } else if (state is PokemonCatchStatusState) {
            if (_catchingPokemonDialogActive) {
              Navigator.pop(context);
              _catchingPokemonDialogActive = false;
            }
            isDexStatusChanging = false;
            setState(() {});
            showDialog(
              context: context,
              builder: (context) {
                return DialogManager().simpleStatusDialog(
                    context: context,
                    isSuccess: state.status,
                    content: [
                      Text(state.status
                          ? S.of(context).pokemon_catched
                          : S.of(context).pokemon_catch_failed),
                    ]);
              },
            );
          }
        },
        child: PokemonDetailScreen(
          loading: loading,
          detail: detail,
          paletteColor: Helper().paletteColor(paletteGenerator),
          isFavorited: isFavorited,
          isDexStatusChanging: isDexStatusChanging,
          favoriteFn: () {
            bloc.add(
                ChangeFavoriteStatusEvent(isFavorited, widget.pokemonName));
          },
          catchPokemonFn: (value) {
            bloc.add(CatchPokemonEvent(value));
          },
        ),
      ),
    );
  }
}
