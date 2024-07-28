import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/PokemonService.dart';
import 'package:pokedex_petit/domain/utils/StringUtils.dart';
import 'package:pokedex_petit/model/search_pokemon/SearchPokemonUI.dart';
import 'package:provider/provider.dart';

class SearchPage extends SearchDelegate<SearchPokemonUI> {
  List<SearchPokemonUI> pokemon = [];
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = "", icon: const Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    final SearchPokemonUI emptyPokemon = SearchPokemonUI(name: "name", id: "id");
    
    return IconButton(onPressed: () => close(context, emptyPokemon), icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {

    return ListView.builder(itemBuilder: (_, index) {
      return ListTile(
        onTap: () => handleOnTap(context, pokemon[index]),
        title: handleTitle(pokemon[index]),
      );},
      itemCount: pokemon.length,
    );
  }
  
  // Los resultados ha medida que se va escribiendo
  @override
  Widget buildSuggestions(BuildContext context) {
    final PokemonService pokemonService = Provider.of(context);

    pokemon = pokemonService.searchPokemons.where((element) => RegExp(query, caseSensitive: false).hasMatch(element.name)).toList();

    return ListView.builder(
      itemBuilder: (_, index) {
        return ListTile(
          onTap: () => handleOnTap(context, pokemon[index]),
          title: handleTitle(pokemon[index]),
        );
      },
      itemCount: pokemon.length,
    );
  }
  
  Widget handleTitle(SearchPokemonUI pokemon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(StringUtils.formatIdPokemon(int.parse(pokemon.id))),
        Text(StringUtils.toCapitalize(pokemon.name))
      ],
    );
  }
  
  handleOnTap(BuildContext context,SearchPokemonUI pokemon) {
    Navigator.pushNamed(context, 'detail', arguments: pokemon.id);
  }
}