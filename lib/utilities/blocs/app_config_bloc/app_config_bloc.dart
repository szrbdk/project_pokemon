import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'app_config_event.dart';
part 'app_config_state.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  AppConfigBloc() : super(AppConfigInitial()) {
    on<AppConfigEvent>((event, emit) {
      if (event is LocaleChangedEvent) {
        return emit(LocaleChangedState(event.locale));
      }
    });
  }
}
