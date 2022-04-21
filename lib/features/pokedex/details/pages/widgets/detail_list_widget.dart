import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/details/pages/widgets/pokemon_box_header.dart';
import 'package:pokedex/features/pokedex/details/pages/widgets/pokemon_detail_lore.dart';
import 'package:pokedex/features/pokedex/details/pages/widgets/pokemon_list_person.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget(
      {Key? key,
      required this.pokemon,
      required this.marginTop,
      required this.pokemons,
      required this.evolutions,
      required this.pageController,
      required this.onChangedPokemon,
      required this.onChangedEvolution
      })
      : super(key: key);

  final Pokemon pokemon;
  final double marginTop;
  final List<Pokemon> pokemons;
  final List<Pokemon> evolutions;
  final PageController pageController;
  final ValueChanged<Pokemon> onChangedPokemon;
  final ValueChanged<Pokemon> onChangedEvolution;

  @override
  Widget build(BuildContext context) {
    const double maxScale = 1;

    return Stack(
      children: [
        PokemonBoxHeader(
          marginTop: marginTop,
          pokemon: pokemon,
          height: 240,
        ),
        PokemonDetailLore(
          pokemon: pokemon,
          evolutions: evolutions,
          onChangedEvolution: onChangedEvolution,
        ),
        PokemonListPerson(
          top: marginTop * 1.5 * maxScale,
          pokemon: pokemon,
          pokemons: pokemons,
          pageController: pageController,
          onChangedPokemon: onChangedPokemon,
          maxScale: maxScale,
        )
      ],
    );
  }
}
