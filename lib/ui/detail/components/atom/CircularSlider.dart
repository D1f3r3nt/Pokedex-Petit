import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/utils/ColorUtils.dart';
import 'package:pokedex_petit/ui/theme/PokeTextStyles.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../../model/pokemon/PokemonResponse.dart';

class CircularSlider extends StatelessWidget {
  const CircularSlider({
    super.key,
    required this.stat,
    required this.color
  });

  final Stat stat;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final superLight = ColorUtils.lightenColor(color, 0.3);
    final lightColor = ColorUtils.lightenColor(color, 0.1);
    
    return SleekCircularSlider(
      initialValue: stat.baseStat.toDouble(),
      max: 250,
      innerWidget: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              formatSliderText(stat.stat.name.toUpperCase()), 
              style: PokeTextStyles.circularSliderHeader(color),
          ),
          Text(
              "${stat.baseStat}", 
              style: PokeTextStyles.circularSliderValue(lightColor),
          )
        ],
      ),
      appearance: CircularSliderAppearance(
          customColors: CustomSliderColors(
              progressBarColor: color,
              trackColor: superLight,
          ),
          size: 100,
          customWidths: CustomSliderWidths(
              trackWidth: 5,
              handlerSize: 0,
              progressBarWidth: 5,
              shadowWidth: 0
          ),
          animDurationMultiplier: 2
      ),
    );
  }
  
  String formatSliderText(String str) {
    return str.replaceAll("ATTACK", "ATT").replaceAll("DEFENSE", "DEF").replaceAll("SPECIAL", "SP.").replaceAll("-", " ");
  }
}