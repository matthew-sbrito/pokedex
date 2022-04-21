import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/environments/env_api.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();

  Future<Pokemon> getPokemon(id);
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(EnvAPI.pokeapiURL);
      final responseBody = jsonDecode(response.data) as Map<String, dynamic>;
      final list = responseBody['pokemon'] as List<dynamic>;
      final listPokemons = list.map((item) => Pokemon.fromJson(item)).toList();
      return filteredPokemons(listPokemons);
    } catch (e) {
      debugPrint(e.toString());
      throw Failure(message: 'Não foi possível carregar os pokemons!');
    }
  }

  List<Pokemon> filteredPokemons(List<Pokemon> pokemons) {
    List<Pokemon> filtered = pokemons
        .where((pokemon) => pokemon.previousEvolutionsId.isEmpty)
        .toList();

    for (var element in filtered) {
      element.addEvolution(element);
      for (var id in element.nextEvolutionsId) {
        final pokemon = pokemons.firstWhere((pokemon) => pokemon.number == id);
        element.addEvolution(pokemon);
      }
    }
    return filtered;
  }

  @override
  Future<Pokemon> getPokemon(id) async {
    try {
      final response = await dio.get('${EnvAPI.pokeapiURL}/$id');
      final responseBody = jsonDecode(response.data) as Map<String, dynamic>;
      return Pokemon.fromJson(responseBody);
    } catch (e) {
      throw Failure(message: 'Não foi possível carregar o pokemon!');
    }
  }
}
