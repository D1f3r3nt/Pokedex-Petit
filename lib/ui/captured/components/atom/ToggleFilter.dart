import 'package:flutter/material.dart';
import 'package:pokedex_petit/ui/theme/PokeColors.dart';

class ToggleFilter extends StatelessWidget {
  const ToggleFilter({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isActive,
    required this.activeColor,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isActive;
  final Color activeColor;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          backgroundColor: WidgetStateProperty.all(isActive ? activeColor : Colors.transparent),
          foregroundColor: WidgetStateProperty.all(isActive ? Colors.white : Colors.black)
        ), 
        child: Text(label),
    );
  }
}
