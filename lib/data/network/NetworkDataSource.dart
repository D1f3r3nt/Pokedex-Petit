import 'package:http/http.dart' as http;
import 'package:pokedex_petit/data/network/response/SearchPokemonResponse.dart';
import '../../model/pokemon/PokemonResponse.dart';

class NetworkDataSource {
  final _baseUrl = "pokeapi.co";
  final int _all = 152;
  final int _pagination = 21;
  
  int _offset = 0;
  int _limit = 0;
  
  Future<List<PokemonResponse>> _getPokemons() async {
    List<PokemonResponse> result = [];
    
    for (int i = _offset; i < _limit; i++) {
      var url = Uri.https(_baseUrl, '/api/v2/pokemon/$i/');

      var response = await http.get(url);

      final newPokemon = PokemonResponse.fromJson(response.body);
      result.add(newPokemon);
    }
    
    return result;
  }
  
  Future<SearchPokemonResponse> getSearchPokemons() async {
    var url = Uri.https(_baseUrl, '/api/v2/pokemon', {
      "limit" : _all.toString()
    });

    var response = await http.get(url);

    return SearchPokemonResponse.fromJson(response.body);
  }
  
  Future<PokemonResponse> getPokemonById(int id) async {
    var url = Uri.https(_baseUrl, '/api/v2/pokemon/$id/');

    var response = await http.get(url);

    return PokemonResponse.fromJson(response.body);
  }

  Future<List<PokemonResponse>> getPaginatedPokemons() async {
    if (_offset == 0 && _limit == 0) {
      _offset = 1;
      _limit = _pagination;
    } else if (_limit < 121) {
      _offset = _limit;
      _limit += _pagination - 1;
    } else if(_limit >= _all) {
      _offset = _all;
      _limit = _all;
    } else if (_limit < _all) {
      _offset = _limit;
      _limit = _all;
    }
    
    return _getPokemons();
  }
}