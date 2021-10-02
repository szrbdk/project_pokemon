part of 'app_config_bloc.dart';

@immutable
abstract class AppConfigEvent {}

class LocaleChangedEvent extends AppConfigEvent {
  final Locale locale;
  LocaleChangedEvent(this.locale);
}
