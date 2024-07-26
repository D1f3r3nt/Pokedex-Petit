import 'package:flutter/material.dart';

import '../../../../domain/utils/StringUtils.dart';
import '../../../../model/pokemon/PokemonUI.dart';

class HeaderSection extends StatelessWidget {
  PokemonUI pokemon;
  
  HeaderSection({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  StringUtils.toCapitalize(pokemon.name),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),
                ),
              ],
            ),
            Image(
              image: NetworkImage(pokemon.image),
              fit: BoxFit.cover,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
