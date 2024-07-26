import 'package:flutter/material.dart';

class ColorUtils {
  static Color lightenColor(Color color, [double amount = 0.3]) {
    assert(amount >= 0 && amount <= 1, 'The amount should be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final lighterHsl = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return lighterHsl.toColor();
  }
}