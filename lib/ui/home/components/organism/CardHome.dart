import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/utils/StringUtils.dart';

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
              color: Colors.black, // TODO: Change correct color
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
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      StringUtils.toCapitalize(pokemon.name),
                      style: const TextStyle(
                        fontSize: 15,
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
  
  String formatIdPokemon(int id) {
    final String str = id.toString();
    
    return "#${str.padLeft(3, '0')}";
  }
}