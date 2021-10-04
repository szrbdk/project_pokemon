import 'package:flutter/material.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart'
    show BuildContextExtension;

class PokemonPhysicalAttributesWidget extends StatelessWidget {
  const PokemonPhysicalAttributesWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
  }) : super(key: key);

  final String title;
  final int value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.theme.textTheme.headline6?.apply(
              fontSizeFactor: 0.7,
              fontWeightDelta: 2,
              color: Colors.black.withOpacity(0.6)),
        ),
        Text(
          '$value',
          style: context.theme.textTheme.headline6?.apply(fontSizeFactor: 0.9),
        ),
        Text(
          unit,
          style: context.theme.textTheme.caption
              ?.apply(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
