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

  List<String> getCapturedPokemonsType() {
    return Preferences.typeCaptured;
  }
  
  Future<List<PokemonDto>> getCapturedPokemons() async {
    List<int> ids = getCapturedPokemonsId();
    List<PokemonResponse> pokemonResponse = await networkDataSource.getFewPokemonById(ids);

    return pokemonResponse.map((e) => PokemonMapper.pokemonResponseToDto(e)).toList();
  }
  
  void catchNewPokemon(int id, String type) {
    List<String> ids = Preferences.idsCaptured;
    ids.add(id.toString());

    List<String> types = Preferences.typeCaptured;
    types.add(type);
    
    Preferences.idsCaptured = ids;
    Preferences.typeCaptured = types;
  }

  void leaveOnePokemon(int id, String type) {
    List<String> ids = Preferences.idsCaptured;
    ids.remove(id.toString());

    List<String> types = Preferences.typeCaptured;
    types.remove(type);

    Preferences.idsCaptured = ids;
    Preferences.typeCaptured = types;
  }
}