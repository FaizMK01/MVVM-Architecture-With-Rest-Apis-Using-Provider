import 'package:flutter/cupertino.dart';
import 'package:mvvm_with_provider/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  // Save user token in shared preferences
  Future<bool?> saveUser(LoginModel loginModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool result = await sp.setString("token", loginModel.token ?? "");
    print("Token saved: ${loginModel.token}"); // Debug statement
    notifyListeners();
    return result;
  }

  // Retrieve user token from shared preferences
  Future<LoginModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final String? data = sp.getString("token");
    print("Token retrieved: $data"); // Debug statement
    return LoginModel(
      token: data ?? '',
    );
  }

  // Remove user token from shared preferences
  Future<void> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove("token");
    print("Token removed"); // Debug statement
    notifyListeners();
  }
}
