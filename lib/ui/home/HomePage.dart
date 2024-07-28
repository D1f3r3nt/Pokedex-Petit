import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/CapturedService.dart';
import 'package:pokedex_petit/domain/PokemonService.dart';
import 'package:pokedex_petit/domain/ThemeService.dart';
import 'package:pokedex_petit/domain/utils/LabelsUtils.dart';
import 'package:pokedex_petit/ui/route/router.dart';
import 'package:pokedex_petit/ui/theme/PokeTextStyles.dart';
import 'package:provider/provider.dart';

import '../search/SearchPage.dart';
import 'components/organism/HomePage_Body.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {

    final pokemonService = Provider.of<PokemonService>(context);
    final capturedService = Provider.of<CapturedService>(context);
    final themeService = Provider.of<ThemeService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
            LabelsUtils.HOME_TITLE,
            style: PokeTextStyles.appBarTitle
        ),
        backgroundColor: themeService.mainColor,
        actions: [
          IconButton(
              onPressed: () {
                pokemonService.getSearchPokemons();
                
                showSearch(context: context, delegate: SearchPage());
              },
              icon: const Icon(Icons.search, color: Colors.white)
          ),
          IconButton(
              onPressed: () {
                capturedService.getCapturedPokemons();

                Navigator.pushNamed(context, NavigationRouter.CAPTURED);
              },
              icon: const Icon(Icons.bookmarks_rounded, color: Colors.white)
          )
        ],
      ),
      body: const SafeArea(
        child: HomePage_Body(),
      )
    );
  }
}