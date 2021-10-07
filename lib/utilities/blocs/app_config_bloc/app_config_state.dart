part of 'app_config_bloc.dart';

@immutable
abstract class AppConfigState {}

class AppConfigInitial extends AppConfigState {}

class LocaleChangedState extends AppConfigState {
  final Locale locale;
  LocaleChangedState(this.locale);
}

class ThemeChangedState extends AppConfigState {
  final ThemeMode themeMode;
  ThemeChangedState(this.themeMode);
}
