import 'package:shared_preferences/shared_preferences.dart';

class ReferentSetting {
  Future<void> setPhone(String phoneNumber) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('phone', phoneNumber);
  }

  Future<void> setRadius(double radius) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setDouble('radius', radius);
  }

  Future<String> getPhone() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('phone' ?? '969551162');
  }

  Future<double> getRadius() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble('radius' ?? 0);
  }
}
