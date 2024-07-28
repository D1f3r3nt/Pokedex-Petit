import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static List<String> _idCaptured = [];
  static List<String> _typeCaptured = [];

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

  static List<String> get typeCaptured {
    _typeCaptured = _prefs.getStringList('type') ?? [];
    return _typeCaptured;
  }

  static set typeCaptured(List<String> type) {
    _typeCaptured = type;
    _prefs.setStringList('type', _typeCaptured);
  }
}