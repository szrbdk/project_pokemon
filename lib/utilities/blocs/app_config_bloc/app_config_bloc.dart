import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_pokemon/utilities/theme/theme_provider.dart';

part 'app_config_event.dart';
part 'app_config_state.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  AppConfigBloc() : super(AppConfigInitial()) {
    on<AppConfigEvent>((event, emit) async {
      if (event is LocaleChangedEvent) {
        emit(LocaleChangedState(event.locale));
      }
      else if(event is ThemeChangedEvent){
        await ThemeProvider.i.saveThemeSettingsFromStorage(event.themeMode);
        emit(ThemeChangedState(event.themeMode));
      }
    });
  }
}
