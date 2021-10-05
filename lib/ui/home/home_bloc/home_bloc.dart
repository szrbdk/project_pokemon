import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_pokemon/utilities/storage/storage.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is StartHomePageEvent) {
        emit(HomePageLoadingState());
        await Storage.i.initializeStorage();
        await Future.delayed(const Duration(seconds: 4));
        emit(HomePageLoadedState());
      }
    });
  }
}
