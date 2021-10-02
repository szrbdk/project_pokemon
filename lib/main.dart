import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_pokemon/ui/home/home_screen.dart';
import 'package:project_pokemon/utilities/blocs/app_config_bloc/app_config_bloc.dart';

import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale locale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppConfigBloc(),
      child: BlocBuilder<AppConfigBloc, AppConfigState>(
        builder: (context, state) {
          if (state is LocaleChangedState) {
            locale = state.locale;
          }
          return MaterialApp(
            locale: locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(primarySwatch: Colors.blue),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
