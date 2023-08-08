 import 'package:shared_preferences/shared_preferences.dart';

class sharedhelper {
  static SharedPreferences? shared;

  static init() async {
    shared = await SharedPreferences.getInstance();
  }

  static Future<bool> putbool(
      {required String key, required bool value}) async {
    return await shared!.setBool(key, value);
  }

  static bool? getBool({
    required String key,
  }) {
    return shared!.getBool(key);
  }

  static Future<bool> putString(
      {required String key, required String value}) async {
    return await shared!.setString(key, value);
  }

  static String? getString({
    required String key,
  }) {
    return shared!.getString(key);
  }
}
