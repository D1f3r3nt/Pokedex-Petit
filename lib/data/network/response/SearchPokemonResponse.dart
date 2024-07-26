import 'dart:convert';

import 'package:pokedex_petit/model/search_pokemon/SearchPokemonDto.dart';

class SearchPokemonResponse {
  SearchPokemonResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<SearchPokemonDto> results;

  factory SearchPokemonResponse.fromJson(String str) => SearchPokemonResponse.fromMap(json.decode(str));

  factory SearchPokemonResponse.fromMap(Map<String, dynamic> json) => SearchPokemonResponse(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<SearchPokemonDto>.from(json["results"].map((x) => SearchPokemonDto.fromMap(x))),
  );
}