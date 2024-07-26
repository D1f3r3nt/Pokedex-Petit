import 'package:flutter/material.dart';

class SearcherPokemon extends StatelessWidget {
  const SearcherPokemon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.redAccent,
        prefixIcon: Icon(Icons.search, color: Colors.white),
        hintText: "Search Pokemon",
        hintStyle: TextStyle(
            color: Colors.white70
        ),
      ),
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
      ),

    );
  }
}