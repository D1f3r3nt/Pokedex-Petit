import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static List<String> _idCaptured = [];

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> get idsCaptured {
    _idCaptured = _prefs.getStringList('ids') ?? [];
    return _idCaptured;
  }

  static set idsCaptured(List<String> ids) {
    _idCaptured = ids;
    _prefs.setStringList('ids', _idCaptured);
  }
}