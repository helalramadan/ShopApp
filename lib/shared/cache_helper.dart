import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferenc;
  static init() async {
    // SharedPreferences.setMockInitialValues({});
    sharedPreferenc = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferenc!.setBool(key, value);
  }

  static bool? getBoolean({
    required String key,
  }) {
    return sharedPreferenc?.getBool(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferenc!.setString(key, value);

    if (value is int) return await sharedPreferenc!.setInt(key, value);
    if (value is bool) return await sharedPreferenc!.setBool(key, value);
    return await sharedPreferenc!.setDouble(key, value);
  }
}