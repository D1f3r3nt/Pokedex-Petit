import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/DetailService.dart';
import 'package:pokedex_petit/domain/utils/StringUtils.dart';
import 'package:pokedex_petit/model/pokemon/PokemonUI.dart';
import 'package:pokedex_petit/ui/components/atom/Progress.dart';
import 'package:pokedex_petit/ui/detail/components/organism/DetailPage_Body.dart';
import 'package:pokedex_petit/ui/theme/PokeColors.dart';
import 'package:provider/provider.dart';

import '../../domain/CapturedService.dart';
import '../../domain/ThemeService.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;
    final detailService = Provider.of<DetailService>(context);
    final capturedService = Provider.of<CapturedService>(context);
    final themeService = Provider.of<ThemeService>(context);
    
    if (argument is String) {
      detailService.getPokemonById(argument);
    } else if (argument is PokemonUI) {
      detailService.setPokemonUI(argument);
    } else {
      Navigator.pop(context);
    }
    
    return detailService.pokemon != null ?
      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(StringUtils.formatIdPokemon(detailService.pokemon!.id)),
          centerTitle: true,
          actions: [
            // Miramos si ya esta guardado
            !capturedService.pokemonsId.any((id) => id == detailService.pokemon!.id) ?
              IconButton(
                  onPressed: () {
                    capturedService.catchNewPokemon(detailService.pokemon!.id, detailService.pokemon!.type);
                    themeService.calculateMainColor();
                  },
                  icon: const Icon(Icons.save_outlined, color: Colors.white)
              )
            : 
              IconButton(
                  onPressed: () {
                    capturedService.leaveOnePokemon(detailService.pokemon!.id, detailService.pokemon!.type);
                    themeService.calculateMainColor();
                  },
                  icon: const Icon(Icons.save, color: Colors.white)
              )
          ],
          backgroundColor: PokeColors.of(detailService.pokemon!.type),
        ),
        backgroundColor: PokeColors.of(detailService.pokemon!.type),
        body: DetailPage_Body(pokemon: detailService.pokemon!),
      )
    :
      const Scaffold(
        body: Progress(),
      );
  }
}
