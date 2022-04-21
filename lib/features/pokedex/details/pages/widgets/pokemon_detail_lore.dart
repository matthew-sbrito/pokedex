import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/details/pages/widgets/pokemon_evolutions.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonDetailLore extends StatelessWidget {
  const PokemonDetailLore(
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
    return SlidingSheet(
      elevation: 1,
      cornerRadius: 24,
      snapSpec: const SnapSpec(
        snap: true,
        snappings: [.6, .8, .9],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      builder: (context, state) {
        return  Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: PokemonEvolutions(
              pokemon: pokemon,
              onChangedEvolution: onChangedEvolution,
              evolutions: evolutions,
            ),
          ),
        );
      },
    );
  }
}
