import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_pokemon/ui/home/home_page.dart';
import 'package:project_pokemon/utilities/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:project_pokemon/utilities/simple_bloc_observer.dart';
import 'package:project_pokemon/utilities/theme/theme_provider.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeProvider.i.getThemeSettigsFromStorage();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppConfigBloc bloc = AppConfigBloc();
  Locale locale = const Locale('en');

  ThemeMode themeMode = ThemeProvider.i.themeMode;

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is LocaleChangedState) {
            locale = state.locale;
          }else if (state is ThemeChangedState){
            themeMode = state.themeMode;
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: locale,
            themeMode: themeMode,
            theme: ThemeProvider.i.lightTheme,
            darkTheme: ThemeProvider.i.darkTheme,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
