import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_pokemon/ui/pokedex/model/pokedex_item.dart';
import 'package:project_pokemon/utilities/helper.dart';
import 'package:project_pokemon/utilities/storage/storage.dart';

part 'pokedex_event.dart';
part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  PokedexBloc() : super(PokedexInitial()) {
    on<PokedexEvent>((event, emit) async {
      if (event is GeneratePokedexItemListEvent) {
        emit(GeneratingPokedexItemListState());
        List<PokedexItem> pokedexItemList = [];
        await Future.wait([
          for (var item in Storage.i.dex.entries) ...[
            Helper()
                .paletteGenerator(item.value.sprites!.baseArtWork!)
                .then((paletteGenerator) {
              pokedexItemList.add(PokedexItem(
                detail: item.value,
                status: PokedexStatus.catched,
                timeStamp: item.key,
                paletteColor: Helper().paletteColor(paletteGenerator),
              ));
            })
          ]
        ]);
        emit(PokedexItemListGeneratedState(pokedexItemList));
      }
    });
  }
}
