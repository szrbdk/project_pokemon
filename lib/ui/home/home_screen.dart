import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Pokémon'),
      ),
      body: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Project\n',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.apply(fontWeightDelta: 2, fontSizeFactor: 0.7),
              ),
              TextSpan(
                text: 'Pokémon',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.apply(fontWeightDelta: 2, fontSizeFactor: 1.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
