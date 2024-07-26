import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/utils/StringUtils.dart';
import 'package:pokedex_petit/ui/theme/PokeColors.dart';

import '../../../../model/pokemon/PokemonUI.dart';

class CardHome extends StatelessWidget {

  PokemonUI pokemon;

  CardHome({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'details', arguments: pokemon),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  PokeColors.of(pokemon.type),
                  lightenColor(PokeColors.of(pokemon.type))
                ]
              ),
              borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  image: NetworkImage(pokemon.image), 
                  fit: BoxFit.cover,
                  height: 120,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatIdPokemon(pokemon.id),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      StringUtils.toCapitalize(pokemon.name),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }

  Color lightenColor(Color color, [double amount = 0.3]) {
    assert(amount >= 0 && amount <= 1, 'The amount should be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final lighterHsl = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return lighterHsl.toColor();
  }
  
  String formatIdPokemon(int id) {
    final String str = id.toString();
    
    return "#${str.padLeft(3, '0')}";
  }
}