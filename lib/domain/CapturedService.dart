import 'package:flutter/cupertino.dart';
import 'package:pokedex_petit/model/pokemon/PokemonDto.dart';
import 'package:pokedex_petit/model/pokemon/PokemonMapper.dart';
import 'package:pokedex_petit/model/pokemon/PokemonUI.dart';

import '../data/DataSource.dart';

class CapturedService extends ChangeNotifier {
    final DataSource _dataSource = DataSource();
  
    List<PokemonUI> pokemons = [];
    List<int> pokemonsId = [];
    
    CapturedService() {
      getCapturedPokemonsId();
    }
    
    getCapturedPokemons() async {
      List<PokemonDto> capturedPokemons = await _dataSource.getCapturedPokemons();
      
      pokemons = capturedPokemons.map((e) => PokemonMapper.pokemonDtoToUI(e)).toList();
      
      notifyListeners();
    }
    
    getCapturedPokemonsId() {
      pokemonsId = _dataSource.getCapturedPokemonsId();
      
      notifyListeners();
    }
    
    catchNewPokemon(int id) {
      _dataSource.catchNewPokemon(id);
      
      getCapturedPokemonsId();
    }
    
    leaveOnePokemon(int id) {
      _dataSource.leaveOnePokemon(id);

      getCapturedPokemonsId();
    }
}