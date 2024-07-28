import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/CapturedService.dart';
import 'package:provider/provider.dart';

import '../../../../domain/ThemeService.dart';
import '../../../../model/enums/Filters.dart';
import '../atom/ToggleFilter.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});
  
  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final capturedService = Provider.of<CapturedService>(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.filter_alt),
          const SizedBox(width: 12),
          ToggleFilter(
            label: "A-Z",
            onPressed: () => capturedService.filterPokemons(Filters.ALPHABETIC),
            isActive: capturedService.isAlphabeticFilter,
            activeColor: themeService.mainColor,
          ),
          const SizedBox(width: 12),
          ToggleFilter(
            label: "Type",
            onPressed: () => capturedService.filterPokemons(Filters.TYPE),
            isActive: capturedService.isTypeFilter,
            activeColor: themeService.mainColor,
          )
        ],
      ),
    );
  }
}
