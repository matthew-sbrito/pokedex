import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String name;
  final String number;
  final List<String> types;
  final List<String> previousEvolutionsId;
  final List<String> nextEvolutionsId;
  final List<Pokemon> evolutions = [];

  Color? get baseColor => _color(type: types[0]);
  String get image => 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$number.png';

  static List<String> getFromJSON(Map<String, dynamic> json, String field) {
    final List fieldList =
        json[field] != null ? (json[field] as List<dynamic>) : [];
    return fieldList.isNotEmpty
        ? fieldList.map((item) => item["num"] as String).toList()
        : [];
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json["name"],
      number: json["num"],
      types: (json["type"] as List<dynamic>).map((e) => e as String).toList(),
      nextEvolutionsId: getFromJSON(json, "next_evolution"),
      previousEvolutionsId: getFromJSON(json, "prev_evolution"),
    );
  }

  void addEvolution(Pokemon pokemon) {
    evolutions.add(pokemon);
  }

  void addEvolutions(List<Pokemon> pokemons) {    
    if (evolutions.isEmpty) {
      evolutions.addAll(pokemons);
    }
  }

  Pokemon(
      {required this.id,
      required this.name,
      required this.number,
      required this.types,
      required this.previousEvolutionsId,
      required this.nextEvolutionsId});

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
