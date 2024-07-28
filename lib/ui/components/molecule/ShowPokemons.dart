import 'package:flutter/material.dart';
import 'package:pokedex_petit/ui/components/atom/Progress.dart';

import '../../../model/pokemon/PokemonUI.dart';
import '../../home/components/atom/CardHome.dart';

class ShowPokemons extends StatefulWidget {
  
  List<PokemonUI> pokemons;
  VoidCallback moreData;
  bool isLoading;
  
  ShowPokemons({
    super.key, 
    required this.pokemons,
    required this.moreData,
    required this.isLoading
  });

  @override
  State<ShowPokemons> createState() => _ShowPokemonsState();
}

class _ShowPokemonsState extends State<ShowPokemons> {

  final ScrollController _scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
         widget.moreData();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return widget.pokemons.isNotEmpty ?
      Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                controller: _scrollController,
                itemCount: widget.pokemons.length,
                itemBuilder: (BuildContext ctx, index) {
                  final pokemon = widget.pokemons[index];
                  
                  return CardHome(pokemon: pokemon);
                }
            ),
          ),
          if(widget.isLoading) const Progress()
        ],
      )
      : const Center(child: CircularProgressIndicator());
  }
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
