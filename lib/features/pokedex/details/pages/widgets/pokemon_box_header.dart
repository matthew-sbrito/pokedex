import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class PokemonBoxHeader extends StatelessWidget {
  const PokemonBoxHeader(
      {Key? key,
      required this.marginTop,
      required this.height,
      required this.pokemon})
      : super(key: key);
  final double marginTop;
  final double height;
  final Pokemon pokemon;

  TextStyle textStyle(double size) => TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: marginTop,
      left: 0,
      right: 0,
      height: height,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: textStyle(36),
                    ),
                  ),
                  Text(
                    '#${pokemon.number}',
                    style: textStyle(20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
