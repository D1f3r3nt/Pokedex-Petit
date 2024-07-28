import 'package:flutter/material.dart';
import 'package:pokedex_petit/ui/captured/components/organism/CapturedPage_Body.dart';
import 'package:provider/provider.dart';

import '../../domain/ThemeService.dart';

class CapturedPage extends StatelessWidget {
  const CapturedPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final themeService = Provider.of<ThemeService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Captured"),
        backgroundColor: themeService.mainColor,
        foregroundColor: Colors.white,
      ),
      body: const SafeArea(
          child: CapturedPage_Body()
      ),
    );
  }
}
