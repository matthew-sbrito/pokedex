import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/details/pages/widgets/detail_app_bar.dart';
import 'package:pokedex/features/pokedex/details/pages/widgets/detail_list_widget.dart';

class ArgumentsDetail {
  final List<Pokemon> pokemons;
  final Pokemon pokemon;

  ArgumentsDetail({required this.pokemons, required this.pokemon});
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.arguments}) : super(key: key);
  final ArgumentsDetail arguments;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Pokemon> _pokemons = [];

  late PageController pageController;
  late Pokemon _pokemon;
  late List<Pokemon> _evolutions;

  @override
  void initState() {
    _pokemon = widget.arguments.pokemon;
    _pokemons.addAll(widget.arguments.pokemons);
    _evolutions = _pokemon.evolutions;
    pageController = PageController(
      viewportFraction: .51,
      initialPage: _pokemons.indexOf(_pokemon),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height * 0.14;
    return Scaffold(
      body: Stack(
        children: [
          DetailAppBar(
            pokemon: _pokemon,
            size: size,
            goBack: () {
              Navigator.of(context).pop();
              setState(() {
                _pokemons = widget.arguments.pokemons;
              });
            },
          ),
          DetailListWidget(
            pokemon: _pokemon,
            evolutions: _evolutions,
            pokemons: _pokemons,
            marginTop: size,
            pageController: pageController,
            onChangedPokemon: (Pokemon pokemon) {
              setState(() {
                _pokemon = pokemon;
                _evolutions = pokemon.evolutions;
              });
            },
            onChangedEvolution: (Pokemon pokemon) {
              setState(() {
                int index = _pokemons.indexOf(_pokemon);
                List<Pokemon> evolutions = _pokemon.evolutions;
                pokemon.addEvolutions(evolutions);
                _pokemons.removeAt(index);
                _pokemons.insert(index, pokemon);
                _pokemon = pokemon;
              });
            },
          ),
        ],
      ),
    );
  }
}
