import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/CapturedService.dart';

import '../../../../model/enums/Filters.dart';
import '../atom/ToggleFilter.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
    required this.capturedService,
  });

  final CapturedService capturedService;
  
  @override
  Widget build(BuildContext context) {
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
          ),
          const SizedBox(width: 12),
          ToggleFilter(
            label: "Type",
            onPressed: () => capturedService.filterPokemons(Filters.TYPE),
            isActive: capturedService.isTypeFilter,
          )
        ],
      ),
    );
  }
}
