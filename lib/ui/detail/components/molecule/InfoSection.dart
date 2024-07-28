import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/utils/StringUtils.dart';
import 'package:pokedex_petit/ui/detail/components/atom/CircularSlider.dart';
import 'package:pokedex_petit/ui/theme/PokeColors.dart';
import 'package:pokedex_petit/ui/theme/PokeTextStyles.dart';

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
                        style: PokeTextStyles.detailType,
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
                      Text("${pokemon.weight} kg", style: PokeTextStyles.detailValues(color))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.height, size: 30, color: color),
                      const SizedBox(width: 5,),
                      Text("${pokemon.height} m", style: PokeTextStyles.detailValues(color))
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularSlider(stat: pokemon.info[0], color: color),
                      CircularSlider(stat: pokemon.info[1], color: color),
                      CircularSlider(stat: pokemon.info[2], color: color),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularSlider(stat: pokemon.info[3], color: color),
                      CircularSlider(stat: pokemon.info[4], color: color),
                      CircularSlider(stat: pokemon.info[5], color: color),
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
