import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_pokemon/generated/l10n.dart';
import 'package:project_pokemon/utilities/blocs/app_config_bloc/app_config_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _listItems = _items(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).settings)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.separated(
          itemCount: _listItems.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (_, index) => _listItems[index],
        ),
      ),
    );
  }

  List<Widget> _items(BuildContext context) {
    return [
      ListTile(
        title: Text(S.of(context).language),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            builder: (context) {
              return const LanguageSelectorBottomSheet();
            },
          ).then((value) {
            if (value is Locale) {
              setState(() {
                S.load(value);
                context.read<AppConfigBloc>().add(LocaleChangedEvent(value));
              });
            }
          });
        },
      )
    ];
  }
}

class LanguageSelectorBottomSheet extends StatelessWidget {
  const LanguageSelectorBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        var items = S.delegate.supportedLocales;
        return ListView.separated(
          itemCount: items.length,
          shrinkWrap: true,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final bool isCurrent =
                Intl.getCurrentLocale() == items[index].languageCode;
            return ListTile(
              title:
                  Text(S.of(context).language_name(items[index].languageCode)),
              trailing: isCurrent
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : null,
              onTap: !isCurrent
                  ? () {
                      Navigator.pop(context, items[index]);
                    }
                  : null,
            );
          },
        );
      },
    );
  }
}
