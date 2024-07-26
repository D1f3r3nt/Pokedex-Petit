import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/PokemonService.dart';
import 'package:pokedex_petit/ui/theme/PokeColors.dart';
import 'package:provider/provider.dart';

import 'components/organism/HomePage_Body.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {

    final pokemonService = Provider.of<PokemonService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Pokedex",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
        ),
        backgroundColor: PokeColors.officialRed,
      ),
      body: SafeArea(
        child: HomePage_Body(pokemonService: pokemonService),
      )
    );
  }
}