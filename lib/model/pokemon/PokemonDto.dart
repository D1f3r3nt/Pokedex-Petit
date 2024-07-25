import 'dart:convert';

import 'PokemonResponse.dart';

class PokemonDto {
  PokemonDto({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  List<Ability> abilities;
  int? baseExperience;
  List<Species> forms;
  List<GameIndex> gameIndices;
  int height;
  List<dynamic> heldItems;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  List<Move> moves;
  String name;
  int order;
  List<dynamic> pastTypes;
  Species species;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;
  int weight;

  factory PokemonDto.fromJson(String str) => PokemonDto.fromMap(json.decode(str));

  factory PokemonDto.fromMap(Map<String, dynamic> json) => PokemonDto(
    abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromMap(x))),
    baseExperience: json["base_experience"],
    forms: List<Species>.from(json["forms"].map((x) => Species.fromMap(x))),
    gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromMap(x))),
    height: json["height"],
    heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
    id: json["id"],
    isDefault: json["is_default"],
    locationAreaEncounters: json["location_area_encounters"],
    moves: List<Move>.from(json["moves"].map((x) => Move.fromMap(x))),
    name: json["name"],
    order: json["order"],
    pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
    species: Species.fromMap(json["species"]),
    sprites: Sprites.fromMap(json["sprites"]),
    stats: List<Stat>.from(json["stats"].map((x) => Stat.fromMap(x))),
    types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
    weight: json["weight"],
  );
}
