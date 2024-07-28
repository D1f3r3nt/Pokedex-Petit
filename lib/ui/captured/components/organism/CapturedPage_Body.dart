import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/CapturedService.dart';
import 'package:pokedex_petit/ui/captured/components/molecule/FilterSection.dart';

import '../../../components/molecule/ShowPokemons.dart';

class CapturedPage_Body extends StatelessWidget {
  const CapturedPage_Body({
    super.key,
    required this.capturedService,
  });

  final CapturedService capturedService;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, ),
      child: Column(
        children: [
          FilterSection(capturedService: capturedService),
          
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
