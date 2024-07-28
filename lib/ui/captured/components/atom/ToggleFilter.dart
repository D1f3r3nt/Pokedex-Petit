import 'package:flutter/material.dart';
import 'package:pokedex_petit/ui/theme/PokeColors.dart';

class ToggleFilter extends StatelessWidget {
  const ToggleFilter({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isActive,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isActive;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          backgroundColor: WidgetStateProperty.all(isActive ? PokeColors.officialRed : Color(0xFFC5C5C5)),
          foregroundColor: WidgetStateProperty.all(Colors.white)
        ), 
        child: Text(label),
    );
  }
}
