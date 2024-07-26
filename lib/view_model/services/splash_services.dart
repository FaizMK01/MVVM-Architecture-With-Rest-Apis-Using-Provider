import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:mvvm_with_provider/model/login_model.dart';
import 'package:mvvm_with_provider/utils/routes/route_names.dart';
import 'package:mvvm_with_provider/view_model/user_view_model.dart';

class SplashServices {
  // Fetch user data
  Future<LoginModel> getUserData() async {
    return UserViewModel().getUser();
  }

  // Check authentication status
  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      print("Checking authentication: ${value.token}"); // Debug statement
      if (value.token == null || value.token!.isEmpty) {
        print("Navigating to login"); // Debug statement
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RouteName.login);
      } else {
        print("Navigating to home"); // Debug statement
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RouteName.home);
      }
    }).onError((error, stackTrace) {
      print("Error: $error"); // Debug statement
    });
  }
}
