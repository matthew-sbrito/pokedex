import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class PokemonPersonTile extends StatelessWidget {
  const PokemonPersonTile({
    Key? key,
    required this.pokemon,
    required this.currentPokemon,
    required this.maxScale,
  }) : super(key: key);

  final Pokemon pokemon;
  final bool currentPokemon;
  final double maxScale;

  static int animatedTime = 300;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: animatedTime),
      opacity: currentPokemon ? 1 : 0.4,
      child: AnimatedScale(
        duration: Duration(milliseconds: animatedTime),
        scale: currentPokemon ? maxScale : maxScale * .5,
        child:  Image.network(
            pokemon.image,
            color: currentPokemon ? null : Colors.black.withOpacity(0.4),
          ),
      ),
    );
  }
}
