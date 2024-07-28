import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/utils/StringUtils.dart';
import 'package:pokedex_petit/ui/route/router.dart';
import 'package:pokedex_petit/ui/theme/PokeColors.dart';
import 'package:pokedex_petit/ui/theme/PokeTextStyles.dart';

import '../../../../domain/utils/ColorUtils.dart';
import '../../../../model/pokemon/PokemonUI.dart';

class CardHome extends StatelessWidget {

  PokemonUI pokemon;

  CardHome({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, NavigationRouter.DETAIL, arguments: pokemon),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  PokeColors.of(pokemon.type),
                  ColorUtils.lightenColor(PokeColors.of(pokemon.type))
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
                      StringUtils.formatIdPokemon(pokemon.id),
                      style: PokeTextStyles.cardLabels,
                    ),
                    Text(
                      StringUtils.toCapitalize(pokemon.name),
                      style: PokeTextStyles.cardLabels,
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
}