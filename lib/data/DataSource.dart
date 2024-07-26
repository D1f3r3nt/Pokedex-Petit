import 'package:pokedex_petit/data/local/Preferences.dart';
import 'package:pokedex_petit/data/network/NetworkDataSource.dart';
import 'package:pokedex_petit/data/network/response/SearchPokemonResponse.dart';
import 'package:pokedex_petit/model/pokemon/PokemonMapper.dart';
import 'package:pokedex_petit/model/pokemon/PokemonResponse.dart';
import 'package:pokedex_petit/model/search_pokemon/SearchPokemonDto.dart';

import '../model/pokemon/PokemonDto.dart';

class DataSource {
  
  final NetworkDataSource networkDataSource = NetworkDataSource();
  
  Future<List<PokemonDto>> getPokemons() async {
    List<PokemonResponse> pokemonResponse = await networkDataSource.getPaginatedPokemons();
    
    return pokemonResponse.map((e) => PokemonMapper.pokemonResponseToDto(e)).toList();
  }

  Future<List<SearchPokemonDto>> getSearchPokemons() async {
    SearchPokemonResponse searchPokemonResponse = await networkDataSource.getSearchPokemons();

    return searchPokemonResponse.results;
  }

  Future<PokemonDto> getPokemonById(int id) async {
    PokemonResponse pokemon = await networkDataSource.getPokemonById(id);

    return PokemonMapper.pokemonResponseToDto(pokemon);
  }

  List<int> getCapturedPokemonsId() {
    return Preferences.idsCaptured.map((e) => int.parse(e)).toList();
  }
  
  Future<List<PokemonDto>> getCapturedPokemons() async {
    List<int> ids = getCapturedPokemonsId();
    List<PokemonResponse> pokemonResponse = await networkDataSource.getFewPokemonById(ids);

    return pokemonResponse.map((e) => PokemonMapper.pokemonResponseToDto(e)).toList();
  }
  
  void catchNewPokemon(int id) {
    List<String> ids = Preferences.idsCaptured;
    ids.add(id.toString());
    
    Preferences.idsCaptured = ids;
  }

  void leaveOnePokemon(int id) {
    List<String> ids = Preferences.idsCaptured;
    ids.remove(id.toString());

    Preferences.idsCaptured = ids;
  }
}