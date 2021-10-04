import 'package:flutter/material.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart'
    show BuildContextExtension;

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          title,
          style: context.theme.textTheme.headline6,
        ),
      ),
    );
  }
}
