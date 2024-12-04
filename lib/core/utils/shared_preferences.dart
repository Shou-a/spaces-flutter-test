import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String isDarkModeIterator = "is_dark_mode";
  static const String languageCode = "language_code";

  static Future<SharedPreferences> get instance async =>
      _preferences ??= await SharedPreferences.getInstance();

  static SharedPreferences? _preferences;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences?> init() async {
    _preferences = await instance;
    return _preferences;
  }

  //sets
  static Future setBoolean(String key, bool value) async =>
      await _preferences!.setBool(key, value);

  static Future<bool> setDouble(String key, double value) async =>
      await _preferences!.setDouble(key, value);

  static Future<bool> setInt(String key, int value) async =>
      await _preferences!.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      await _preferences!.setString(key, value);

  static Future<bool> setStringList(String key, List<String> value) async =>
      await _preferences!.setStringList(key, value);

  //gets

  static bool? getBoolean(String key, {bool? def}) =>
      _preferences!.getBool(key) ?? def;

  static double? getDouble(String key, {double? def}) =>
      _preferences!.getDouble(key) ?? def;

  static int? getInt(String key, {int? def}) =>
      _preferences!.getInt(key) ?? def;

  // static String getString(String key) => _preferences!.getString(key) ?? 'N/A';
  static String? getString(String key, {String? def}) =>
      _preferences?.getString(key) ?? def;

  static List<String> getStringList(String key) =>
      _preferences!.getStringList(key) ?? [];

  //deletes..
  static Future<bool> remove(String key) async =>
      await _preferences!.remove(key);

  static void clearPref() {
    _preferences!.clear();
  }
}
