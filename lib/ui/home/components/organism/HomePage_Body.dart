import 'package:flutter/material.dart';
import 'package:pokedex_petit/ui/components/molecule/ShowPokemons.dart';
import 'package:provider/provider.dart';

import '../../../../domain/PokemonService.dart';

class HomePage_Body extends StatelessWidget {
  const HomePage_Body({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonService = Provider.of<PokemonService>(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ShowPokemons(
          pokemons: pokemonService.pokemons,
          moreData: () {
            if (!pokemonService.isLoading) {
              pokemonService.getPokemons();
            }
          },
          isLoading: pokemonService.isLoading,
      ),
    );
  }
}