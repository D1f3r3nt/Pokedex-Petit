import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/PokemonService.dart';
import 'package:provider/provider.dart';

import 'components/organism/CardHome.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {

    final pokemonService = Provider.of<PokemonService>(context);
    
    return Scaffold(
      body: pokemonService.pokemons.isNotEmpty ?
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: pokemonService.pokemons.length,
            itemBuilder: (BuildContext ctx, index) {
              final pokemon = pokemonService.pokemons[index];
              return CardHome(pokemon: pokemon);
            }
        )
      : const Center(child: CircularProgressIndicator())
    );
  }
}