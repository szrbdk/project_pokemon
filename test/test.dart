import 'package:flutter_test/flutter_test.dart';
import 'package:project_pokemon/client/models/pokemon/pokemon_detail.dart';
import 'package:project_pokemon/utilities/storage/storage.dart';

void main() {
  group('Storage Test', () {
    setUp(() async {});

    test('Add pokemon to favorites', () async {
      await Storage.i.initializeStorage();
      await Storage.i.addToFavorite('bulbasaur');
      expect(Storage.i.favorites, contains('bulbasaur'));
    });

    test('Remove pokemon from favorites', () async {
      await Storage.i.initializeStorage();
      await Storage.i.removeFromFavorite('bulbasaur');
      expect(Storage.i.favorites, isNot(contains('bulbasaur')));
    });

    test('Add pokemon to dex', () async {
      await Storage.i.initializeStorage();
      expect(Storage.i.dex.length, 0);
      await Storage.i.addToDex(PokemonDetail(name: 'bulbasaur', id: 1));
      expect(Storage.i.dex.length, 1);
    });
  });

  // Test didn't work with http requsts. Test needs Custom http request

  // group('Api Test', () {
  //   test('request with non pokemon name test', () async {
  //     var future = PokemonService().pokemonDetail(pokemonName: 'bulbasar');

  //     expect(future, throwsException);
  //   });

  //   test('request with pokemon name test', () async {
  //     var respose =
  //         await PokemonService().pokemonDetail(pokemonName: 'bulbasaur');

  //     expect(respose.runtimeType, equals(PokemonDetail));
  //   });
  // });

  // group('Widget Test', () {
  //   testWidgets('Pokemon List Page Test', (WidgetTester tester) async {
  //     await tester.pumpWidget(
  //       Localizations(
  //         locale: const Locale('en'),
  //         delegates: const [
  //           S.delegate,
  //           GlobalMaterialLocalizations.delegate,
  //           GlobalWidgetsLocalizations.delegate,
  //           GlobalCupertinoLocalizations.delegate,
  //         ],
  //         child: PokemonListScreen(
  //           noMorePage: false,
  //           loading: false,
  //           pokemonList: [
  //             NamedApiResponse(name: 'bulbasaur'),
  //             NamedApiResponse(name: 'ivysaur'),
  //           ],
  //           nextPageFn: () {},
  //         ),
  //       ),
  //     );

  //     final nextPage = find.text('Next Page');

  //     expect(nextPage, findsOneWidget);
  //   });
  // });
}
