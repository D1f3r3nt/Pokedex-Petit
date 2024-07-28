import 'package:flutter/material.dart';
import 'package:pokedex_petit/ui/components/molecule/ShowPokemons.dart';

import '../../../../domain/PokemonService.dart';

class HomePage_Body extends StatelessWidget {
  const HomePage_Body({
    super.key,
    required this.pokemonService,
  });

  final PokemonService pokemonService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ShowPokemons(
          pokemons: pokemonService.pokemons,
          moreData: pokemonService.getPokemons,
          isLoading: pokemonService.isLoading,
      ),
    );
  }
}