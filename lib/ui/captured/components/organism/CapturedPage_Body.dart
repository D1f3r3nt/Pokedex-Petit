import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/CapturedService.dart';
import 'package:pokedex_petit/ui/captured/components/molecule/FilterSection.dart';
import 'package:provider/provider.dart';

import '../../../components/molecule/ShowPokemons.dart';

class CapturedPage_Body extends StatelessWidget {
  const CapturedPage_Body({super.key});
  
  @override
  Widget build(BuildContext context) {
    final capturedService = Provider.of<CapturedService>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, ),
      child: Column(
        children: [
          const FilterSection(),
          
          Expanded(
            child: ShowPokemons(
              pokemons: capturedService.pokemons,
              moreData: () => {},
              isLoading: false,
            ),
          ),
        ],
      ),
    );
  }
}
