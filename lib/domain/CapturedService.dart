import 'package:flutter/cupertino.dart';
import 'package:pokedex_petit/model/pokemon/PokemonDto.dart';
import 'package:pokedex_petit/model/pokemon/PokemonMapper.dart';
import 'package:pokedex_petit/model/pokemon/PokemonUI.dart';

import '../data/DataSource.dart';
import '../model/enums/Filters.dart';

class CapturedService extends ChangeNotifier {
    final DataSource _dataSource = DataSource();
  
    List<PokemonUI> pokemons = [];
    List<int> pokemonsId = [];
    
    bool isAlphabeticFilter = false;
    bool isTypeFilter = false;
    
    CapturedService() {
      getCapturedPokemonsId();
    }
    
    getCapturedPokemons() async {
      List<PokemonDto> capturedPokemons = await _dataSource.getCapturedPokemons();
      
      pokemons = capturedPokemons
          .map((e) => PokemonMapper.pokemonDtoToUI(e))
          .toList();
      
      _filterPokemonsById();

      notifyListeners();
    }
    
    getCapturedPokemonsId() {
      pokemonsId = _dataSource.getCapturedPokemonsId();
      
      notifyListeners();
    }
    
    catchNewPokemon(int id, String type) {
      _dataSource.catchNewPokemon(id, type);
      
      getCapturedPokemonsId();
    }
    
    leaveOnePokemon(int id, String type) {
      _dataSource.leaveOnePokemon(id, type);

      getCapturedPokemonsId();
    }
    
    filterPokemons(Filters value) {
      if (value == Filters.ALPHABETIC) {
        isAlphabeticFilter = !isAlphabeticFilter;
        isTypeFilter = false;
      } else {
        isTypeFilter = !isTypeFilter;
        isAlphabeticFilter = false;
      }
      
      if (isAlphabeticFilter) {
        _filterPokemonsByName();
      } else if(isTypeFilter) {
        _filterPokemonsByType();
      } else {
        _filterPokemonsById();
      }
      
      notifyListeners();
    }
    
    _filterPokemonsById() {
      pokemons.sort((a, b) => a.id.compareTo(b.id));
    }

    _filterPokemonsByName() {
      pokemons.sort((a, b) => a.name.compareTo(b.name));
    }

    _filterPokemonsByType() {
      pokemons.sort((a, b) => a.type.compareTo(b.type));
    }
}