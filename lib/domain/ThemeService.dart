import 'package:flutter/cupertino.dart';

import '../data/DataSource.dart';
import '../ui/theme/PokeColors.dart';

// TODO: Crear clases globales de los Strings

class ThemeService extends ChangeNotifier {
  final DataSource _dataSource = DataSource();

  List<String> types = [];
  Color mainColor = PokeColors.officialRed;
  
  ThemeService() {
    calculateMainColor();
  }
  
  _getCapturedTypes() {
    types = _dataSource.getCapturedPokemonsType();
  }
  
  calculateMainColor() {
    _getCapturedTypes();
    
    String? mostType = _mostFrequentString(types);
    
    mainColor = mostType != null ? PokeColors.of(mostType) : PokeColors.officialRed;
    
    notifyListeners();
  }
  
  String? _mostFrequentString(List<String> types) {
    if (types.isEmpty) return null;

    Map<String, int> frequencyMap = {};
    String? mostFrequent;
    int maxCount = 0;
    bool tie = false;

    // Populate the frequency map
    for (String type in types) {
      if (frequencyMap.containsKey(type)) {
        frequencyMap[type] = frequencyMap[type]! + 1;
      } else {
        frequencyMap[type] = 1;
      }
    }

    // Find the most frequent type
    frequencyMap.forEach((key, value) {
      if (value > maxCount) {
        mostFrequent = key;
        maxCount = value;
        tie = false;
      } else if (value == maxCount) {
        tie = true;
      }
      
      // If value is under maxCount forget it
    });

    // If there is a tie return null, if not return type
    return tie ? null : mostFrequent;
  }
}