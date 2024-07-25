import 'package:flutter/cupertino.dart';
import 'package:pokedex_petit/data/DataSource.dart';

import '../model/pokemon/PokemonDto.dart';
import '../model/pokemon/PokemonMapper.dart';
import '../model/pokemon/PokemonUI.dart';

class PokemonService extends ChangeNotifier {
  
  final DataSource _dataSource = DataSource();

  List<PokemonUI> pokemons = [];
  
  PokemonService() {
    getPokemons();
  }

  getPokemons() async {
    List<PokemonDto> result = await _dataSource.getPokemons();

    this.pokemons = result
        .map((e) => PokemonMapper.pokemonDtoToUI(e))
        .toList();

    notifyListeners();
  }
  
}