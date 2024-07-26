import 'package:flutter/material.dart';
import 'package:pokedex_petit/model/pokemon/PokemonUI.dart';
import 'package:pokedex_petit/ui/detail/components/molecule/HeaderSection.dart';
import 'package:pokedex_petit/ui/detail/components/molecule/InfoSection.dart';

class DetailPage_Body extends StatelessWidget {
  
  PokemonUI pokemon;

  DetailPage_Body({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSection(pokemon: pokemon),
        InfoSection(pokemon: pokemon)
      ],
    );
  }
}
