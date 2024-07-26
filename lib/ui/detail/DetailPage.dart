import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/DetailService.dart';
import 'package:pokedex_petit/domain/utils/StringUtils.dart';
import 'package:pokedex_petit/model/pokemon/PokemonUI.dart';
import 'package:pokedex_petit/ui/components/Progress.dart';
import 'package:pokedex_petit/ui/detail/components/organism/DetailPage_Body.dart';
import 'package:pokedex_petit/ui/theme/PokeColors.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;
    final detailService = Provider.of<DetailService>(context);
    
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
            IconButton(
                onPressed: () {
                  // TODO: Save pokemon id
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
