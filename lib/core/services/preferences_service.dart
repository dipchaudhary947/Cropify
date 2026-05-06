import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  late SharedPreferencesAsync _preferences;

  static PreferencesService instance = PreferencesService._internal();
  PreferencesService._internal();

  void init() {
    _preferences = SharedPreferencesAsync();
  }

  Future<void> setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    return await _preferences.getBool(key);
  }
}
