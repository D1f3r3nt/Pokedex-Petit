import 'package:pokedex_petit/model/search_pokemon/SearchPokemonDto.dart';
import 'package:pokedex_petit/model/search_pokemon/SearchPokemonUI.dart';

class SearchPokemonMapper {
  
  static SearchPokemonUI searchPokemonDtoToUI(SearchPokemonDto dto) {
    return SearchPokemonUI(
        name: dto.name, 
        id: SearchPokemonMapper._extractIdFromUrl(dto.url)
    );
  }

  static String _extractIdFromUrl(String url) {
    final regex = RegExp(r'\/(\d+)\/$');
    final match = regex.firstMatch(url);

    if (match != null && match.groupCount > 0) {
      return match.group(1)!;
    } else {
      throw ArgumentError('URL no válida: no se pudo encontrar el ID.');
    }
  }
}