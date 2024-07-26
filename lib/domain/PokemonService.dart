import 'package:flutter/cupertino.dart';
import 'package:pokedex_petit/data/DataSource.dart';

import '../model/pokemon/PokemonDto.dart';
import '../model/pokemon/PokemonMapper.dart';
import '../model/pokemon/PokemonUI.dart';

class PokemonService extends ChangeNotifier {
  
  final DataSource _dataSource = DataSource();

  bool isLoading = false;
  List<PokemonUI> pokemons = [];
  
  PokemonService() {
    getPokemons();
  }

  getPokemons() async {
    isLoading = true;
    notifyListeners();
    
    List<PokemonDto> result = await _dataSource.getPokemons();

    pokemons.addAll(result
        .map((e) => PokemonMapper.pokemonDtoToUI(e))
        .toList());
    isLoading = false;
    notifyListeners();
  }
  
}