import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/home/pages/widgets/text_widget.dart';
import 'package:pokedex/features/pokedex/home/pages/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget(
      {Key? key, required this.pokemon, required this.onTap})
      : super(key: key);
  final Pokemon pokemon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: pokemon.baseColor!.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextWidget(pokemon.name),
                      ),
                      TextWidget('#${pokemon.number}', number: true),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.types
                            .map((type) => TypeWidget(type: type))
                            .toList(),
                      ),
                      const Flexible(
                          child: SizedBox(
                        height: 100,
                        width: 100,
                      )),                  
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12, 
            right: 5, 
            child: Image.network(pokemon.image, width: 100, height: 100),
          ),
        ],
      ),
    );
  }
}
