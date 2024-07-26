import 'package:flutter/cupertino.dart';
import 'package:pokedex_petit/model/pokemon/PokemonDto.dart';
import 'package:pokedex_petit/model/pokemon/PokemonMapper.dart';
import 'package:pokedex_petit/model/pokemon/PokemonUI.dart';

import '../data/DataSource.dart';

class DetailService extends ChangeNotifier {

  final DataSource _dataSource = DataSource();
  
  PokemonUI? pokemon;
  
  setPokemonUI(PokemonUI? pokemonUI) {
    pokemon = pokemonUI;
    
    notifyListeners();
  }
  
  getPokemonById(String id) async {
    
    PokemonDto pokemonById = await _dataSource.getPokemonById(int.parse(id));
    
    PokemonUI pokemonUI = PokemonMapper.pokemonDtoToUI(pokemonById);
    
    setPokemonUI(pokemonUI);
  }
}