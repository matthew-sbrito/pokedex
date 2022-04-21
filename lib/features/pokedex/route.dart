import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/details/pages/detail_page.dart';
import 'package:pokedex/features/pokedex/home/container/home_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({Key? key, required this.repository }) : super(key: key);
  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch(settings.name) {
          case '/details':
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => DetailPage(
                arguments: settings.arguments as ArgumentsDetail,
              ),              
            );
          default:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => HomeContainer(
                repository: repository,                
              )
            );
        }
             
      },
    );
  }
}
