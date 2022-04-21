import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/details/pages/widgets/pokemon_person_tile.dart';

class PokemonListPerson extends StatelessWidget {
  const PokemonListPerson(
      {Key? key,
      required this.top,
      required this.maxScale,
      required this.pokemon,
      required this.pokemons,
      required this.pageController,
      required this.onChangedPokemon})
      : super(key: key);

  final double top;
  final double maxScale;
  final Pokemon pokemon;
  final List<Pokemon> pokemons;
  final PageController pageController;
  final ValueChanged<Pokemon> onChangedPokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: top,
      child: SizedBox(
        height: 170,
        width: double.infinity,
        child: PageView(
          onPageChanged: (index) => onChangedPokemon(pokemons[index]),
          controller: pageController,
          children: pokemons.map(pokemonPerson).toList(),
        ),
      ),
    );
  }

  PokemonPersonTile pokemonPerson(e) => PokemonPersonTile(
        pokemon: e,
        currentPokemon: e == pokemon,
        maxScale: maxScale,
      );
}
