import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/details/pages/detail_page.dart';
import 'package:pokedex/features/pokedex/home/pages/widgets/pokemon_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list}) : super(key: key);

  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    Widget getItemPokemon(Pokemon pokemon) => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          transform: Matrix4.translationValues(0, .5, 1),
          child: PokemonItemWidget(
            pokemon: pokemon,
            onTap: () => Navigator.of(context).pushNamed('/details',
                arguments: ArgumentsDetail(pokemons: list, pokemon: pokemon)),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Pokedex',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: list.map(getItemPokemon).toList()),
      ),
    );
  }
}
