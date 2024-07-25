import 'package:pokedex_petit/data/network/NetworkDataSource.dart';
import 'package:pokedex_petit/model/pokemon/PokemonMapper.dart';
import 'package:pokedex_petit/model/pokemon/PokemonResponse.dart';

import '../model/pokemon/PokemonDto.dart';

class DataSource {
  
  final NetworkDataSource networkDataSource = NetworkDataSource();
  
  Future<List<PokemonDto>> getPokemons() async {
    List<PokemonResponse> pokemonResponse = await networkDataSource.getPaginatedPokemons();
    
    return pokemonResponse.map((e) => PokemonMapper.pokemonResponseToDto(e)).toList();
  }
}