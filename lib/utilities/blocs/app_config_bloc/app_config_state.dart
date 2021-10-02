part of 'app_config_bloc.dart';

@immutable
abstract class AppConfigState {}

class AppConfigInitial extends AppConfigState {}

class LocaleChangedState extends AppConfigState {
  final Locale locale;
  LocaleChangedState(this.locale);
}
