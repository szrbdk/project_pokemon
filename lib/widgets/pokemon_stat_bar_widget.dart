import 'package:flutter/material.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart'
    show BuildContextExtension;

class PokemonStatBarWidget extends StatelessWidget {
  const PokemonStatBarWidget({
    Key? key,
    required this.label,
    required this.value,
    this.barColor = Colors.blue,
    this.barBackgroundColor,
  }) : super(key: key);

  final String label;
  final double value;
  final Color barColor;
  final Color? barBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: context.theme.textTheme.subtitle1?.apply(
                  fontStyle: FontStyle.italic,
                  fontWeightDelta: 2,
                  fontSizeFactor: 0.8),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 5,
            child: LinearProgressIndicator(
              value: value / 100,
              minHeight: 10,
              backgroundColor: barBackgroundColor ?? Colors.grey.shade400,
              color: barColor,
            ),
          ),
        ],
      ),
    );
  }
}
