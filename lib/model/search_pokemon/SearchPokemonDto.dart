import 'dart:convert';

class SearchPokemonDto {
  SearchPokemonDto({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory SearchPokemonDto.fromJson(String str) => SearchPokemonDto.fromMap(json.decode(str));

  factory SearchPokemonDto.fromMap(Map<String, dynamic> json) => SearchPokemonDto(
    name: json["name"],
    url: json["url"],
  );
}