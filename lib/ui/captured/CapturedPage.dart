import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/CapturedService.dart';
import 'package:pokedex_petit/ui/captured/components/organism/CapturedPage_Body.dart';
import 'package:pokedex_petit/ui/theme/PokeColors.dart';
import 'package:provider/provider.dart';

class CapturedPage extends StatelessWidget {
  const CapturedPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final capturedService = Provider.of<CapturedService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Captured"),
        backgroundColor: PokeColors.officialRed,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(child: 
        CapturedPage_Body(capturedService: capturedService)
      ),
    );
  }
}
