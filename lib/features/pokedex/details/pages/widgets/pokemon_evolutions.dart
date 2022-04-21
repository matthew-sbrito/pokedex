import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class PokemonEvolutions extends StatelessWidget {
  const PokemonEvolutions(
      {Key? key,
      required this.pokemon,
      required this.evolutions,
      required this.onChangedEvolution})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> evolutions;
  final ValueChanged<Pokemon> onChangedEvolution;

  @override
  Widget build(BuildContext context) {
    // testing integration android studio with github
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          const Text('Evolutions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: evolutions.map(getItemPokemon).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget getItemPokemon(Pokemon pokemon) {
    final bool currentPokemon = pokemon.number == this.pokemon.number;

    return GestureDetector(
      onTap: () => onChangedEvolution(pokemon),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: pokemon.baseColor?.withOpacity(currentPokemon ? .8 : 0.4),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(pokemon.image, width: 50, height: 50),
            const SizedBox(height: 5),
            Flexible(
              child: Text(
                pokemon.name,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
