import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  SharedPreferences _sharedPreferences;
  static const String AUTH_TOKEN = "AUTH_TOKEN";
  static const String PROFILE = "PROFILE";

  SharedPreferencesUtil() {
    init();
  }

  void init() async {
    this._sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPreferences get instance => _sharedPreferences;
}
