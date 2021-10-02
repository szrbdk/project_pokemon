import 'package:flutter/material.dart';
import 'package:project_pokemon/generated/l10n.dart';
import 'package:project_pokemon/ui/settings/settings_screen.dart';

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
        title: Text(S.of(context).project_pokemon),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '${S.of(context).project}\n',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.apply(fontWeightDelta: 2, fontSizeFactor: 0.7),
                    ),
                    TextSpan(
                      text: S.of(context).pokemon,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.apply(fontWeightDelta: 2, fontSizeFactor: 1.4),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(S.of(context).settings),
              onTap: () {
                Navigator.of(context)
                    .push(
                        MaterialPageRoute(builder: (_) => const SettingsPage()))
                    .then((value) {
                  setState(() {});
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
