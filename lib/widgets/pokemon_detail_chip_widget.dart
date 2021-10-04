import 'package:flutter/material.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart'
    show BuildContextExtension, StringCasingExtension;

class PokemonDetailChipWidget<T> extends StatelessWidget {
  const PokemonDetailChipWidget({
    Key? key,
    required this.items,
    required this.nameFn,
    this.chipColor = Colors.indigoAccent,
    this.textColor = Colors.white,
    this.onTap,
  }) : super(key: key);

  final List<T> items;
  final String Function(T item) nameFn;
  final Color chipColor;
  final Color textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          children: [
            for (var item in items) ...[
              GestureDetector(
                onTap: onTap,
                child: Chip(
                  label: Text(nameFn(item).replaceAll('-', ' ').toTitleCase()),
                  backgroundColor: chipColor,
                  labelStyle: context.theme.textTheme.bodyText1
                      ?.apply(color: textColor),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
