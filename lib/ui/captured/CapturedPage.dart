import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/CapturedService.dart';
import 'package:provider/provider.dart';

class CapturedPage extends StatelessWidget {
  const CapturedPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final capturedService = Provider.of<CapturedService>(context);
    
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(capturedService.pokemons.map((e) => e.id).toList().toString())),
    );
  }
}
