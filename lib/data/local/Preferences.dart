import 'package:pokedex_petit/data/local/PreferencePointers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static List<String> _idCaptured = [];
  static List<String> _typeCaptured = [];

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> get idsCaptured {
    _idCaptured = _prefs.getStringList(PreferencePointers.ID_POINTER) ?? [];
    return _idCaptured;
  }

  static set idsCaptured(List<String> ids) {
    _idCaptured = ids;
    _prefs.setStringList(PreferencePointers.ID_POINTER, _idCaptured);
  }

  static List<String> get typeCaptured {
    _typeCaptured = _prefs.getStringList(PreferencePointers.TYPE_POINTER) ?? [];
    return _typeCaptured;
  }

  static set typeCaptured(List<String> type) {
    _typeCaptured = type;
    _prefs.setStringList(PreferencePointers.TYPE_POINTER, _typeCaptured);
  }
}