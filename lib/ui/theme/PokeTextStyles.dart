import 'dart:ui';

import 'package:flutter/material.dart';

class PokeTextStyles {
  static TextStyle appBarTitle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold
  );

  static TextStyle cardLabels = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
    color: Colors.white,
  );

  static TextStyle detailHeaderName = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 30
  );
  
  static TextStyle detailType = const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle detailValues(Color color) => TextStyle(fontSize: 17, color: color);

  static TextStyle circularSliderHeader(Color color) => TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: color
  );

  static TextStyle circularSliderValue(Color color) => TextStyle(
    fontSize: 15,
    color: color,
  );
}