import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/utils/StringUtils.dart';
import 'package:pokedex_petit/ui/detail/components/atom/CircularSlider.dart';
import 'package:pokedex_petit/ui/theme/PokeColors.dart';

import '../../../../model/pokemon/PokemonUI.dart';

class InfoSection extends StatelessWidget {
  PokemonUI pokemon;
  
  InfoSection({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final color = PokeColors.of(pokemon.type);
    
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  color: color
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                      child: Text(
                        StringUtils.toCapitalize(pokemon.type),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.monitor_weight, size: 30, color: color),
                      const SizedBox(width: 5,),
                      Text("${pokemon.weight} kg", style: TextStyle(fontSize: 17, color: color))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.height, size: 30, color: color),
                      const SizedBox(width: 5,),
                      Text("${pokemon.height} m", style: TextStyle(fontSize: 17, color: color))
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularSlider(stat: pokemon.info[0], color: PokeColors.of(pokemon.type)),
                      CircularSlider(stat: pokemon.info[1], color: PokeColors.of(pokemon.type)),
                      CircularSlider(stat: pokemon.info[2], color: PokeColors.of(pokemon.type)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularSlider(stat: pokemon.info[3], color: PokeColors.of(pokemon.type)),
                      CircularSlider(stat: pokemon.info[4], color: PokeColors.of(pokemon.type)),
                      CircularSlider(stat: pokemon.info[5], color: PokeColors.of(pokemon.type)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
