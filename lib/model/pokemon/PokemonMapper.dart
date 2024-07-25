import 'package:pokedex_petit/model/pokemon/PokemonDto.dart';
import 'package:pokedex_petit/model/pokemon/PokemonResponse.dart';
import 'package:pokedex_petit/model/pokemon/PokemonUI.dart';

class PokemonMapper {
  static PokemonDto pokemonResponseToDto(PokemonResponse response) {
    return PokemonDto(
        abilities: response.abilities, 
        baseExperience: response.baseExperience, 
        forms: response.forms, 
        gameIndices: response.gameIndices, 
        height: response.height, 
        heldItems: response.heldItems,
        id: response.id, 
        isDefault: response.isDefault, 
        locationAreaEncounters: response.locationAreaEncounters, 
        moves: response.moves,
        name: response.name, 
        order: response.order, 
        pastTypes: response.pastTypes, 
        species: response.species, 
        sprites: response.sprites, 
        stats: response.stats, 
        types: response.types, 
        weight: response.weight
    );
  }
  
  static PokemonUI pokemonDtoToUI(PokemonDto dto) {
    return PokemonUI(
        name: dto.name, 
        id: dto.id, 
        image: dto.sprites.other?.home.frontDefault,
        elements: dto.types.map((e) => e.type.name).toList(), 
        weight: dto.weight,
        height: dto.height, 
        info: dto.stats
    );
  }
}