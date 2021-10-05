import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_pokemon/ui/home/home_bloc/home_bloc.dart';
import 'package:project_pokemon/ui/home/home_screen.dart';
import 'package:project_pokemon/ui/splash/splash_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc = HomeBloc();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    bloc.add(StartHomePageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is HomePageLoadingState) {
            setState(() {
              loading = true;
            });
          } else if (state is HomePageLoadedState) {
            setState(() {
              loading = false;
            });
          }
        },
        child: loading ? const SplashScreen() : const HomeScreen(),
      ),
    );
  }
}
