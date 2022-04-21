import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({Key? key, required this.pokemon, required this.size, required this.goBack})
      : super(key: key);
  final Pokemon pokemon;
  final double size;
  final VoidCallback goBack;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        right: 0,
        left: 0,
        height: size,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: pokemon.baseColor,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 4),
                  child: IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    onPressed: goBack,
                  ),
                ),
              ]),
        ));
  }
}
