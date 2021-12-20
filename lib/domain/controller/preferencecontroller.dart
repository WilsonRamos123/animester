import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceController extends GetxController {
  RxBool _preferences = false.obs;

  bool get preferences => _preferences.value;

  newPreference(bool newValue) {
    _preferences.value = newValue;
    //print(_preferences.value);
  }

  // ignore: non_constant_identifier_names
  Future<void> save_data(_email, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _email);
    //await prefs.setString('password', _password);
    await prefs.setString('password', password);

    print(_email);
  }

  Future<void> save_data2(bool preferences) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //await prefs.setString('password', _password);
    await prefs.setBool('pref', preferences);
    //print(_preferences);
  }
}
