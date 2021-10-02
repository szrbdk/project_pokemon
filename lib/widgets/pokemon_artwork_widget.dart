import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonArtWorkWidget extends StatelessWidget {
  const PokemonArtWorkWidget(
      {Key? key, required this.artwork, required this.size})
      : super(key: key);

  final String artwork;
  final double size;

  bool get isSvg => artwork.endsWith('svg');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: isSvg
          ? SvgPicture.network(artwork)
          : CachedNetworkImage(imageUrl: artwork),
    );
  }
}
