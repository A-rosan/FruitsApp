import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;

  // Keys for SharedPreferences
  static const String isLoggedInKey = 'isLoggedIn';
  static const String userIdKey = 'userId';

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

//bool
  static setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  // Login state management
  // static Future<void> setLoggedIn(bool value) async {
  //   await _instance.setBool(isLoggedInKey, value);
  // }

  // static bool isLoggedIn() {
  //   return _instance.getBool(isLoggedInKey) ?? false;
  // }

  // // User ID management
  // static Future<void> setUserId(String userId) async {
  //   await _instance.setString(userIdKey, userId);
  // }

  // static String? getUserId() {
  //   return _instance.getString(userIdKey);
  // }

  // // Clear user session
  // static Future<void> clearUserSession() async {
  //   await _instance.remove(isLoggedInKey);
  //   await _instance.remove(userIdKey);
  // }
}
