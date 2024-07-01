import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences? get preferences => _preferences;

  static Future<bool?> saveString(String key, String value) async {
    return await _preferences?.setString(key, value);
  }

  static String getString(String key, {required String defaultValue}) {
    return _preferences?.getString(key) ?? defaultValue;
  }

  static Future<bool?> saveInt(String key, int value) async {
    return await _preferences?.setInt(key, value);
  }

  static int getInt(String key, {required int defaultValue}) {
    return _preferences?.getInt(key) ?? defaultValue;
  }

  static Future<bool?> saveBool(String key, bool value) async {
    return await _preferences?.setBool(key, value);
  }

  static bool getBool(String key, {required bool defaultValue}) {
    return _preferences?.getBool(key) ?? defaultValue;
  }

  static Future<bool?> remove(String key) async {
    return await _preferences?.remove(key);
  }
}
